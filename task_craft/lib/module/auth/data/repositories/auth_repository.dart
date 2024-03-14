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
}
