part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}


// Drop Down States
class CategoryDropDownItemChangedState extends SignupState{}



class CheckBoxChangeState extends SignupState{}


class HandelState extends SignupState{}

class ChangeVisibilityState extends SignupState{}


class SignUpLoadingState extends SignupState{}
class SignUpSuccessState extends SignupState{}
class SignUpErrorState extends SignupState{}