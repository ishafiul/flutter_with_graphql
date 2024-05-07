import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document, Schema as MongooseSchema } from 'mongoose';
import { Field, ObjectType } from '@nestjs/graphql';
import { EAccessType } from '../../../common/enums/user';
import { IsEnum } from 'class-validator';

export type FilesDocument = Files & Document;

@ObjectType()
@Schema({
  strict: false,
  timestamps: true,
})
export class Files {
  @Field()
  _id: MongooseSchema.Types.ObjectId;

  @Field()
  @Prop({ type: String })
  title: string;

  @Field()
  @Prop({ type: String })
  uploaderId: string;

  @Field()
  @Prop({ type: String, required: true, unique: true })
  key: string;

  @Field()
  @Prop({ type: String })
  mimeType: string;

  @Prop({ type: String, enum: EAccessType, default: EAccessType.PRIVATE })
  @IsEnum(EAccessType)
  accessType: string;
}

const schema = SchemaFactory.createForClass(Files);

export const FilesModel = { name: Files.name, schema };
