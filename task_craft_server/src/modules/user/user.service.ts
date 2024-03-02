import { Injectable, Logger } from '@nestjs/common';
import { CreateUserInput } from './dto/create-user.input';
import { UpdateUserInput } from './dto/update-user.input';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User, UserDocument, UserModel } from './entities/user.entity';

@Injectable()
export class UserService {
  readonly #logger = new Logger(UserService.name);

  constructor(
    @InjectModel(UserModel.name)
    private readonly userModel: Model<UserDocument>,
  ) {}

  async create(createUserInput: CreateUserInput) {
    return this.userModel.create(createUserInput);
  }

  findAll() {
    return `This action returns all user`;
  }

  async findOne(args: {
    id?: string;
    email?: string;
    deviceUuId?: string;
  }): Promise<User> {
    const { id, email, deviceUuId } = args;
    if (id) {
      return this.userModel.findById(id).exec();
    }
    if (deviceUuId) {
      return this.userModel.findOne({ deviceUuId: deviceUuId }).exec();
    }
    return this.userModel.findOne({ email: email }).exec();
  }

  async update(updateUserInput: UpdateUserInput) {
    await this.userModel.updateOne(
      { _id: updateUserInput.id },
      {
        deviceUuId: updateUserInput.deviceUuId,
      },
    );
    return true;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
