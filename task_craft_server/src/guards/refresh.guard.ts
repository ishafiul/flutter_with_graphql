import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { GqlExecutionContext } from '@nestjs/graphql';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class RefreshAuthGuard implements CanActivate {
  constructor(private jwtService: JwtService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const ctx = GqlExecutionContext.create(context);
    const authHeader = ctx.getContext().req.headers['authorization'];
    console.log(authHeader);
    if (!authHeader) {
      return false;
    }
    const isValid = this.jwtService.verify(authHeader, {
      secret: process.env.JWT_SECRECT,
      ignoreExpiration: true,
    });
    return isValid;
  }
}
