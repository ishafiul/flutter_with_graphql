import { ExtractJwt, Strategy } from 'passport-jwt';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import * as process from 'process';
import { JwtPayload } from '../common/model/jwt-payload.model';
import { AuthService } from '../modules/auth/auth.service';
import { UserService } from '../modules/user/user.service';
import { User } from '../modules/user/entities/user.entity';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(
    private readonly authService: AuthService,
    private readonly userService: UserService,
  ) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: process.env.JWT_SECRECT,
    });
  }

  async validate(payload: JwtPayload): Promise<User> {
    const auth = await this.authService.findOne({
      id: payload.authID,
    });
    if (!auth) {
      throw new UnauthorizedException();
    }
    if (!auth) {
      throw new UnauthorizedException();
    }
    const user = await this.userService.findOne({
      id: auth.userId,
    });
    if (!user) {
      throw new UnauthorizedException();
    }
    return user;
  }
}
