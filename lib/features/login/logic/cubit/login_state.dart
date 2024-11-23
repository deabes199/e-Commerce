part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess({required this.token});
}

final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

////////////////////////////////////////
final class ForgotPasswordLoading extends LoginState {}

final class ForgotPasswordSuccess extends LoginState {}

final class ForgotPasswordFailure extends LoginState {
  final String errorMessage;

  ForgotPasswordFailure({required this.errorMessage});
}
