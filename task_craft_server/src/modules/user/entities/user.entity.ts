import { ObjectType, Field } from '@nestjs/graphql';
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document, Schema as MongooseSchema } from 'mongoose';

export type UserDocument = User & Document;

@ObjectType()
@Schema({
  strict: false,
  timestamps: true,
})
export class User {
  @Field(() => String, {})
  _id: MongooseSchema.Types.ObjectId;
  @Field()
  @Prop({ type: String, isRequired: false })
  firstName?: string;
  @Field()
  @Prop({ type: String, isRequired: false })
  lastName?: string;
  @Field()
  @Prop({ type: String, isRequired: true })
  email: string;
}

const schema = SchemaFactory.createForClass(User);

export const UserModel = { name: User.name, schema };
