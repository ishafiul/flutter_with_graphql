import { IsString } from 'class-validator';

export class JwtPayload {
  @IsString()
  uuid: string;

  @IsString()
  deviceUuId: string;
}
