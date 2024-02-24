import {Query, Resolver} from '@nestjs/graphql';

@Resolver("String")
export class AppResolver {
    @Query(returns => String)
    health(): string {
        return 'im ok!'
    }
}
