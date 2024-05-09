import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/core/utils/funtions.dart';
import 'package:task_craft/module/auth/data/services/remote/oauth_service.dart';
import 'package:task_craft/module/auth/domain/repositories/i_auth_repository.dart';
import 'package:task_craft/module/auth/domain/usecase/create_device_uuid.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  final IAuthRepository _repository;

  GoogleAuthCubit(this._repository) : super(GoogleAuthInitial());

  Future<void> googleLogin() async {
    emit(GoogleAuthLoading());
    final token = await signInWithGoogle();
    final createDeviceUuid = CreateDeviceUuid(_repository);
    final deviceInfo = await rawDeviceInfo();
    final deviceUuid = await createDeviceUuid.call(
      deviceInfo: deviceInfo,
    );

    if (deviceUuid?.deviceUuId == null) {
      emit(
        GoogleAuthError(
          message: 'something went wrong creating device uuid',
        ),
      );
    }
    if (token == null) {
      emit(GoogleAuthError(message: "Google sign in failed!"));
      return;
    }

    await _repository.loginWithGoogle(
      loginWithGoogleInput: Input$LoginWithGoogleInput(
        googleToken: token,
        deviceUuid: deviceUuid!.deviceUuId,
      ),
    );
    emit(GoogleAuthSuccess());
  }
}
