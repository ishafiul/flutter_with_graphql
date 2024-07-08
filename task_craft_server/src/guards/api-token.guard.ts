import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { extractTokenFromHeader } from '../common/utils/function.utils';

@Injectable()
export class ApiTokenGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const request = context.switchToHttp().getRequest<Request>();
    const bearerToken = extractTokenFromHeader(request);

    if (!bearerToken) {
      throw new UnauthorizedException('Bearer token is missing');
    }

    if (bearerToken !== process.env.SERVER_KEY) {
      throw new UnauthorizedException('Invalid token');
    }

    return true;
  }
}
