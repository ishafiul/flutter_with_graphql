import 'package:task_craft/module/user/data/services/remote/user_service.graphql.dart';
import 'package:task_craft/module/user/domain/repositories/i_user_repository.dart';

class GetUserMe {
  late final IUserRepository _repository;

  GetUserMe({required IUserRepository userRepository}) {
    _repository = userRepository;
  }

  Future<Query$UserMe$userMe?> call() async {
    return _repository.getUserMe();
  }
}
