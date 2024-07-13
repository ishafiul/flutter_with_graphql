import { Module } from '@nestjs/common';
import { _ConfigService } from './config.service';
import { ConfigModule } from '@nestjs/config';
import { MailerModule } from '@nestjs-modules/mailer';
import { HandlebarsAdapter } from '@nestjs-modules/mailer/dist/adapters/handlebars.adapter';
import { GraphQLModule } from '@nestjs/graphql';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';
import { join } from 'path';
import { GraphQLFormattedError } from 'graphql/error';
import { MongooseModule, MongooseModuleOptions } from '@nestjs/mongoose';
import { ConnectOptions } from 'mongoose';

@Module({
  providers: [_ConfigService],
  imports: [
    ConfigModule.forRoot(),
    MailerModule.forRoot({
      transport: {
        host: process.env.SMTP_HOST,
        port: 465,
        secure: true,
        auth: {
          user: process.env.SMTP_USER,
          pass: process.env.SMTP_PASS,
        },
      },
      defaults: {
        from: '"No Reply" <no-reply@groundcraft.xyz>',
      },
      template: {
        dir: process.cwd() + '/common/mail-templates',
        adapter: new HandlebarsAdapter(),
        options: {
          strict: true,
        },
      },
    }),
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      playground: true,
      autoSchemaFile: join(process.cwd(), 'src/schema.gql'),
      formatError: (error) => {
        const originalError = error.extensions
          ?.originalError as GraphQLFormattedError;
        if (!originalError) {
          return {
            message: error.message,
            extensions: error.extensions,
          };
        }
        return {
          message: originalError.message,
          code: error.extensions.originalError['statusCode'],
          extensions: originalError.extensions,
        };
      },
      definitions: {
        path: join(process.cwd(), 'src/graphql.ts'),
        outputAs: 'class',
      },
    }),
    MongooseModule.forRootAsync({
      imports: [_ConfigModule],
      inject: [_ConfigService],
      useFactory: (appConfigService: _ConfigService) => {
        const options: MongooseModuleOptions = {
          uri: appConfigService.connectionString,
          useNewUrlParser: true,
          useUnifiedTopology: true,
          dbName: 'task_craft',
        } as ConnectOptions;
        return options;
      },
    }),
  ],
  exports: [_ConfigService],
})
export class _ConfigModule {}
