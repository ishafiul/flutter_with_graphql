import 'package:arcade/arcade.dart';
import 'package:reels/core/env.dart';
import 'package:reels/core/init.dart';

Future<void> main() async {
  return runServer(port: Env.port, init: init);
}
