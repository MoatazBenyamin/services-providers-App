import 'package:Mob_Project/core/colorsPallete.dart';
import 'package:flutter/material.dart';

class SharedTextFields extends StatelessWidget {
  final String title, body;
  final bool flag;
  SharedTextFields(
      {super.key, required this.title, required this.body, this.flag = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      // child: Expanded(
        child: Column(
          children: [
            Container(
              // width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: lightblue),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                // child: Expanded(
                  child: Row(
                    children: [
                      Text(
                        "$title :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          "$body",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            // ),
          ],
        ),
      // ),
    );
  }
}
