import { Injectable } from '@nestjs/common';
import { CreateDeviceUuidInput } from './dto/create-device-uuid.input';
import { RequestOtpInput } from './dto/request-otp.input';

@Injectable()
export class AuthService {
  reqOtp(requestOtpInput: RequestOtpInput) {
    return 'This action adds a new auth';
  }

  createDeviceUuid(createDeviceUuidInput: CreateDeviceUuidInput) {
    return 'This action adds a new auth';
  }
}
