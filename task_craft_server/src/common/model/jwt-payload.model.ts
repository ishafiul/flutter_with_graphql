import { IsString } from 'class-validator';

export class JwtPayload {
  @IsString()
  userName: string;

  @IsString()
  id: string;
}
