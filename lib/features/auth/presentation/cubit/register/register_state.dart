part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}


class RegisterLoading extends RegisterState {}



class RegisterError extends RegisterState  {
  final String message;

  RegisterError({required this.message});
}



class RegisterSuccess extends RegisterState {
  final RegisterResponse registerResponse;

  RegisterSuccess({required this.registerResponse});
}

