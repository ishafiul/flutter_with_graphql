import { IsString } from 'class-validator';

export class JwtPayload {
  @IsString()
  authID: string;
}
