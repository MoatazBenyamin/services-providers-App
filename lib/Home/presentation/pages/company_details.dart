import 'package:Mob_Project/Home/presentation/pages/service_details.dart';
import 'package:flutter/material.dart';
import '../../../core/colorsPallete.dart';
import '../../../core/constants/api_link.dart';
import '../../../core/crud.dart';
import '../../../profile/presentation/widgets/textfield.dart';
import '../../googlemaps_functions.dart';
import '../widgets/service_cards.dart';

class Companyprofile extends StatelessWidget {
  final int companyid;
  Companyprofile({super.key, required this.companyid});

  getCompany() async {
    Crud crud = Crud();
    var response =
        await crud.postRequest(get_company_link, {"companyid": companyid.toString()});
    return response;
  }

  getservicesforcompany() async {
    Crud crud = Crud();
    var response = await crud
        .postRequest(get_companys_service_link, {"companyid": companyid.toString()});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company Profile"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white),
      ),
      body: FutureBuilder(
          future: getCompany(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data['status'] == 'fail') {
                return Text(
                  "Somthing wrong is happened",
                  style: TextStyle(color: Darkblue, fontSize: 18),
                );
              }
              print(
                  "Heeeeeeeeeeeeeeeeeey from company details...${snapshot.data['data']['companyname']}");
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(children: [
                          CircleAvatar(
                            backgroundColor: lightblue,
                            radius: 85,
                            child: CircleAvatar(
                                backgroundColor: lightblue,
                                radius: 85,
                                child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage: AssetImage(
                                      'assets/images/prof.jpg',
                                    ))),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: () {
                          String destination =
                              snapshot.data['data']['companyLocation'];
                          calculateDistance(destination).then((distance) {
                            // Handle the distance calculation result
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Distance: $distance km')));
                            // Perform any other actions based on the distance
                          }).catchError((e) {
                            // Handle any errors that occur during the distance calculation
                            print('Error calculating distance: $e');
                          });
                        },
                        minWidth: 13,
                        height: 50,
                        color: white,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.location_pin,
                                  color: Colors.red, size: 33),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Find Me',
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 23),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SharedTextFields(
                        title: "Company name",
                        body: snapshot.data['data']['companyname'],
                      ),
                      SharedTextFields(
                        title: "Person name",
                        body: snapshot.data['data']['contactPersonName'],
                      ),
                      SharedTextFields(
                        title: "Email",
                        body: snapshot.data['data']['email'],
                      ),
                      SharedTextFields(
                        title: "Person phone",
                        body: snapshot.data['data']['contactPersonPhone'],
                      ),
                      SharedTextFields(
                        title: "Company address",
                        body: snapshot.data['data']['companyAddress'],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "See my services🔧",
                        style: TextStyle(
                            color: Darkblue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FutureBuilder(
                          future: getservicesforcompany(),
                          builder: (BuildContext context,
                              AsyncSnapshot snapshotservice) {
                            if (snapshotservice.hasData) {
                              if (snapshotservice.data['status'] == 'fail') {
                                return Text(
                                  "No Services available",
                                  style:
                                      TextStyle(color: Darkblue, fontSize: 18),
                                );
                              }
                              return ListView.builder(
                                itemCount: snapshotservice.data['data'].length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return serviceCard(
                                    ontap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ServiceDetails(
                                                  service: snapshotservice
                                                      .data['data'][index],
                                                )),
                                      );
                                    },
                                    title:
                                        "${snapshotservice.data['data'][index]['servicetitle']}",
                                    content:
                                        "${snapshotservice.data['data'][index]['servicedesc']}",
                                  );
                                },
                              );
                            }
                            if (snapshotservice.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          })
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}
