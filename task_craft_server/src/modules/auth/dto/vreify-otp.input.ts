import { Field, InputType, Int, PartialType } from '@nestjs/graphql';
import { RequestOtpInput } from './request-otp.input';

@InputType()
export class VerifyOtpInput extends PartialType(RequestOtpInput) {
  @Field(() => Int)
  otp: number;
}
