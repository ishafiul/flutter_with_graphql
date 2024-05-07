import { Module } from '@nestjs/common';
import { FilesService } from './files.service';
import { FilesController } from './files.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { UserModel } from '../user/entities/user.entity';
import { OtpModel } from '../auth/schema/otp.schema';
import { DeviceModel } from '../auth/schema/device.shema';
import { AuthModel } from '../auth/schema/auth.schema';
import { JwtModule } from '@nestjs/jwt';
import { AuthService } from '../auth/auth.service';
import { JwtStrategy } from '../../guards/jwt.strategy';
import { UserService } from '../user/user.service';
import { FilePermissionModel } from './entities/file-permission.entity';
import { FilesModel } from './entities/file.entity';

const MongooseModels = MongooseModule.forFeature([
  UserModel,
  OtpModel,
  DeviceModel,
  AuthModel,
  FilePermissionModel,
  FilesModel,
]);

@Module({
  controllers: [FilesController],
  imports: [JwtModule.register({}), MongooseModels],
  providers: [FilesService, AuthService, JwtStrategy, UserService],
})
export class FilesModule {}
