import 'dart:io';

import 'package:arcade/arcade.dart';
import 'package:reels/core/env.dart';
import 'package:reels/core/init.dart';

Future<void> main() async {
  final port = int.tryParse(Platform.environment['PORT'] ?? '') ?? Env.port;
  return runServer(port: port, init: init);
}
