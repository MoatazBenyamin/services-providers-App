class UserUdateProfile {
  final String contactPersonName;
  final String companyname;
  final String contactPersonPhone;
  final String companyAddress;
  final String companyLocation;
  final String email;
  final String companyid;

  UserUdateProfile(
      {required this.email,
      required this.contactPersonName,
      required this.companyname,
      required this.contactPersonPhone,
      required this.companyAddress,
      required this.companyLocation,
      required this.companyid});

  factory UserUdateProfile.fromJson(Map<String, dynamic> json) {
    return UserUdateProfile(
      contactPersonName: json['contactPersonName'],
      companyname: json['companyname'],
      contactPersonPhone: json['contactPersonPhone'],
      companyAddress: json['companyAddress'],
      companyLocation: json['companyLocation'],
      companyid: json['companyid'].toString(),
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'companyid': companyid,
      'contactPersonName': contactPersonName,
      'personPhone': contactPersonPhone,
      'companyname': companyname,
      'companyAddress': companyAddress,
      'companyLocation': companyLocation,
    };
  }
}
