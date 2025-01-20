// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repo.dart';
import '../datasources/login_datasource.dart';

class LogInRepositoryImplementation implements LoginRepository {
  logInPHP login ;
  LogInRepositoryImplementation({
    required this.login,
  });
  @override
  Future<void> logIn(User user, BuildContext context) async {
    try {
      await login.logIn(user, context);
    } catch (e) {
      if (kDebugMode) {
        print("Error Repo : $e");
      }
    }
  }
  
}
