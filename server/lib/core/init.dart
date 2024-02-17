import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:reels/core/init.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> init() async {
  await getIt.reset();
  getIt.init();
}
