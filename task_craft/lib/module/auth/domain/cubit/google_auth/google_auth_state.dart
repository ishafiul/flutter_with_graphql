part of 'google_auth_cubit.dart';

@immutable
sealed class GoogleAuthState {}

final class GoogleAuthInitial extends GoogleAuthState {}

final class GoogleAuthLoading extends GoogleAuthState {}

final class GoogleAuthSuccess extends GoogleAuthState {}

final class GoogleAuthError extends GoogleAuthState {
  final String message;

  GoogleAuthError({required this.message});
}
