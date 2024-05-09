import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/module/auth/data/services/remote/auth_schema.graphql.dart';
import 'package:task_craft/module/auth/domain/repositories/i_auth_repository.dart';

class LoginWithGoogle {
  final IAuthRepository repository;

  LoginWithGoogle(this.repository);

  Future<Mutation$LoginWithGoogle$loginWithGoogle?> call({
    required Input$LoginWithGoogleInput loginWithGoogleInput,
  }) async {
    return repository.loginWithGoogle(
      loginWithGoogleInput: loginWithGoogleInput,
    );
  }
}
