import {
  IsEmail,
  ValidateNested,
  IsObject,
  IsNotEmpty,
  IsOptional,
  IsString,
} from 'class-validator';
import { Type } from 'class-transformer';
import { OnlyOneType } from '../../../decorator/only-one-type.decorator';
import { NoDuplicateKeys } from '../../../decorator/no-dublicate-key.decoration';
class Otp {
  @IsString()
  @IsNotEmpty()
  readonly otpCode: string;

  @IsString()
  @IsOptional()
  readonly websiteUrl?: string;

  @IsString()
  @IsOptional()
  readonly companyName?: string;
}
class OtpType {
  @IsString()
  @IsNotEmpty()
  readonly otpCode: string;

  @IsString()
  @IsOptional()
  readonly websiteUrl?: string;

  @IsString()
  @IsOptional()
  readonly companyName?: string;
}

class PromoType {
  @IsObject()
  @IsOptional()
  readonly promo?: Record<string, any>;
}

class NotificationsType {
  @IsObject()
  @IsOptional()
  readonly notifications?: Record<string, any>;
}

class TypeDto {
  @ValidateNested()
  @Type(() => OtpType)
  readonly otp?: OtpType;

  @ValidateNested()
  @Type(() => PromoType)
  readonly promo?: PromoType;

  @ValidateNested()
  @Type(() => NotificationsType)
  readonly notifications?: NotificationsType;
}

export class SendEmailDto {
  @IsEmail()
  @IsNotEmpty()
  readonly to: string;

  @ValidateNested()
  @IsNotEmpty()
  @Type(() => TypeDto)
  @OnlyOneType({
    message: 'Exactly one type must be provided and cannot be null',
  })
  @NoDuplicateKeys()
  readonly type: TypeDto;
}
