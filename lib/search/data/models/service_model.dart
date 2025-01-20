class ServiceModel
{
  final  String serviceid   ;
  final  String companyid   ;
  final  String bookmark   ;
  final  String servicetitle   ;
  final  String servicedesc   ;

  ServiceModel(
    {
     required this.serviceid,
     required this.companyid,
     required this.bookmark, 
     required this.servicetitle, 
     required this.servicedesc
    }  
    );

factory ServiceModel.fromJson(Map<String,dynamic> json)
{
  return ServiceModel
  (
    serviceid: json['serviceid'].toString(),
    companyid: json['companyid'].toString(), 
    bookmark: json['bookmark'].toString(), 
    servicetitle: json['servicetitle'],
     servicedesc: json['servicedesc'],
     );
}

}