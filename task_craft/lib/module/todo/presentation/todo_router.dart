import 'package:go_router/go_router.dart';
import 'package:task_craft/core/service/local/app_state.dart';
import 'package:task_craft/module/auth/presentation/screens/login_screen.dart';
import 'package:task_craft/module/auth/presentation/screens/verify_otp_screen.dart';
import 'package:task_craft/module/todo/presentation/todo_screen.dart';

/// auth router
final todoRouter = [
  GoRoute(
    path: 'todo',
    name: 'todo',
    builder: (context, state) => const TodoScreen(),
    routes: [],
  ),
];
