part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class HandelState extends LoginState {}
class ChangeVisibilityState extends LoginState {}

// Login States
class loginLoadingState extends LoginState{}
class loginSuccessState extends LoginState{}
class loginErrorState extends LoginState{}