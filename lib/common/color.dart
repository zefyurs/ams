import 'package:flutter/material.dart';

// * Color theme 1

// Color primaryColor = const Color(0xff1db954);
Color primaryColor = const Color(0xff171717);
Color secondaryColor = const Color(0xffbc9464);
Color thirdColor = const Color(0xff3d32b3);

// * light theme
// Color brandColor = const Color(0xff6C39AE);
Color brandColor = const Color(0xff18a558);
// const primaryColor = Colors.black;
Color bgColor = Colors.grey.shade100;
const textColor = Color(0xff171717);
const subTextColor = Color(0xff8F959E);
const inActivateTextColor = Color(0xFFBDBDBD);

// * Grey series
Color lightGrey = const Color(0xffd9d9d9);
Color middleGrey = const Color(0xff999999);
Color darkGrey = const Color(0xff767676);
Color boldGrey = const Color(0xff555555);

// * dark theme
const darkmodeBgColor = Color(0xFF1E1E1E);

List<BoxShadow> boxShadow = <BoxShadow>[
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 10,
    offset: const Offset(0, 2), // changes position of shadow
  ),
];
