import { Injectable } from '@nestjs/common';
import { SendEmailDto } from './dto/send-mail.dto';
import { MailerService } from '@nestjs-modules/mailer';

@Injectable()
export class MailService {
  constructor(private readonly mailerService: MailerService) {}

  async create(sendEmailDto: SendEmailDto) {
    if (sendEmailDto.type.otp) {
      await this.#otp(sendEmailDto);
    }
    return 'This action adds a new mail';
  }

  async #otp(sendEmailDto: SendEmailDto) {
    await this.mailerService.sendMail({
      to: sendEmailDto.to,
      subject: 'OTP',
      template: 'sendOtp',
      context: {
        otp: sendEmailDto.type.otp.otpCode,
      },
    });
  }
}
