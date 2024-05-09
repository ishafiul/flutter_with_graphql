import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_craft/module/auth/data/services/remote/oauth_service.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());

  Future<void> googleLogin() async {
    emit(GoogleAuthLoading());
    await signInWithGoogle();
    emit(GoogleAuthSuccess());
  }
}
