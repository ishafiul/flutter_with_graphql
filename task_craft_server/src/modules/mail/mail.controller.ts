import {
  Controller,
  Post,
  Body,
  UsePipes,
  ValidationPipe,
  UseGuards,
} from '@nestjs/common';
import { MailService } from './mail.service';
import { SendEmailDto } from './dto/send-mail.dto';
import { ApiTokenGuard } from '../../guards/api-token.guard';

@Controller('mail')
export class MailController {
  constructor(private readonly mailService: MailService) {}

  @Post()
  @UsePipes(new ValidationPipe({ whitelist: true, forbidNonWhitelisted: true }))
  @UseGuards(ApiTokenGuard)
  create(@Body() sendEmailDto: SendEmailDto) {
    return this.mailService.create(sendEmailDto);
  }
}
