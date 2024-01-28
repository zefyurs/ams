import 'package:ams/common/consonents.dart';
import 'package:ams/common/layout.dart';
import 'package:flutter/material.dart';

import 'package:ams/common/color.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // * banner
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: aboutBanner(),
          ),
          SizedBox(height: widgetDistanceMiddle),

          WhiteRoundedContainer(
            padding: containerHeaderPadding,
            widget: [
              // 타이틀 정렬을 위한 padding 추가
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('액티비티 아웃도어\n전문 프로뎍션',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: textColor)),
                    SizedBox(height: 5),
                    Text('영상을 통해, 더 많은 사람들이 운동을 하고\n멋진 자연을 만나 건강해지기를 바래요',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey))
                  ],
                ),
              ),
              SizedBox(height: widgetDistanceLarge),
              Row(children: [
                const Expanded(
                  child: SmallTextWidgetWighBg(title: '1.1M+', contents: '릴스 평균 조회수', width: 120),
                ),
                SizedBox(width: widgetDistanceSmall),
                const Expanded(
                  child: SmallTextWidgetWighBg(title: '600+', contents: '릴스 좋아요', width: 120),
                ),
              ]),
              SizedBox(height: widgetDistanceSmall),
              const Center(
                  child: SmallTextWidgetWighBg(
                      title: '100+',
                      contents:
                          '전 대기업 9년차 경력\n다수의 바랜드 광고 집행\n현대차 앰버서더(Ambassador) 활동\nSSG 앰버서더(Ambassador) 활동\n고프로 크리에이터 최우수상\n영상 제작 100편 이상 진행\n영상 공모전 수상 9회',
                      width: 230)),
              SizedBox(height: widgetDistanceMiddle),
              Image.asset('assets/images/instagram_kwon.png'),
              SizedBox(height: widgetDistanceLarge),
            ],
          ),

          SizedBox(height: widgetDistanceMiddle),

          // * 함께한 브랜드 소개
          WhiteRoundedContainer(
            padding: containerHeaderPadding,
            widget: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('AMS와 함께', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                        Text(
                          'AMS와 함께 한 Brand를 소개합니다.',
                          style: TextStyle(color: darkGrey),
                        ),
                        SizedBox(height: widgetDistanceLarge),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Image.asset('assets/images/brandList.png'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: widgetDistanceLarge),
                  // Container(
                  //   height: 50,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primaryColor),
                  //   child: const Text(
                  //     '인스타그램으로',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //         fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: -1.0, color: Colors.white),
                  //   ),
                  // ),
                  SizedBox(height: widgetDistanceLarge),
                ],
              ),
            ],
          ),
          SizedBox(height: widgetDistanceLarge),
        ])));
  }
}

AspectRatio aboutBanner() {
  return AspectRatio(
    aspectRatio: 16 / 9,
    child: Container(
      // height: 200,
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Color(0xFFFDC7BE),
        image: const DecorationImage(
          image: AssetImage('assets/images/about_banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Text('AMS와 함께 하세요',
          //     style: TextStyle(
          //         fontSize: 22,
          //         fontFamily: 'GmarketSansTTF',
          //         // fontWeight: FontWeight.w600,
          //         color: Colors.white,
          //         letterSpacing: -0.5)),
          // // const SizedBox(height: 30),
          // const Spacer(flex: 2),
          // const Text('쇼츠와 릴스를 위한\n모바일 광고, 모두 한 곳에서',
          //     style: TextStyle(fontFamily: 'GmarketSansTTF', fontSize: 16, color: Colors.white, letterSpacing: -0.5)),
          // // const SizedBox(height: 18),
          // const Spacer(flex: 1),
        ],
      ),
    ),
  );
}
