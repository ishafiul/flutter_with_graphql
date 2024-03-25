import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_craft/bootstrap.dart';
import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/core/service/local/app_state.dart';
import 'package:task_craft/core/utils/app_state_collection_isar.dart';
import 'package:task_craft/module/auth/data/repositories/auth_repository.dart';
import 'package:task_craft/module/auth/domain/usecase/verify_otp.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final AuthRepository repository;

  VerifyOtpCubit({required this.repository}) : super(VerifyOtpInitial());

  Future<void> verifyOtp({
    required int otp,
    required String email,
    required String deviceUuid,
    required String userId,
  }) async {
    emit(VerifyOtpLoading());
    final useCase = VerifyOtp(repository);
    final result = await useCase.call(
      verifyOtpInput: Input$VerifyOtpInput(
        otp: otp,
        email: email,
        deviceUuid: deviceUuid,
      ),
    );
    if (result?.accessToken != null) {
      final appState = AppStateService();
      await appState.initLocalDbUser(User());
      await appState.updateAccessToken(result!.accessToken);
      await appState.updateDeviceUuid(deviceUuid);
      await appState.updateUserID(userId);
      emit(VerifyOtpSuccess());
    } else {
      emit(VerifyOtpError(message: 'Something went wrong'));
    }
  }
}
