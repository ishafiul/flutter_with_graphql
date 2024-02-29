import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

export type TaskDocument = TaskTodo & Document;

@Schema({
  strict: false,
  timestamps: true,
})
export class TaskTodo {
  @Prop({ type: String })
  title: string;
  @Prop({ type: String })
  description: string;
}

const schema = SchemaFactory.createForClass(TaskTodo);

export const TaskModel = { name: TaskTodo.name, schema };
