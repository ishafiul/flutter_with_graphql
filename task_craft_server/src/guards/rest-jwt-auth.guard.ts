import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { JwtPayload } from '../common/model/jwt-payload.model';
import { AuthService } from '../modules/auth/auth.service';
import { UserService } from '../modules/user/user.service';
import { extractTokenFromHeader } from '../common/utils/function.utils';

@Injectable()
export class RestAuthGuard implements CanActivate {
  constructor(
    private jwtService: JwtService,
    private readonly authService: AuthService,
    private readonly userService: UserService,
  ) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();
    try {
      await extractTokenFromHeader(request);
    } catch (e) {
      throw new UnauthorizedException();
    }
    const token = extractTokenFromHeader(request);
    if (!token) {
      throw new UnauthorizedException();
    }
    const payload: JwtPayload = await this.jwtService.verifyAsync(token, {
      secret: process.env.JWT_SECRECT,
    });
    const auth = await this.authService.findOne({
      id: payload.authID,
    });
    if (!auth) {
      throw new UnauthorizedException();
    }
    const user = await this.userService.findOne({
      id: auth.userId,
    });
    if (!user) {
      throw new UnauthorizedException();
    }
    request['user'] = user;
    return true;
  }
}
