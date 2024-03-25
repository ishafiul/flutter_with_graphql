import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';
import { LocationInput } from '../../../common/inputs/location.dto';

export type DeviceDocument = Device & Document;

@Schema({
  strict: false,
  timestamps: true,
})
export class Device {
  @Prop({ type: String, isRequired: false })
  deviceType: string;
  @Prop({ type: String, isRequired: false })
  osName?: string;
  @Prop({ type: String, isRequired: false })
  osVersion?: string;
  @Prop({ type: String, isRequired: false })
  deviceModel?: string;
  @Prop({ type: String, isRequired: false })
  isPhysicalDevice?: boolean;
  @Prop({ type: String, isRequired: false })
  appVersion?: string;

  @Prop({ type: LocationInput, isRequired: false })
  location?: LocationInput;
  @Prop({ type: String, isRequired: false })
  ipAddress?: string;

  @Prop({ type: String, isRequired: true })
  fcmToken: string;
}

const schema = SchemaFactory.createForClass(Device);

export const DeviceModel = { name: Device.name, schema };
