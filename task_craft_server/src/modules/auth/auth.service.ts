import { HttpException, HttpStatus, Injectable, Logger } from '@nestjs/common';
import { CreateDeviceUuidInput } from './dto/create-device-uuid.input';
import { RequestOtpInput } from './dto/request-otp.input';
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
import { RefreshTokenInput } from './dto/refresh-token.input';
import { DeviceDocument, DeviceModel } from './schema/device.shema';
import { Auth, AuthDocument, AuthModel } from './schema/auth.schema';
import { OAuth2Client } from 'google-auth-library';
import { LoginWithGoogleInput } from './dto/login-with-goole.input';
import { LoginWithGoogleEntity } from './entities/login-with-google.entity';

@Injectable()
export class AuthService {
  readonly #logger = new Logger(AuthService.name);

  constructor(
    private readonly userService: UserService,
    private readonly mailerService: MailerService,
    private readonly jwtService: JwtService,
    @InjectModel(OtpModel.name)
    private readonly otpModel: Model<OtpDocument>,
    @InjectModel(DeviceModel.name)
    private readonly deviceModel: Model<DeviceDocument>,
    @InjectModel(AuthModel.name)
    private readonly authModel: Model<AuthDocument>,
  ) {}

  async createDeviceUuid(
    createDeviceUuidInput: CreateDeviceUuidInput,
  ): Promise<DeviceUuId> {
    const existingDevice = await this.deviceModel.findOne({
      fcmToken: createDeviceUuidInput.fcmToken,
    });

    if (existingDevice) {
      await this.deviceModel.updateOne(
        {
          _id: existingDevice._id,
        },
        createDeviceUuidInput,
      );
      return {
        deviceUuId: existingDevice._id.toString(),
      };
    }

    const res = await this.deviceModel.create(createDeviceUuidInput);

    return {
      deviceUuId: res._id.toString(),
    };
  }

  async reqOtp(requestOtpInput: RequestOtpInput) {
    const isDeviceUuId = await this.deviceModel.findOne({
      _id: requestOtpInput.deviceUuid,
    });
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
      });
    }
    // check auth
    const auth = await this.authModel.findOne({
      userId: user._id,
    });
    if (auth) {
      // delete auth
      await this.authModel.deleteOne({
        userId: user._id,
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

  async verifyOtp(verifyOtpInput: VerifyOtpInput): Promise<TokenEntity> {
    const user = await this.userService.findOne({
      email: verifyOtpInput.email,
    });

    if (!user) {
      throw new HttpException('Invalid email', HttpStatus.BAD_REQUEST);
    }
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

    //find on aut
    const auth = await this.authModel.create({
      userId: user._id,
      deviceId: verifyOtpInput.deviceUuid,
      lastRefresh: new Date().toISOString(),
    });
    const jwtPayload: JwtPayload = {
      authID: auth._id,
    };
    return {
      accessToken: this.jwtService.sign(jwtPayload),
    };
  }

  async refreshToken(
    refreshTokenInput: RefreshTokenInput,
  ): Promise<TokenEntity> {
    console.log(refreshTokenInput);

    const auth = await this.authModel.findOne({
      deviceId: refreshTokenInput.deviceUuid,
    });
    if (!auth) {
      throw new HttpException('Invalid device uuid', HttpStatus.BAD_REQUEST);
    }

    const expire = 10;
    const refresh = new Date(auth.lastRefresh);
    const sevenDaysLater = new Date(refresh.getTime());
    sevenDaysLater.setDate(sevenDaysLater.getDate() + expire);
    console.log(sevenDaysLater);
    const now = new Date();
    console.log(now);

    if (now > sevenDaysLater) {
      // delete this auth
      await this.authModel.deleteOne({
        _id: auth._id,
      });
      throw new HttpException('Refresh token expired', HttpStatus.BAD_REQUEST);
    }
    await this.authModel.updateOne(
      {
        _id: auth._id,
      },
      {
        lastRefresh: new Date().toISOString(),
      },
    );

    const jwtPayload: JwtPayload = {
      authID: auth._id.toString(),
    };
    return {
      accessToken: this.jwtService.sign(jwtPayload),
    };
  }

  async loginWithGoogle(
    loginWithGoogleInput: LoginWithGoogleInput,
  ): Promise<LoginWithGoogleEntity> {
    const client = new OAuth2Client();
    const ticket = await client.verifyIdToken({
      idToken: loginWithGoogleInput.googleToken,
      audience: process.env.GOOGLE_CLIENT_ID,
    });
    const payload = ticket.getPayload();
    console.log(payload);
    if (!payload) {
      throw new HttpException('Invalid google token', HttpStatus.BAD_REQUEST);
    }
    if (!payload.email_verified) {
      throw new HttpException('Email not verified', HttpStatus.BAD_REQUEST);
    }
    let user: User;
    user = await this.userService.findOne({
      email: payload.email,
    });

    if (!user) {
      user = await this.userService.create({
        email: payload.email,
      });
    }
    console.log(payload);
    const auth = await this.authModel.findOne({
      userId: user._id,
    });
    if (auth) {
      // delete auth
      await this.authModel.deleteOne({
        userId: user._id,
      });
    }
    //find on aut
    const newAuth = await this.authModel.create({
      userId: user._id,
      deviceId: loginWithGoogleInput.deviceUuid,
      lastRefresh: new Date().toISOString(),
    });
    const jwtPayload: JwtPayload = {
      authID: newAuth._id,
    };
    return {
      accessToken: this.jwtService.sign(jwtPayload),
      userId: user._id,
    };
  }

  async findOne(param: { id: string }) {
    return this.authModel.findById(param.id);
  }

  async logout(user: Auth) {
    await this.authModel.deleteOne(user);
    return {
      deviceUuId: user.deviceId,
    };
  }
}
