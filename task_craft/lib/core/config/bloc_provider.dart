import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task_craft/app/app.dart';
import 'package:task_craft/core/snackbar/cubit/snack_bar_cubit.dart';
import 'package:task_craft/module/auth/data/repositories/auth_repository.dart';
import 'package:task_craft/module/auth/domain/cubit/request_otp/request_otp_cubit.dart';

/// [Provider] is a [Singleton] that will provide [List] of [BlocProvider].
/// need to provide [BlocProvider] for those `bloc` or `cubit` that will be available
/// throw out the application. inside [App] widget we wrapped our [MaterialApp]
/// with [MultiBlocProvider] and we are passing those bloc providers.
@Singleton()
class Provider {
  /// [List] of [BlocProvider]
  List<BlocProvider> providers = [
    BlocProvider<SnackBarCubit>(
      create: (BuildContext context) => SnackBarCubit(),
    ),
    BlocProvider<RequestOtpCubit>(
      create: (BuildContext context) =>
          RequestOtpCubit(repository: AuthRepository()),
    ),
  ];
}
