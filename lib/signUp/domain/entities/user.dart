import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String personName;
  final String companyName;
  final String personPhone;
  final String email;
  final String companySize;
  final String industry;
  final String companyAddress;
  final String companyLocation;
  final String password;

  User(
      {required this.personName,
      required this.companyName,
      required this.personPhone,
      required this.email,
      required this.companySize,
      required this.industry,
      required this.companyAddress,
      required this.companyLocation,
      required this.password});
      
        @override
        List<Object?> get props => [
          email ,
          password , 
          personName ,
          personPhone ,
          companyName ,
          companyAddress ,
          companyLocation ,
          companySize ,
          industry
        ];

}