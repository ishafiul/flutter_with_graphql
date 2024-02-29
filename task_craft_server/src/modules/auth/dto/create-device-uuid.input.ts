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
  })
  osName?: string;
  @Field(() => String, { description: 'Device Os Name. ' })
  osVersion?: string;
  @Field(() => String, { description: 'Device Os Version' })
  deviceModel?: string;

  @Field(() => Boolean, { description: 'Physical or emulator' })
  isPhysicalDevice?: boolean;

  @Field(() => String, { description: 'Client App Version' })
  appVersion?: string;

  @Field(() => LocationInput, { description: 'Uer Current Location. ' })
  location?: LocationInput;
  @Field(() => String, { description: 'User Ip Address' })
  ipAddress?: string;
}
