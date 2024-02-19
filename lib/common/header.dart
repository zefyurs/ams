import 'package:ams/common/color.dart';
import 'package:ams/common/consonents.dart';
import 'package:ams/screen/add_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding / 2, top: 10, bottom: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              // * AMS 로고
              Column(
                // crossAxisAlignment: CrossAxisAlignment.c,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: primaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Text('AMS',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w200, color: Colors.white, letterSpacing: -0.5)),
                  ),
                  const Text('I A M S U P E R', style: TextStyle(fontSize: 5.5, height: 2, wordSpacing: -1.5))
                ],
              ),
              const SizedBox(width: 6),
              //
              //

              // * AMS full 로고
              Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Active Moment Studio',
                    style: GoogleFonts.urbanist(
                        fontSize: 22, fontWeight: FontWeight.w400, color: textColor, letterSpacing: -1)),
                const SizedBox(height: 11)
              ])),
              //
              //

              Column(
                children: [
                  IconButton(
                      onPressed: () => Get.to(() => const AddPage()),
                      icon: const Icon(CupertinoIcons.bars, color: textColor)),
                  const SizedBox(height: 6)
                ],
              )
            ],
          ),
          // Row(
          //   children: [
          //     const Text(
          //       'Works',
          //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -1.5, color: blackTextColor),
          //     ),
          //     const SizedBox(width: 24),
          //     Text(
          //       'About us',
          //       style: TextStyle(
          //           fontSize: 24, fontWeight: FontWeight.w500, color: Colors.grey.shade400, letterSpacing: -1.5),
          //     ),
          //     const SizedBox(width: 24),
          //     Text(
          //       'Contact',
          //       style: TextStyle(
          //           fontSize: 24, fontWeight: FontWeight.w500, color: Colors.grey.shade400, letterSpacing: -1.5),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
