import 'package:ams/common/consonents.dart';
import 'package:ams/common/service.dart';
import 'package:flutter/material.dart';

class WorkBanner extends StatelessWidget {
  const WorkBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(image: AssetImage('assets/images/banner.jpg'), fit: BoxFit.cover)),
        padding: EdgeInsets.all(containerInnerPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('AMS와 함께 하세요',
                //style: GoogleFonts.doHyeon(fontSize: 24, color: Colors.white, letterSpacing: -0.5)),
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'GmarketSansTTF',
                    // fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -0.5)),
            const Spacer(flex: 2),
            const Text('쇼츠와 릴스를 위한\n모바일 광고, 모두 한 곳에서',
                style: TextStyle(fontFamily: 'GmarketSansTTF', fontSize: 16, color: Colors.white, letterSpacing: -0.5)),
            // const SizedBox(height: 18),
            const Spacer(flex: 1),
            Container(
                width: 150,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withAlpha(90),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    String uri = 'https://open.kakao.com/o/sVzLl2df';
                    customLaunchUrl(uri);
                  },
                  child: const Text('카카오톡 1:1 상담',
                      style: TextStyle(
                          fontFamily: 'GmarketSansTTF',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          letterSpacing: -0.5)),
                )),
          ],
        ),
      ),
    );
  }
}
