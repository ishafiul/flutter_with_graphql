import { InputType, Field } from '@nestjs/graphql';

@InputType()
export class LoginWithGoogleInput {
  @Field(() => String, {
    description: 'User Valid Email. OTP will send there',
  })
  googleToken: string;

  @Field(() => String, {
    description: 'this system generated device id',
  })
  deviceUuid: string;
}
