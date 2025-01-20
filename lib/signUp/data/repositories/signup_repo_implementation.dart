import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/signup_repo.dart';
import '../datasources/user_database.dart';

class SignUpRepositoryImplementation implements SignUpRepository {
  final SignUpPHP signUpPHP;

  SignUpRepositoryImplementation({required this.signUpPHP});

  @override
  Future<void> signUp(User user , BuildContext context) async {
    try {
      await signUpPHP.signUp(user, context);
    } catch (e) {
      if (kDebugMode) {
        print("Error Repo : $e");
      }
    }
  }
}
