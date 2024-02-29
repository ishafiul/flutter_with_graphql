import { Module } from '@nestjs/common';
import { TaskService } from './task.service';
import { TaskResolver } from './task.resolver';
import { MongooseModule } from '@nestjs/mongoose';
import { TaskModel } from './schema/task.schema';

const MongooseModels = MongooseModule.forFeature([TaskModel]);

@Module({
  providers: [TaskResolver, TaskService],
  imports: [MongooseModels],
})
export class TaskModule {}
