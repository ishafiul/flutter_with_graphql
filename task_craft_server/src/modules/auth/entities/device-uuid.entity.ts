import { Field, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class DeviceUuId {
  @Field(() => String, { description: 'Secret token for current device' })
  deviceUuId: string;
}
