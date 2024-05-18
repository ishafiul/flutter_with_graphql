import 'package:task_craft/core/utils/gql_client.dart';
import 'package:task_craft/module/user/data/services/remote/user_service.graphql.dart';
import 'package:task_craft/module/user/domain/repositories/i_user_repository.dart';

class UserRepository implements IUserRepository {
  @override
  Future<Query$UserMe$userMe?> getUserMe() async {
    final gql = MyGraphQLClient();
    await gql.initClient();
    final client = gql.client;
    final res = await client.query$UserMe();
    MyGraphQLClient.handleGraphQlException(res);
    return res.parsedData?.userMe;
  }
}
