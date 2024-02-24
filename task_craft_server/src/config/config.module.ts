import { Module } from '@nestjs/common';
import { _ConfigService } from './config.service';
import {ConfigModule} from '@nestjs/config';

@Module({
    providers: [_ConfigService,],
    imports: [ConfigModule.forRoot()],
    exports: [_ConfigService],
})
export class _ConfigModule {}
