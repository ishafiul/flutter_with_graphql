import {
  Module,
} from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AppResolver } from './app.resolver';
import { _ConfigModule } from './config/config.module';
import { TaskModule } from './modules/task/task.module';
import { AuthModule } from './modules/auth/auth.module';
import { UserModule } from './modules/user/user.module';
import { FilesModule } from './modules/files/files.module';

@Module({
  imports: [
    AppModule,
    TaskModule,
    _ConfigModule,
    AuthModule,
    UserModule,
    FilesModule,
  ],
  controllers: [AppController],
  providers: [AppService, AppResolver],
})
export class AppModule {}
