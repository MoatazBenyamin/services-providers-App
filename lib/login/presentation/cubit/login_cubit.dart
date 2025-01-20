import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  // text editing controllers
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool isnotShown = true;
  bool isnotShown1 = true;

  void changeVisibility() {
    emit(HandelState());
    isnotShown = !isnotShown;
    isnotShown1 = !isnotShown1;
    emit(ChangeVisibilityState());
  }

  void logIn(User user, BuildContext context) async {
    // emit(loginLoadingState());
    try {
      await loginUseCase(user, context);
      emit(loginSuccessState());
    } catch (e) {
      emit(loginErrorState());
    }
  }
}
