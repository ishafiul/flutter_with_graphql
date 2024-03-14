import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/module/auth/data/repositories/auth_repository.dart';
import 'package:task_craft/module/auth/data/services/remote/auth_schema.graphql.dart';

class RequestOtp {
  final AuthRepository repository;

  RequestOtp(this.repository);

  Future<Mutation$RequestOtp$reqOtp?> call({
    required Input$RequestOtpInput requestOtpInput,
  }) async {
    return repository.requestOtp(requestOtpInput: requestOtpInput);
  }
}
