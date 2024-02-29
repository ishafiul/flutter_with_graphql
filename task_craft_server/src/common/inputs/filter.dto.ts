import { IsOptional, IsString } from 'class-validator';

export class FiltersDto {
  @IsString()
  @IsOptional()
  pageNo?: number;

  @IsString()
  @IsOptional()
  limitPerPage?: number;
}
