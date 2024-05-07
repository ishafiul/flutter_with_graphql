import { Field, InputType } from '@nestjs/graphql';

@InputType()
export class RefreshTokenInput {
  @Field(() => String, { description: 'Device UuId' })
  deviceUuid: string;
}
