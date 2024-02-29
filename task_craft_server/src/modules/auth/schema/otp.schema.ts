import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type OtpDocument = Otp & Document;

@Schema({
  strict: false,
  timestamps: true,
})
export class Otp {
  @Prop({ type: String, isRequired: true })
  otp: string;
  @Prop({ type: String, isRequired: true })
  email: string;
  @Prop({ type: String, isRequired: true })
  deviceUuId: string;
  @Prop({ type: String, isRequired: true })
  expiredAt: string;
}

const schema = SchemaFactory.createForClass(Otp);

export const OtpModel = { name: Otp.name, schema };
