import 'package:ams/common/color.dart';
import 'package:ams/common/consonents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GreyEmptyBoxContainer extends StatelessWidget {
  final Widget widget;
  final double borderRadius;
  const GreyEmptyBoxContainer({super.key, required this.widget, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: lightGrey,
            width: 1,
          ),
        ),
        child: widget);
  }
}

class SmallTextWidgetWighBg extends StatelessWidget {
  final String title;
  final String contents;
  final double width;
  const SmallTextWidgetWighBg({super.key, required this.title, required this.contents, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: widgetDistanceMiddle),
        Container(
          width: width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primaryColor.withAlpha(40)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: primaryColor),
          ),
        ),
        Text(
          contents,
          style: TextStyle(color: darkGrey, fontSize: 14),
        ),
        SizedBox(height: widgetDistanceMiddle),
      ],
    );
  }
}

class WhiteRoundedContainer extends StatelessWidget {
  final Radius topLeft;
  final Radius topRight;
  final Radius bottomLeft;
  final Radius bottomRight;

  final List<Widget> widget;
  const WhiteRoundedContainer(
      {super.key,
      required this.widget,
      required this.topLeft,
      required this.topRight,
      required this.bottomLeft,
      required this.bottomRight});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                // color: primaryColor.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight),
            color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 29),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: widget));
  }
}

InputDecoration searchInputDecoration(TextEditingController searchController) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.yellow)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          )),
      fillColor: Colors.white,
      filled: true,
      hintText: "브랜드를 입력해주세요",
      hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
      prefixIcon: Icon(Icons.search, size: 20, color: Colors.grey.shade600),
      suffixIcon: GestureDetector(
          onTap: () => searchController.clear(),
          child: Icon(CupertinoIcons.xmark_circle_fill, size: 20, color: Colors.grey.shade600)));
}

SliverAppBar topmenu() {
  return SliverAppBar(
    surfaceTintColor: bgColor,
    backgroundColor: bgColor,
    pinned: true,
    floating: true,
    flexibleSpace: FlexibleSpaceBar(
      background: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 0),
        child: Row(
          children: [
            const Text(
              'Works',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -1.5),
            ),
            const SizedBox(width: 15),
            Text(
              'About us',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w500, color: Colors.grey.shade400, letterSpacing: -1.5),
            ),
            const SizedBox(width: 15),
            Text(
              'Contact',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w500, color: Colors.grey.shade400, letterSpacing: -1.5),
            ),
          ],
        ),
      ),
    ),
  );
}
