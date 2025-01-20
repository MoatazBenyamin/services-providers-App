import 'package:flutter/material.dart';

import '../../../core/colorsPallete.dart';
import '../../../core/constants/api_link.dart';
import '../../../core/crud.dart';
import '../../../main.dart';
import '../widgets/bookmark.dart';
import 'service_details.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  getbookmarkservices() async {
    Crud crud = Crud();
    var response = await crud.postRequest(view_bookmark_services_link,
        {"bookmark": sharedPref.getString("companyid")});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Bookmarked Services 📌",
              style: TextStyle(
                  color: Darkblue, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder(
                future: getbookmarkservices(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['status'] == 'fail') {
                      return Text(
                        "No Services available",
                        style: TextStyle(color: Darkblue, fontSize: 18),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data['data'].length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BookmarkCard(
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServiceDetails(
                                        service: snapshot.data['data'][index],
                                      )),
                            );
                          },
                          title:
                              "${snapshot.data['data'][index]['servicetitle']}",
                          content:
                              "${snapshot.data['data'][index]['servicedesc']}",
                        );
                      },
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
    ));
  }
}
