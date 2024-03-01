import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document, Schema as MongooseSchema } from 'mongoose';
import { Field, ObjectType } from '@nestjs/graphql';

export type TaskDocument = Task & Document;

@ObjectType()
@Schema({
  strict: false,
  timestamps: true,
})
export class Task {
  @Field(() => String, {})
  _id: MongooseSchema.Types.ObjectId;
  @Field()
  @Prop({ type: String })
  title: string;
  @Prop({ type: String })
  description: string;
}

const schema = SchemaFactory.createForClass(Task);

export const TaskModel = { name: Task.name, schema };
