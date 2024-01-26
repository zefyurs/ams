import 'package:ams/common/consonents.dart';
import 'package:ams/common/layout.dart';
import 'package:flutter/material.dart';

import 'package:ams/common/color.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: bgColor, body: CustomScrollView(slivers: <Widget>[buildAboutUsPage()]));
  }
}

SliverPadding buildAboutUsPage() {
  return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverToBoxAdapter(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
        // * banner
        // aboutBanner(),
        const SizedBox(height: 30),

        // // * 페이지 이름
        // Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: aboutTitle()),
        // const SizedBox(height: 40),
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white),
          padding: EdgeInsets.all(containerInnerPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('액티비티 아웃도어 전문 프로덕션', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              Text(
                '영상을 통해, 더 많은 사람들이 운동을 하고\n멋진 자연을 만나 건강해지기를 바래요',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),

        const SizedBox(height: 15),
        // * 페이지 설명
        const Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 91,
                    child: GreyEmptyBoxContainer(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '1.1M+',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '릴스 평균 조회수',
                              style: TextStyle(color: subTextColor, fontSize: 14),
                            )
                          ],
                        ),
                        borderRadius: 10),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 91,
                    child: GreyEmptyBoxContainer(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '600+',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '릴스 좋아요',
                              style: TextStyle(color: subTextColor, fontSize: 14),
                            )
                          ],
                        ),
                        borderRadius: 10),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: GreyEmptyBoxContainer(
                      borderRadius: 10,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 16),
                          Text(
                            '100+',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '전 대기업 9년차 경력\n다수의 바랜드 광고 집행\n현대차 앰버서더(Ambassador) 활동\nSSG 앰버서더(Ambassador) 활동\n고프로 크리에이터 최우수상\n영상 제작 100편 이상 진행\n영상 공모전 수상 9회',
                            style: TextStyle(color: subTextColor, fontSize: 14),
                          ),
                          SizedBox(height: 16),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 30),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const Text('브랜드 List', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        const Text(
          'AMS가 진행한 브랜드들을 확인해보세요.',
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 30),
        Container(
          width: double.infinity * 0.8,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: textColor),
          child: const Text(
            '인스타그램으로',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: -1.5, color: Colors.white),
          ),
        ),
        const SizedBox(height: 30),
      ])));
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

Column aboutTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('About',
          // style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -1.5, color: blackTextColor),
          style:
              GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.w600, color: textColor, letterSpacing: -1.5)),
      // * 페이지 설명
      const Text('AMS에 대해 알아보세요.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey, letterSpacing: -0.5)),
    ],
  );
}
