import { Injectable } from '@nestjs/common';
import { CreateDeviceUuidInput } from './dto/create-device-uuid.input';
import { RequestOtpInput } from './dto/request-otp.input';
import { AES } from 'crypto-js';
import { DeviceUuId } from './entities/device-uuid.entity';

@Injectable()
export class AuthService {
  reqOtp(requestOtpInput: RequestOtpInput) {
    return 'This action adds a new auth';
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
