// ignore_for_file: non_constant_identifier_names

class UserModel {
  final String personName;
  final String companyName;
  final String personPhone;
  final String email;
  final String companySize;
  final String industry;
  final String companyAddress;
  final String companyLocation;
  final String password;

  UserModel(
      {required this.personName,
      required this.companyName,
      required this.personPhone,
      required this.email,
      required this.companySize,
      required this.industry,
      required this.companyAddress,
      required this.companyLocation,
      required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      personName: json['personName'],
      companyName: json['companyName'],
      personPhone: json['personPhone'],
      email: json['email'],
      companySize: json['companySize'],
      industry: json['industry'],
      companyAddress: json['companyAddress'],
      companyLocation: json['companyLocation'],
      password: json['password'],
    );
  }

  Map<String,dynamic> toJson()
  {
    return {
      'email':email,
      'password':password,
      'personName':personName,
      'personPhone':personPhone,
      'companyName':companyName,
      'companySize':companySize ,
      'companyAddress':companyAddress,
      'companyLocation':companyLocation,
      'industry':industry,
    } ;
  }
}
