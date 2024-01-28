import 'package:ams/common/color.dart';
import 'package:ams/common/consonents.dart';
import 'package:ams/common/layout.dart';
import 'package:ams/common/service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          WhiteRoundedContainer(padding: containerHeaderPadding, widget: [
            // 타이틀 정렬을 위한 padding 추가
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contacts',
                      style: GoogleFonts.openSans(
                          fontSize: 22, fontWeight: FontWeight.w600, color: textColor, letterSpacing: -1.0)),
                  const Text('AMS와 함께하세요',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey))
                ],
              ),
            ),
            SizedBox(height: widgetDistanceLarge),

            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text('이미지 들어갈 곳'),
            ),
            SizedBox(height: widgetDistanceLarge),
            const Text('아래 카카오톡 1:1 상담 바로가기 \n버튼을 눌려주세요! \n\n곧 바로 응답드립니다.'),
            SizedBox(height: widgetDistanceLarge),

            GestureDetector(
              onTap: () {
                String uri = 'https://open.kakao.com/o/sVzLl2df';
                customLaunchUrl(uri);
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primaryColor),
                child: const Text(
                  '카카오톡 1:1 상담 바로가기',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: -1.0, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: widgetDistanceLarge),
            Center(
                child: Text(
              'AMS 권혁주 감독/대표',
              style: TextStyle(color: darkGrey, fontWeight: FontWeight.w600),
            )),
            Center(child: Text('010-9410-2155', style: TextStyle(color: middleGrey))),

            SizedBox(height: widgetDistanceLarge),
          ]),
        ])));
  }
}
