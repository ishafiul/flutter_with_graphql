import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthResolver } from './auth.resolver';
import { JwtModule } from '@nestjs/jwt';
import { JwtStrategy } from '../../guards/jwt.strategy';
import { UserService } from '../user/user.service';
import { MongooseModule } from '@nestjs/mongoose';
import { UserModel } from '../user/entities/user.entity';
import { OtpModel } from './schema/otp.schema';

const MongooseModels = MongooseModule.forFeature([UserModel, OtpModel]);

@Module({
  providers: [AuthResolver, AuthService, JwtStrategy, UserService],
  imports: [
    JwtModule.register({
      secret: process.env.JWT_SECRECT,
      signOptions: { expiresIn: '7d' },
    }),
    MongooseModels,
  ],
  exports: [AuthService, JwtStrategy, JwtModule],
})
export class AuthModule {}
