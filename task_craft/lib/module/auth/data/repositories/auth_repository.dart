import 'package:task_craft/bootstrap.dart';
import 'package:task_craft/core/schema.graphql.dart';
import 'package:task_craft/core/utils/gql_client.dart';
import 'package:task_craft/module/auth/data/services/remote/auth_schema.graphql.dart';
import 'package:task_craft/module/auth/domain/repositories/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<Mutation$CreateDeviceUuid$createDeviceUuid?> createDeviceUuid({
    required Input$CreateDeviceUuidInput deviceInfo,
  }) async {
    final gql = MyGraphQLClient();
    await gql.initClient();
    final client = gql.client;
    final res = await client.mutate$CreateDeviceUuid(
      Options$Mutation$CreateDeviceUuid(
        variables: Variables$Mutation$CreateDeviceUuid(
          deviceInfo: deviceInfo,
        ),
      ),
    );
    logger.t(res);
    return res.parsedData?.createDeviceUuid;
  }

  @override
  Future<Mutation$RefreshToken$refreshToken?> refreshToken({
    required Input$RefreshTokenInput refreshTokenInput,
  }) async {
    final gql = MyGraphQLClient();
    await gql.initClient();
    final client = gql.client;
    final res = await client.mutate$RefreshToken(
      Options$Mutation$RefreshToken(
        variables: Variables$Mutation$RefreshToken(
          refreshTokenInput: refreshTokenInput,
        ),
      ),
    );
    return res.parsedData?.refreshToken;
  }

  @override
  Future<Mutation$RequestOtp$reqOtp?> requestOtp({
    required Input$RequestOtpInput requestOtpInput,
  }) async {
    final gql = MyGraphQLClient();
    await gql.initClient();
    final client = gql.client;
    final res = await client.mutate$RequestOtp(
      Options$Mutation$RequestOtp(
        variables:
            Variables$Mutation$RequestOtp(requestOtpInput: requestOtpInput),
      ),
    );
    return res.parsedData?.reqOtp;
  }

  @override
  Future<Mutation$VerifyOtp$verifyOtp?> verifyOtp({
    required Input$VerifyOtpInput verifyOtpInput,
  }) async {
    final gql = MyGraphQLClient();
    await gql.initClient();
    final client = gql.client;
    final res = await client.mutate$VerifyOtp(
      Options$Mutation$VerifyOtp(
        variables: Variables$Mutation$VerifyOtp(otpVerify: verifyOtpInput),
      ),
    );
    return res.parsedData?.verifyOtp;
  }

  @override
  Future<Mutation$LoginWithGoogle$loginWithGoogle?> loginWithGoogle({
    required Input$LoginWithGoogleInput loginWithGoogleInput,
  }) async {
    final gql = MyGraphQLClient();
    await gql.initClient();
    final client = gql.client;
    final res = await client.mutate$LoginWithGoogle(
      Options$Mutation$LoginWithGoogle(
        variables: Variables$Mutation$LoginWithGoogle(
          loginWithGoogleInput: loginWithGoogleInput,
        ),
      ),
    );
    return res.parsedData?.loginWithGoogle;
  }
}
