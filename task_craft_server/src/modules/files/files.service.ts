import {
  BadRequestException,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { FilesDocument, FilesModel } from './entities/file.entity';
import {
  FilePermissionDocument,
  FilePermissionModel,
} from './entities/file-permission.entity';
import { EAccessType, EFilePermission, ERole } from '../../common/enums/user';
import { JwtService } from '@nestjs/jwt';
import { AuthService } from '../auth/auth.service';
import { UserService } from '../user/user.service';
import { getSignedUrl } from '@aws-sdk/s3-request-presigner';
import { GetObjectCommand, S3Client } from '@aws-sdk/client-s3';
import * as process from 'node:process';
import { User } from '../user/entities/user.entity';
import * as mime from 'mime-types';
import { Upload } from '@aws-sdk/lib-storage';

@Injectable()
export class FilesService {
  #s3: S3Client;

  constructor(
    private jwtService: JwtService,
    private readonly authService: AuthService,
    private readonly userService: UserService,
    @InjectModel(FilesModel.name)
    private readonly fileModel: Model<FilesDocument>,
    @InjectModel(FilePermissionModel.name)
    private readonly filePermissionModel: Model<FilePermissionDocument>,
  ) {
    this.#s3 = new S3Client({
      region: 'auto',
      endpoint: `https://${process.env.R2_ACCOUNT_ID}.r2.cloudflarestorage.com`,
      credentials: {
        accessKeyId: process.env.R2_ACCESS_KEY_ID,
        secretAccessKey: process.env.R2_ACCESS_KEY_SECRET,
      },
    });
  }

  async createFile({
    buffer,
    user,
    contentType,
  }: {
    buffer: Buffer;
    user: User;
    contentType: string;
  }) {
    const extension = mime.extension(contentType);
    const fileName = `${user._id}_${Date.now().toString()}.${extension}`;
    console.log(fileName);
    try {
      const parallelUploads3 = new Upload({
        client: this.#s3,
        queueSize: 4, // optional concurrency configuration
        leavePartsOnError: false, // optional manually handle dropped parts
        params: {
          Bucket: process.env.R2_BUCKET,
          Key: fileName,
          Body: buffer,
          ContentType: contentType,
        },
      });

      parallelUploads3.on('httpUploadProgress', (progress) => {
        console.log(progress);
      });

      await parallelUploads3.done();
    } catch (error) {
      console.error(error);
      throw new Error('Failed to upload file');
    }
    // create database encty for this file
    const file = await this.fileModel.create({
      title: fileName,
      key: fileName,
      accessType: EAccessType.PRIVATE,
      mimeType: contentType,
      uploaderId: user._id,
    });

    /// create FilePermissionModel databae entry for this file for mongodb
    await this.filePermissionModel.create({
      fileId: file._id,
      userId: user._id,
      permissions: [EFilePermission.READ],
    });
    return file;
  }

  findAll() {
    return `This action returns all files`;
  }

  async findOne(key: string, token?: string): Promise<string> {
    return this.getFile(key, [EFilePermission.READ], token);
  }

  private async getFile(
    key: string,
    requiredPermissions: EFilePermission[],
    token?: string,
  ): Promise<string> {
    const file = await this.fileModel.findOne({ key });
    if (!file) {
      throw new BadRequestException('File not found');
    }

    if (file.accessType === EAccessType.PRIVATE) {
      if (!token) {
        throw new UnauthorizedException();
      }

      const payload = await this.jwtService.verifyAsync(token, {
        secret: process.env.JWT_SECRECT,
      });

      const auth = await this.authService.findOne({ id: payload.authID });
      if (!auth) {
        throw new UnauthorizedException();
      }

      const user = await this.userService.findOne({ id: auth.userId });
      if (!user) {
        throw new UnauthorizedException();
      }

      if (user.role !== ERole.ADMIN && user.role !== ERole.SUPER_ADMIN) {
        const permission = await this.filePermissionModel.findOne({
          userId: user._id,
          fileId: file._id,
        });

        if (!permission) {
          throw new UnauthorizedException();
        }

        for (const requiredPermission of requiredPermissions) {
          if (!permission.permissions.includes(requiredPermission)) {
            throw new UnauthorizedException();
          }
        }
      }
    }

    return this.getSignUrl(key);
  }

  private async getSignUrl(key: string): Promise<string> {
    const command = new GetObjectCommand({
      Bucket: process.env.R2_BUCKET,
      Key: key,
    });
    return await getSignedUrl(this.#s3, command, { expiresIn: 3600 });
  }
}
