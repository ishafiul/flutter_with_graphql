import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateDeviceUuidInput } from './dto/create-device-uuid.input';
import { RequestOtpInput } from './dto/request-otp.input';
import { AES } from 'crypto-js';
import { DeviceUuId } from './entities/device-uuid.entity';
import { UserService } from '../user/user.service';

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
}
