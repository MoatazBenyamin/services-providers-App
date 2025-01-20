import 'package:Mob_Project/core/colorsPallete.dart';
import 'package:flutter/material.dart';

class serviceCard extends StatelessWidget {
  final void Function()? ontap;
  final String title;
  final String content;
  const serviceCard(
      {super.key, this.ontap, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/service.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                )), // Image.asset // Expanded
            Expanded(
                flex: 2,
                child: ListTile(
                  title: Text(
                    title,
                    style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                  ),

                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 15,left: 15),
                    child: Text(
                      content,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                )) // ListTile // Expanded
          ],
        ), // Row
      ), // Card
    ); // InkWell
  }
}
