import { Resolver, Query, Mutation, Args, Int } from '@nestjs/graphql';
import { AuthService } from './auth.service';
import { Auth } from './entities/auth.entity';
import { CreateDeviceUuidInput } from './dto/create-device-uuid.input';
import { RequestOtpInput } from './dto/request-otp.input';

@Resolver(() => Auth)
export class AuthResolver {
  constructor(private readonly authService: AuthService) {}

  @Mutation(() => Auth)
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
