import { ExtractJwt, Strategy } from 'passport-jwt';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import * as process from 'process';
import { JwtPayload } from '../common/model/jwt-payload.model';
import { AuthService } from '../modules/auth/auth.service';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(private readonly authService: AuthService) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: process.env.JWT_SECRECT,
    });
  }

  async validate(payload: JwtPayload) {
    const auth = await this.authService.findOne({
      id: payload.authID,
    });
    if (!auth) {
      throw new UnauthorizedException();
    }
    return auth;
  }
}
