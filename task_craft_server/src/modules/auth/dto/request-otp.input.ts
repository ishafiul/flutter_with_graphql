import { InputType, Field } from '@nestjs/graphql';

@InputType()
export class RequestOtpInput {
  @Field(() => String, {
    description: 'User Valid Email. OTP will send there',
  })
  email: string;

  @Field(() => String, {
    description: 'this system generated device id',
  })
  deviceUuid: string;
}
