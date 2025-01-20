import 'package:equatable/equatable.dart';

class userProfile extends Equatable {
  final String contactPersonName;
  final String companyname;
  final String contactPersonPhone;
  final String companyAddress;
  final String companyLocation;
  final String companyid;

  userProfile({
    required this.contactPersonName,
    required this.companyname,
    required this.contactPersonPhone,
    required this.companyAddress,
    required this.companyLocation,
    required this.companyid,
  });

  @override
  List<Object?> get props => [
        contactPersonName,
        contactPersonPhone,
        companyname,
        companyAddress,
        companyLocation,
      ];
}
