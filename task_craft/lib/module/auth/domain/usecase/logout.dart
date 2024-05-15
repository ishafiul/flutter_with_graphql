import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/module/auth/data/repositories/auth_repository.dart';
import 'package:task_craft/module/auth/data/services/remote/auth_schema.graphql.dart';
import 'package:task_craft/module/auth/domain/repositories/i_auth_repository.dart';

class Logout {
  final IAuthRepository _repository;

  Logout(this._repository);

  Future<Query$Logout$logout?> call() async {
    return _repository.logout();
  }
}
