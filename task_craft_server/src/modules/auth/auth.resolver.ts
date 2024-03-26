import { Resolver, Mutation, Args, Context, Query } from '@nestjs/graphql';
import { AuthService } from './auth.service';
import { Auth } from './entities/auth.entity';
import { CreateDeviceUuidInput } from './dto/create-device-uuid.input';
import { RequestOtpInput } from './dto/request-otp.input';

import { DeviceUuId } from './entities/device-uuid.entity';
import { User } from '../user/entities/user.entity';
import { VerifyOtpInput } from './dto/vreify-otp.input';
import { TokenEntity } from './entities/token.entity';
import { RefreshTokenInput } from './dto/refresh-token.input';
import { UseGuards } from '@nestjs/common';
import { RefreshAuthGuard } from '../../guards/refresh.guard';
import { JwtAuthGuard } from '../../guards/jwt-auth.guard';

@Resolver(() => Auth)
export class AuthResolver {
  constructor(private readonly authService: AuthService) {}

  @Mutation(() => DeviceUuId)
  createDeviceUuid(
    @Args('createDeviceUuidInput') createDeviceUuidInput: CreateDeviceUuidInput,
  ) {
    return this.authService.createDeviceUuid(createDeviceUuidInput);
  }

  @Mutation(() => User)
  reqOtp(@Args('requestOtpInput') requestOtpInput: RequestOtpInput) {
    return this.authService.reqOtp(requestOtpInput);
  }

  @Mutation(() => TokenEntity)
  verifyOtp(@Args('verifyOtpInput') verifyOtpInput: VerifyOtpInput) {
    return this.authService.verifyOtp(verifyOtpInput);
  }

  @UseGuards(RefreshAuthGuard)
  @Mutation(() => TokenEntity)
  refreshToken(
    @Args('refreshTokenInput') refreshTokenInput: RefreshTokenInput,
  ) {
    return this.authService.refreshToken(refreshTokenInput);
  }

  @UseGuards(JwtAuthGuard)
  @Query(() => DeviceUuId)
  async logout(@Context() context) {
    return this.authService.logout(context.req.user);
  }
}
