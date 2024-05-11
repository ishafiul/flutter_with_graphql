import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/core/service/local/app_state.dart';
import 'package:task_craft/core/utils/app_state_collection_isar.dart';
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

    final result = await _repository.loginWithGoogle(
      loginWithGoogleInput: Input$LoginWithGoogleInput(
        googleToken: token,
        deviceUuid: deviceUuid!.deviceUuId,
      ),
    );
    if (result?.accessToken != null) {
      final appState = AppStateService();
      await appState.initLocalDbUser(User());
      await appState.updateAccessToken(result!.accessToken);
      await appState.updateDeviceUuid(deviceUuid.deviceUuId);
      await appState.updateUserID(result.userId);
      emit(GoogleAuthSuccess());
    } else {
      emit(GoogleAuthError(message: 'Something went wrong'));
    }
  }
}
