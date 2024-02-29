import { ObjectType, Field } from '@nestjs/graphql';

@ObjectType()
export class Task {
  @Field()
  _id: string;

  @Field()
  title: string;

  @Field()
  description: string;
}
