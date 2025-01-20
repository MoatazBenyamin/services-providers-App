// ignore_for_file: non_constant_identifier_names

class serviceModel {
  final String serviceid;
  final String servicetitle;
  final String servicedesc;
  final String companyid;

  serviceModel({
    required this.serviceid,
    required this.servicetitle,
    required this.servicedesc,
    required this.companyid,
  });

  factory serviceModel.fromJson(Map<String, dynamic> json) {
    return serviceModel(
      serviceid: json['serviceid'],
      servicetitle: json['servicetitle'],
      servicedesc: json['servicedesc'],
      companyid: json['companyid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceid': serviceid,
      'companyid': companyid,
      'servicedesc': servicedesc,
      'servicetitle': servicetitle,
    };
  }
}
