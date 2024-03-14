part of 'request_otp_cubit.dart';

@freezed
class RequestOtpState with _$RequestOtpState {
  const factory RequestOtpState.initial() = _Initial;

  const factory RequestOtpState.loading() = _Loading;

  const factory RequestOtpState.loaded({
    required String email,
  }) = _Loaded;

  const factory RequestOtpState.error({
    required String message,
  }) = _Error;
}
