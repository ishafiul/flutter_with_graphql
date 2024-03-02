import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateDeviceUuidInput } from './dto/create-device-uuid.input';
import { RequestOtpInput } from './dto/request-otp.input';
import { AES, enc } from 'crypto-js';
import { DeviceUuId } from './entities/device-uuid.entity';
import { UserService } from '../user/user.service';
import { MailerService } from '@nestjs-modules/mailer';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { OtpDocument, OtpModel } from './schema/otp.schema';
import { generateOtp } from '../../common/utils/function.utils';
import { User } from '../user/entities/user.entity';
import { VerifyOtpInput } from './dto/vreify-otp.input';
import { JwtPayload } from '../../common/model/jwt-payload.model';
import { TokenEntity } from './entities/token.entity';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
  constructor(
    private readonly userService: UserService,
    private readonly mailerService: MailerService,
    private readonly jwtService: JwtService,
    @InjectModel(OtpModel.name)
    private readonly otpModel: Model<OtpDocument>,
  ) {}

  async reqOtp(requestOtpInput: RequestOtpInput) {
    const DeviceUuIdBytes = AES.decrypt(
      requestOtpInput.deviceUuid,
      process.env.HASH_KEY!,
    );
    const isDeviceUuId = DeviceUuIdBytes.toString(enc.Utf8);

    if (!isDeviceUuId) {
      throw new HttpException('Device uuid invalid ', HttpStatus.BAD_REQUEST);
    }
    const oldOtp = await this.otpModel.findOne({
      email: requestOtpInput.email,
      deviceUuId: requestOtpInput.deviceUuid,
    });
    if (oldOtp) {
      await this.otpModel.deleteOne({
        email: requestOtpInput.email,
        deviceUuId: requestOtpInput.deviceUuid,
      });
    }
    let user: User;
    user = await this.userService.findOne({
      email: requestOtpInput.email,
    });
    if (!user) {
      user = await this.userService.create({
        email: requestOtpInput.email,
        deviceUuId: requestOtpInput.deviceUuid,
      });
    }
    await this.userService.update({
      deviceUuId: requestOtpInput.deviceUuid,
      id: user._id.toString(),
    });
    const otp = generateOtp(5);

    await this.otpModel.create({
      email: requestOtpInput.email,
      otp,
      deviceUuId: requestOtpInput.deviceUuid,
    });
    await this.mailerService.sendMail({
      to: requestOtpInput.email,
      subject: 'OTP',
      template: 'sendOtp',
      context: {
        otp: otp,
      },
    });
    return user;
  }

  createDeviceUuid(createDeviceUuidInput: CreateDeviceUuidInput): DeviceUuId {
    return {
      deviceUuId: AES.encrypt(
        JSON.stringify({ createDeviceUuidInput }),
        process.env.HASH_KEY!,
      ).toString(),
    };
  }

  async verifyOtp(verifyOtpInput: VerifyOtpInput): Promise<TokenEntity> {
    const otp = await this.otpModel.findOne({
      email: verifyOtpInput.email,
      otp: verifyOtpInput.otp,
      deviceUuId: verifyOtpInput.deviceUuid,
    });
    if (!otp) {
      throw new HttpException('Invalid otp', HttpStatus.BAD_REQUEST);
    }
    await this.otpModel.deleteOne({
      email: verifyOtpInput.email,
      otp: verifyOtpInput.otp,
      deviceUuId: verifyOtpInput.deviceUuid,
    });

    const jwtPayload: JwtPayload = {
      uuid: otp.deviceUuId,
      deviceUuId: otp.deviceUuId,
    };
    return {
      accessToken: this.jwtService.sign(jwtPayload),
    };
  }
}
