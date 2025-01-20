// ignore_for_file: use_build_context_synchronously

import 'package:Mob_Project/Home/presentation/pages/main_home.dart';
import 'package:Mob_Project/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/api_link.dart';
import '../../../core/crud.dart';
import '../../domain/entities/user.dart';

abstract class LogInDataSource {
  Future<void> logIn(User user, BuildContext context);
}

class logInPHP implements LogInDataSource {
  @override
  Future<void> logIn(User user, BuildContext context) async {
    Crud crud = Crud();
    try {
      var response = await crud.postRequest(logInLink, {
        "email": user.email,
        "password": user.password,
      });

      if (response != null && response.containsKey('status')) {
        if (response['status'] == 'Success') {
          sharedPref.setString(
              "companyid", response['data']['companyid'].toString());
          sharedPref.setString("email", response['data']['email']);
          sharedPref.setString("companyname", response['data']['companyname']);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Welcome Back ${sharedPref.get("companyname")}")));
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainHome()));
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => MainHome()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Invalid Email Or Password")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Unexpected response from server")));
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error Catch : $e");
      }
    }
  }
}
