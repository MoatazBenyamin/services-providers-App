// ignore_for_file: non_constant_identifier_names



import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.email, required super.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
