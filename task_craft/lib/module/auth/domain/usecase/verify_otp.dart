import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/module/auth/data/repositories/auth_repository.dart';
import 'package:task_craft/module/auth/data/services/remote/auth_schema.graphql.dart';

class VerifyOtp {
  final AuthRepository repository;

  VerifyOtp(this.repository);

  Future<Mutation$VerifyOtp$verifyOtp?> call({
    required Input$VerifyOtpInput verifyOtpInput,
  }) async {
    return repository.verifyOtp(verifyOtpInput: verifyOtpInput);
  }
}
