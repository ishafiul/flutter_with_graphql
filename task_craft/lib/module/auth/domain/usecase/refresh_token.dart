import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/module/auth/data/repositories/auth_repository.dart';
import 'package:task_craft/module/auth/data/services/remote/auth_schema.graphql.dart';

class RefreshAccessToken {
  final AuthRepository repository;

  RefreshAccessToken(this.repository);

  Future<Mutation$RefreshToken$refreshToken?> call({
    required Input$RefreshTokenInput refreshTokenInput,
  }) async {
    return repository.refreshToken(refreshTokenInput: refreshTokenInput);
  }
}
