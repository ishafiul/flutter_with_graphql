import { Injectable } from '@nestjs/common';
import { CreateTaskInput } from './dto/create-task.input';
import { UpdateTaskInput } from './dto/update-task.input';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { TaskDocument, TaskModel } from './schema/task.schema';

@Injectable()
export class TaskService {
  constructor(
    @InjectModel(TaskModel.name)
    private readonly taskModel: Model<TaskDocument>,
  ) {}

  async create(createTaskInput: CreateTaskInput) {
    return await this.taskModel.create({
      description: createTaskInput.description,
      title: createTaskInput.title,
    });
  }

  async findAll() {
    return this.taskModel.find({});
  }

  findOne(id: string) {
    return this.taskModel.findById(id);
  }

  update(id: string, updateTaskInput: UpdateTaskInput) {
    return this.taskModel.updateOne({
      id,
      title: updateTaskInput.title,
      description: updateTaskInput.description,
    });
  }

  async remove(id: string) {
    const data = await this.taskModel.findById(id);
    await this.taskModel.deleteOne({ _id: id });
    return data;
  }
}
