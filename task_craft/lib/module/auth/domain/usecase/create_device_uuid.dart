import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/module/auth/data/repositories/auth_repository.dart';
import 'package:task_craft/module/auth/data/services/remote/auth_schema.graphql.dart';

class CreateDeviceUuid {
  final AuthRepository repository;

  CreateDeviceUuid(this.repository);

  Future<Mutation$CreateDeviceUuid$createDeviceUuid?> call({
    required Input$CreateDeviceUuidInput deviceInfo,
  }) async {
    return repository.createDeviceUuid(deviceInfo: deviceInfo);
  }
}
