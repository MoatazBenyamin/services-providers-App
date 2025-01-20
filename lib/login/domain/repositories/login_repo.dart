  import 'package:flutter/material.dart';

import '../entities/user.dart';


abstract class LoginRepository {
  Future<void> logIn(User user , BuildContext context) ;
}