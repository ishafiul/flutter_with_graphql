import { Field, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class TokenEntity {
  @Field(() => String, { description: 'Secret token for current device' })
  accessToken: string;
}
