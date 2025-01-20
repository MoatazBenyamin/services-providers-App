// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../entities/user.dart';
import '../repositories/login_repo.dart';

class LoginUseCase {
  
  LoginRepository loginRepository ;
  LoginUseCase({
    required this.loginRepository,
  });

  Future<void> call(User user, BuildContext context) async {
    await loginRepository.logIn(user, context);
  }

}
