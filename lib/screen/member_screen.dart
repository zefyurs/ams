import 'package:ams/common/color.dart';
import 'package:ams/common/consonents.dart';
import 'package:ams/common/layout.dart';
import 'package:ams/layout/member_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPage();
}

class _MemberPage extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            WhiteRoundedContainer(padding: containerHeaderPadding, widget: [
              // * title
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Members',
                        style: GoogleFonts.openSans(
                            fontSize: 22, fontWeight: FontWeight.w600, color: textColor, letterSpacing: -1.0)),
                    const Text('AMS의 멤버들을 소개합니다.',
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey, letterSpacing: 0))
                  ],
                ),
              ),
              SizedBox(height: widgetDistanceLarge),
              //
              // * members info
              const MemberInfoTemplate(
                  imgUrl: 'assets/images/member_kwon.jpg',
                  title: '운동하는 권감독 / 권혁주',
                  job: 'Main director',
                  description: '자연과 운동의 힘을 믿는 영상제작사',
                  sns: '@kwon_director_',
                  isLast: false),

              const MemberInfoTemplate(
                  imgUrl: 'assets/images/member_wonderload.jpg',
                  title: '원더로드 / 이재훈',
                  job: 'Video grapher',
                  description: 'Comment',
                  sns: '@',
                  isLast: false),

              const MemberInfoTemplate(
                  imgUrl: 'assets/images/member_baek.jpg',
                  title: '록토그래퍼 / 백경록',
                  job: '',
                  description: 'Comment',
                  sns: '@',
                  isLast: false),

              const MemberInfoTemplate(
                  imgUrl: 'assets/images/member_no.jpg',
                  title: 'Raul / 노영진',
                  job: 'Photographer',
                  description: 'Comment',
                  sns: '@',
                  isLast: true),
            ]),
            SizedBox(height: widgetDistanceLarge),
          ]),
        ));
  }
}
