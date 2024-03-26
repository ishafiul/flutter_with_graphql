import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { GqlExecutionContext } from '@nestjs/graphql';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class RefreshAuthGuard implements CanActivate {
  constructor(private jwtService: JwtService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const ctx = GqlExecutionContext.create(context);
    const authHeader = ctx.getContext().req.headers['authorization'];
    let token: string | null = null;

    if (authHeader && authHeader.startsWith('bearer ')) {
      token = authHeader.substring(7); // Removing 'Bearer ' prefix
    }

    if (!token) {
      return false;
    }

    const isValid = this.jwtService.verify(token, {
      secret: process.env.JWT_SECRECT,
      ignoreExpiration: true,
    });
    return isValid;
  }
}
