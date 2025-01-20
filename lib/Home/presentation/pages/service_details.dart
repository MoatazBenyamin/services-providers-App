import 'package:Mob_Project/core/colorsPallete.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/api_link.dart';
import '../../../core/crud.dart';
import '../../../main.dart';
import 'company_details.dart';

class ServiceDetails extends StatelessWidget {
  final service;
  const ServiceDetails({Key? key, this.service}) : super(key: key);

  addtobookmark() async {
    Crud crud = Crud();
    var response = await crud.postRequest(add_bookmark_services_link, {
      "serviceid": service['serviceid'].toString(),
      "bookmark": sharedPref.getString("companyid")
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    // print("Heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeyu ${service['serviceid']}");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Service Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.asset('assets/images/service.png'),
            ),
            Container(
              width: double.infinity,
              color: Darkblue,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      service['servicetitle'],
                      style: TextStyle(
                          color: white,
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Description:',
                      style: TextStyle(color: white, fontSize: 22),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      service['servicedesc'],
                      style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: MaterialButton(
                        onPressed: () {},
                        height: 50,
                        color: lightblue,
                        child: Center(
                          child: Row(
                            children: [
                              const Icon(Icons.waving_hand,
                                  color: Colors.white, size: 33),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Order Now',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 23),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => Companyprofile(companyid: service['companyid'])),
                           );
                        },
                        height: 50,
                        color: Colors.blueGrey,
                        child: Center(
                          child: Row(
                            children: [
                              const Icon(Icons.account_balance_rounded,
                                  color: Colors.white, size: 33),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Show the Company',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 23),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: service['bookmark'] !=
                                sharedPref.getString("companyid")
                            ? MaterialButton(
                                onPressed: () {
                                  addtobookmark();
                                },
                                height: 50,
                                color: Dark,
                                child: Center(
                                  child: Row(
                                    children: [
                                      const Icon(Icons.bookmark_add_rounded,
                                          color: Colors.white, size: 33),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Bookmark this service ',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 23),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 10,
                              )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
