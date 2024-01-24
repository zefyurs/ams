import 'package:ams/common/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        elevation: 0,
        child: SafeArea(
            child: Column(
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'About',
                  style: GoogleFonts.openSans(
                      fontSize: 24, fontWeight: FontWeight.w600, color: textColor, letterSpacing: -1.5),
                )),
            TextButton(onPressed: () {}, child: const Text('Works')),
            TextButton(onPressed: () {}, child: const Text('Members')),
            TextButton(onPressed: () {}, child: const Text('Contact'))
          ],
        )));
  }
}
