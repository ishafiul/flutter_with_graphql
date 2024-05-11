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
import { LoginWithGoogleInput } from './dto/login-with-goole.input';
import { LoginWithGoogleEntity } from './entities/login-with-google.entity';

@Resolver(() => Auth)
export class AuthResolver {
  constructor(private readonly authService: AuthService) {}

  @Mutation(() => DeviceUuId, {
    description:
      'create device uuid. it will generate a unique device uuid, so that multiple device not be login at a same time with a single use',
  })
  createDeviceUuid(
    @Args('createDeviceUuidInput') createDeviceUuidInput: CreateDeviceUuidInput,
  ) {
    return this.authService.createDeviceUuid(createDeviceUuidInput);
  }

  @Mutation(() => User, {
    description:
      'request otp. it will send otp to user registered email. if user not exist with email, it will create new user',
  })
  reqOtp(@Args('requestOtpInput') requestOtpInput: RequestOtpInput) {
    return this.authService.reqOtp(requestOtpInput);
  }

  @Mutation(() => TokenEntity, {
    description:
      'verify otp. it will verify email and device, if not valid, it will throw error. then it will generate jwt token and refresh token. this endpoint also invalid existing longed in user',
  })
  verifyOtp(@Args('verifyOtpInput') verifyOtpInput: VerifyOtpInput) {
    return this.authService.verifyOtp(verifyOtpInput);
  }

  @Mutation(() => LoginWithGoogleEntity, {
    description:
      'verify otp. it will verify email and device, if not valid, it will throw error. then it will generate jwt token and refresh token. this endpoint also invalid existing longed in user',
  })
  loginWithGoogle(
    @Args('loginWithGoogleInput') loginWithGoogleInput: LoginWithGoogleInput,
  ) {
    return this.authService.loginWithGoogle(loginWithGoogleInput);
  }

  @UseGuards(RefreshAuthGuard)
  @Mutation(() => TokenEntity, {
    description:
      'refresh token. it remove old auth and generate new. and against that it will generate new jwt token',
  })
  refreshToken(
    @Args('refreshTokenInput') refreshTokenInput: RefreshTokenInput,
  ) {
    return this.authService.refreshToken(refreshTokenInput);
  }

  @UseGuards(JwtAuthGuard)
  @Query(() => DeviceUuId, {
    description: 'logout user. it will remove auth and invalidate jwt token',
  })
  async logout(@Context() context) {
    return this.authService.logout(context.req.user);
  }
}
