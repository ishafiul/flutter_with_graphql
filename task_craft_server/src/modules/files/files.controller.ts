import {
  Controller,
  Get,
  Param,
  Res,
  Req,
  Next,
  Query,
  UseGuards,
  BadRequestException,
  Put,
  RawBodyRequest,
} from '@nestjs/common';
import { FilesService } from './files.service';
import { NextFunction, Request, Response } from 'express';
import { createProxyMiddleware } from 'http-proxy-middleware';
import { RestAuthGuard } from '../../guards/rest-jwt-auth.guard';
import * as rawbody from 'raw-body';
import * as mime from 'mime-types';
import { User } from '../user/entities/user.entity';

@Controller('files')
export class FilesController {
  constructor(private readonly filesService: FilesService) {}

  @Put()
  @UseGuards(RestAuthGuard)
  async create(@Req() req: RawBodyRequest<Request>) {
    if (!req.readable) {
      throw new BadRequestException();
    }
    const raw = await rawbody(req);
    console.log(mime.extension(req.headers['content-type']));
    return await this.filesService.createFile({
      buffer: raw,
      user: req.user as User,
      contentType: req.headers['content-type'],
    });
  }

  @Get()
  findAll() {
    return this.filesService.findAll();
  }

  @Get(':key')
  async findOne(
    @Query('token') token: string,
    @Param('key') key: string,
    @Req() req: Request,
    @Res() res: Response,
    @Next() next: NextFunction,
  ) {
    const file = await this.filesService.findOne(key, token);
    const proxy = createProxyMiddleware({
      router: () => {
        return file;
      },
      ignorePath: true,
      changeOrigin: true,
    });
    proxy(req, res, next);
  }

  /* @Patch(':id')
   update(@Param('id') id: string, @Body() updateFileDto: UpdateFileDto) {
     return this.filesService.update(+id, updateFileDto);
   }
 
   @Delete(':id')
   remove(@Param('id') id: string) {
     return this.filesService.remove(+id);
   }*/
}
