import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/module/auth/data/services/remote/auth_schema.graphql.dart';
import 'package:task_craft/module/auth/domain/repositories/i_auth_repository.dart';

class CreateDeviceUuid {
  final IAuthRepository repository;

  CreateDeviceUuid(this.repository);

  Future<Mutation$CreateDeviceUuid$createDeviceUuid?> call({
    required Input$CreateDeviceUuidInput deviceInfo,
  }) async {
    return repository.createDeviceUuid(deviceInfo: deviceInfo);
  }
}
