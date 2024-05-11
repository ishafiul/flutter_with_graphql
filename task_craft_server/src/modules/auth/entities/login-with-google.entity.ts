import { Field, ObjectType } from '@nestjs/graphql';
import { TokenEntity } from './token.entity';
import { Schema as MongooseSchema } from 'mongoose';

@ObjectType()
export class LoginWithGoogleEntity extends TokenEntity {
  @Field(() => String, { description: 'user uuid' })
  userId: MongooseSchema.Types.ObjectId;
}
