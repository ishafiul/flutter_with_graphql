import { ObjectType, Field } from '@nestjs/graphql';
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document, Schema as MongooseSchema } from 'mongoose';
import { ERole } from '../../../common/enums/user';
import { IsEnum } from 'class-validator';

export type UserDocument = User & Document;

@ObjectType()
@Schema({
  strict: false,
  timestamps: true,
})
export class User {
  @Field(() => String, { description: 'user uuid' })
  _id: MongooseSchema.Types.ObjectId;
  @Field({ description: 'user first name. its not required and can be null' })
  @Prop({ type: String, isRequired: false })
  firstName?: string;
  @Field({ description: 'user last name. its not required and can be null' })
  @Prop({ type: String, isRequired: false })
  lastName?: string;
  @Field({
    description:
      'user profile picture (public). its not required and can be null',
  })
  @Prop({
    type: String,
    isRequired: false,
  })
  profilePicture?: string;
  @Field({ description: 'user registered email' })
  @Prop({
    type: String,
    isRequired: true,
  })
  email: string;
  @Prop({ type: String, enum: ERole, default: ERole.USER })
  @IsEnum(ERole)
  role: string;
}

const schema = SchemaFactory.createForClass(User);

export const UserModel = { name: User.name, schema };
