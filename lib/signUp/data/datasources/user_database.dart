import 'package:Mob_Project/login/presentation/pages/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/api_link.dart';
import '../../../core/crud.dart';

import '../../domain/entities/user.dart';
import '../models/user_model.dart';

abstract class SignUpDataSource {
  Future<void> signUp(User user, BuildContext context);
}

class SignUpPHP implements SignUpDataSource {
  Crud crud = Crud();
  @override
  Future<void> signUp(User user, BuildContext context) async {
    try {
      UserModel userModel = UserModel(
        email: user.email,
        password: user.password,
        personName: user.personName,
        personPhone: user.personPhone,
        companyName: user.companyName,
        companyAddress: user.companyAddress,
        companyLocation: user.companyLocation,
        companySize: user.companySize,
        industry: user.industry,
      );

      Map<String, dynamic> userJson = userModel.toJson();
      print("===============================");
      print(userJson.toString());
      var response = await crud.postRequest(signUpLink, {
        "email": user.email,
        "password": user.password,
        "contactPersonName": user.personName,
        "contactPersonPhone": user.personPhone,
        "companyname": user.companyName,
        "companyAddress": user.companyAddress,
        "companyLocation": user.companyLocation,
        "companySize": user.companySize,
        "companyIndustry": user.industry,
      });

      if (response != null && response.containsKey('status')) {
        if (response['status'] == 'Success') {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("SignUp Succeeded")));
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("SignUp Failed")));
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
