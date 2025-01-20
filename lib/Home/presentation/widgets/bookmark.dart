import 'package:Mob_Project/core/colorsPallete.dart';
import 'package:flutter/material.dart';

class BookmarkCard extends StatelessWidget {
  final void Function()? ontap;
  final String title;
  final String content;
  const BookmarkCard(
      {super.key, this.ontap, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        color: Darkblue,
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
                    style: TextStyle(color: white, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    content,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: white, fontWeight: FontWeight.w200),
                  ),
                )) // ListTile // Expanded
          ],
        ), // Row
      ), // Card
    ); // InkWell
  }
}
