import { Field, InputType } from '@nestjs/graphql';

@InputType()
export class LocationInput {
  @Field(() => String, { description: 'Latitude' })
  lat: string;
  @Field(() => String, { description: 'Longitude' })
  long: string;
}
