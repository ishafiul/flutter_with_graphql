import { Resolver, Mutation, Args } from '@nestjs/graphql';
import { AuthService } from './auth.service';
import { Auth } from './entities/auth.entity';
import { CreateDeviceUuidInput } from './dto/create-device-uuid.input';
import { RequestOtpInput } from './dto/request-otp.input';

import { DeviceUuId } from './entities/device-uuid.entity';

@Resolver(() => Auth)
export class AuthResolver {
  constructor(private readonly authService: AuthService) {}

  @Mutation(() => DeviceUuId)
  createDeviceUuid(
    @Args('createDeviceUuidInput') createDeviceUuidInput: CreateDeviceUuidInput,
  ) {
    return this.authService.createDeviceUuid(createDeviceUuidInput);
  }

  @Mutation(() => Auth)
  reqOtp(@Args('requestOtpInput') requestOtpInput: RequestOtpInput) {
    return this.authService.reqOtp(requestOtpInput);
  }
}
