part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}


class LoginLoading extends LoginState {}



class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}



class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;

  LoginSuccess({required this.loginResponse});
}

class UpdateTabLoginState extends LoginState {}


class TermsCheckedState extends LoginState {}
