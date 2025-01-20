import 'package:flutter/material.dart';

import '../entities/user.dart';

abstract class SignUpRepository {
  Future<void> signUp(User user , BuildContext context) ;
}