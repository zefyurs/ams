import 'package:ams/common/color.dart';
import 'package:ams/common/consonents.dart';
import 'package:ams/common/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            color: Colors.grey.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: widget);
  }
}

SliverPadding buildHeader(context) {
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
    sliver: SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            children: [
              // * AMS 로고
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Text('AMS',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white, letterSpacing: -0.5)),
                  ),
                  const Text('IAMSUPER', style: TextStyle(fontSize: 8, height: 1))
                ],
              ),
              const SizedBox(width: 6),
              // * AMS full 로고
              const Expanded(
                  child: Text('Active Moment Studio',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: textColor, letterSpacing: -2.0))),
              IconButton(
                  onPressed: () async {
                    await showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                        barrierColor: Colors.transparent,
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
                          return const MenuScreen();
                          // return const SizedBox();
                        });
                  },
                  icon: const Icon(CupertinoIcons.search, color: textColor))
            ],
          ),
          SizedBox(height: widgetDistanceLarge),
          Row(
            children: [
              Text(
                'Works',
                // style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -1.5, color: blackTextColor),
                style: GoogleFonts.philosopher(
                    fontSize: 22, fontWeight: FontWeight.w600, color: textColor, letterSpacing: -1.5),
              ),
              const SizedBox(width: 24),
              Text(
                'About us',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w500, color: Colors.grey.shade400, letterSpacing: -1.5),
              ),
              const SizedBox(width: 24),
              Text(
                'Contact',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w500, color: Colors.grey.shade400, letterSpacing: -1.5),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

InputDecoration searchInputDecoration(TextEditingController searchController) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      fillColor: Colors.grey.shade300.withOpacity(0.7),
      filled: true,
      hintText: "브랜드를 입력해주세요",
      hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade400),
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
