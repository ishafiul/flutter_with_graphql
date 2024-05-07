import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document, Schema as MongooseSchema } from 'mongoose';
import { Field, ObjectType } from '@nestjs/graphql';
import { EFilePermission } from '../../../common/enums/user';

export type FilePermissionDocument = FilePermission & Document;

@ObjectType()
@Schema({
  strict: false,
  timestamps: true,
})
export class FilePermission {
  @Field()
  _id: MongooseSchema.Types.ObjectId;

  @Field()
  @Prop({ type: String })
  fileId: string;

  @Field()
  @Prop({ type: String })
  userId: string;

  @Field(() => [String])
  @Prop({
    type: [String],
    enum: Object.values(EFilePermission),
    default: [EFilePermission.READ],
  })
  permissions: EFilePermission[];
}

const schema = SchemaFactory.createForClass(FilePermission);

export const FilePermissionModel = { name: FilePermission.name, schema };
