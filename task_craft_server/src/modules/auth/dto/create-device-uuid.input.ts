import { InputType, Field } from '@nestjs/graphql';
import { LocationInput } from '../../../common/inputs/location.dto';

@InputType()
export class CreateDeviceUuidInput {
  @Field(() => String, {
    description: 'User Device Type. Example: IOS, Android, Web',
  })
  deviceType: string;
  @Field(() => String, {
    description: 'User Device Type. Example: Mobile, Tablet, Desktop, Watch',
    nullable: true,
  })
  osName?: string;
  @Field(() => String, { description: 'Device Os Name. ', nullable: true })
  osVersion?: string;
  @Field(() => String, { description: 'Device Os Version', nullable: true })
  deviceModel?: string;

  @Field(() => Boolean, { description: 'Physical or emulator', nullable: true })
  isPhysicalDevice?: boolean;

  @Field(() => String, { description: 'Client App Version', nullable: true })
  appVersion?: string;

  @Field(() => LocationInput, {
    description: 'Uer Current Location. ',
    nullable: true,
  })
  location?: LocationInput;
  @Field(() => String, { description: 'User Ip Address', nullable: true })
  ipAddress?: string;
}
