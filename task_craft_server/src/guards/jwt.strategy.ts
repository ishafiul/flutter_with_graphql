import { ExtractJwt, Strategy } from 'passport-jwt';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import * as process from 'process';
import { JwtPayload } from '../common/model/jwt-payload.model';
import { UserService } from '../modules/user/user.service';
import { Schema as MongooseSchema } from 'mongoose';
@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(private readonly userService: UserService) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: process.env.JWT_SECRECT,
    });
  }

  async validate(payload: JwtPayload) {
    const user = await this.userService.findOne({
      id: payload.uuid,
    });
    if (!user) {
      throw new UnauthorizedException();
    }
    return user;
  }
}
