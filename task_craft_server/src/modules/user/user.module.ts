import { forwardRef, Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserResolver } from './user.resolver';
import { UserModel } from './entities/user.entity';
import { MongooseModule } from '@nestjs/mongoose';

const MongooseModels = MongooseModule.forFeature([UserModel]);

@Module({
  providers: [UserResolver, UserService],
  exports: [UserService],
  imports: [MongooseModels],
})
export class UserModule {}
