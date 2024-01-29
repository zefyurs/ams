import 'package:ams/common/color.dart';
import 'package:ams/common/consonents.dart';
import 'package:flutter/material.dart';

class MemberInfoTemplate extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String job;
  final String description;
  final String sns;
  final bool isLast;

  const MemberInfoTemplate(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.job,
      required this.description,
      required this.sns,
      required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
          child: Image.asset(imgUrl)),
      SizedBox(height: widgetDistanceSmall),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * title
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),

          // * 직책
          Text(job, style: TextStyle(color: middleGrey)),
          SizedBox(height: widgetDistanceLarge),

          // * 설명
          Text(description, style: TextStyle(color: boldGrey)),
          SizedBox(height: widgetDistanceSmall),
          // SizedBox(height: widgetDistanceSmall),

          // * sns
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: lightGrey.withOpacity(0.8)),
            child: Text(
              sns,
              style: TextStyle(color: primaryColor),
            ),
          ),
        ],
      ),
      SizedBox(height: widgetDistanceLarge * 2),

      // Divider(color: lightGrey, thickness: 1),
      if (isLast)
        Column(
          children: [
            // Divider(color: lightGrey, thickness: 1),
            SizedBox(height: widgetDistanceLarge),
          ],
        ),
    ]);
  }
}
