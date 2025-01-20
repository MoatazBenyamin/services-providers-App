// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../entities/user.dart';
import '../repositories/signup_repo.dart';

class SignUpUseCase {
  SignUpRepository signUpRepository ;
  SignUpUseCase({
    required this.signUpRepository,
  });

  Future<void> call(User user, BuildContext context) async {
    await signUpRepository.signUp(user, context);
  }
}
