import 'package:task_craft/module/user/data/services/remote/user_service.graphql.dart';

abstract class IUserRepository {
  Future<Query$UserMe$userMe?> getUserMe();
}
