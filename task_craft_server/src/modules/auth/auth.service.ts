import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateDeviceUuidInput } from './dto/create-device-uuid.input';
import { RequestOtpInput } from './dto/request-otp.input';
import { AES } from 'crypto-js';
import { DeviceUuId } from './entities/device-uuid.entity';
import { UserService } from '../user/user.service';

@Injectable()
export class AuthService {
  constructor(private readonly userService: UserService) {}

  async reqOtp(requestOtpInput: RequestOtpInput) {
    await this.userService.findOne({ email: requestOtpInput.email });
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
