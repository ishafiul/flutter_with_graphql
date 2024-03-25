import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type AuthDocument = Auth & Document;

@Schema({
  strict: false,
  timestamps: true,
})
export class Auth {
  @Prop({ type: String, isRequired: true })
  userId: string;
  @Prop({ type: String, isRequired: true })
  deviceId: string;
  @Prop({ type: String, isRequired: true })
  lastRefresh: string;
}

const schema = SchemaFactory.createForClass(Auth);

export const AuthModel = { name: Auth.name, schema };
