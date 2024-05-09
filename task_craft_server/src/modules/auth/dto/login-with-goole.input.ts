import { InputType, Field } from '@nestjs/graphql';

@InputType()
export class LoginWithGoogleInput {
  @Field(() => String, {
    description: 'User Valid Email. OTP will send there',
  })
  googleToken: string;
}
