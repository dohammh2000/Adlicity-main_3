part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class LoginToggleShowPassword extends LoginState {
  final bool showPassword;

  LoginToggleShowPassword(this.showPassword);

  @override
  List<Object> get props => [showPassword];
}
