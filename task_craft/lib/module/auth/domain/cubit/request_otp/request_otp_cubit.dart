import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:meta/meta.dart';
import 'package:task_craft/bootstrap.dart';
import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/core/utils/funtions.dart';
import 'package:task_craft/module/auth/data/repositories/auth_repository.dart';
import 'package:task_craft/module/auth/domain/usecase/create_device_uuid.dart';
import 'package:task_craft/module/auth/domain/usecase/request_otp.dart';

part 'request_otp_state.dart';

class RequestOtpCubit extends Cubit<RequestOtpState> {
  final AuthRepository repository;

  RequestOtpCubit({required this.repository}) : super(RequestOtpInitial());

  Future<void> requestOtp({required String email}) async {
    emit(RequestOtpLoading());
    final createDeviceUuid = CreateDeviceUuid(repository);
    final requestOtp = RequestOtp(repository);
    final deviceInfo = await rawDeviceInfo();
    final deviceUuid = await createDeviceUuid.call(
      deviceInfo: deviceInfo,
    );
    logger.t(deviceUuid);
    if (deviceUuid?.deviceUuId == null) {
      emit(
        RequestOtpFailure(
          message: 'something went wrong creating device uuid',
        ),
      );
      return;
    }
    final requestOtpRes = await requestOtp.call(
      requestOtpInput: Input$RequestOtpInput(
        email: email,
        deviceUuid: deviceUuid!.deviceUuId,
      ),
    );
    if (requestOtpRes?.email == null) {
      emit(
        RequestOtpFailure(
          message: 'something went wrong requesting otp',
        ),
      );
      return;
    }
    emit(RequestOtpSuccess(email: email, deviceUuid: deviceUuid.deviceUuId,userId: requestOtpRes!.$_id));
  }
}
