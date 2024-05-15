import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:task_craft/app/app_router.dart';
import 'package:task_craft/core/service/local/app_state.dart';
import 'package:task_craft/module/auth/domain/repositories/i_auth_repository.dart';
import 'package:task_craft/module/auth/domain/usecase/logout.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final IAuthRepository _repository;

  LogoutCubit({required IAuthRepository repository})
      : _repository = repository,
        super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    final useCase = Logout(_repository);
    final result = await useCase.call();
    if (result?.deviceUuId == null) {
      final appState = AppStateService();
      await appState.clearAll();
      await FirebaseAuth.instance.signOut();
      router.go('/auth/login');
      emit(LogoutSuccess());
    } else {
      emit(LogoutFailed(message: "Logout Failed"));
    }
  }
}
