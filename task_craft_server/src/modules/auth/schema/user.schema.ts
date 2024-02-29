import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type UserDocument = User & Document;

@Schema({
  strict: false,
  timestamps: true,
})
export class User {
  @Prop({ type: String, isRequired: false })
  firstName?: string;
  @Prop({ type: String, isRequired: false })
  lastName?: string;
  @Prop({ type: String, isRequired: true })
  email: string;
  @Prop({ type: String, isRequired: true })
  deviceUuId: string;
}

const schema = SchemaFactory.createForClass(User);

export const UserModel = { name: User.name, schema };
