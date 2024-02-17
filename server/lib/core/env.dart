import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
class Env {
  @EnviedField(varName: 'PORT')
  static const int port = _Env.port;

  @EnviedField(varName: 'DATABASE_URL')
  static const String databaseUrl = _Env.databaseUrl;

  @EnviedField(varName: 'JWT_SECRET')
  static const String accessTokenSecret = _Env.accessTokenSecret;
}
