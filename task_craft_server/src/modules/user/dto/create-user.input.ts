import { InputType, Field } from '@nestjs/graphql';

@InputType()
export class CreateUserInput {
  @Field(() => String, {
    description:
      'this is user email. its one time use only. can be replaced. if user exist with this email, then it will not going to create new user. it will just use existing user info ',
  })
  email: string;
}
