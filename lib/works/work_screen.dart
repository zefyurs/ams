import 'package:ams/common/color.dart';
import 'package:ams/common/consonents.dart';
import 'package:ams/common/layout.dart';
import 'package:ams/common/service.dart';
import 'package:ams/model/work_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  String searchWord = '';
  List<WorkModel> searchedWorkList = List.from(workList);

  void updateWorksList(String newSearchWord) {
    setState(() {
      searchWord = newSearchWord;
      searchedWorkList = workList
          .where((element) =>
              element.brandName.contains(searchWord) ||
              element.title.contains(searchWord) ||
              element.year.contains(searchWord) ||
              element.screenDirection.contains(searchWord))
          .toList();
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: CustomScrollView(slivers: <Widget>[
          buildWorkScreen(searchController, (value) => updateWorksList(value)),
          buildListScreen(searchedWorkList),
        ]));
  }
}

SliverPadding buildWorkScreen(TextEditingController searchController, Function(String) onchanged) {
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 0),
    sliver: SliverToBoxAdapter(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
        // * banner
        workBanner(),
        const SizedBox(height: 30),

        // * 페이지 이름
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: workTitle(),
        ),
        const SizedBox(height: 15),

        // * 검색창
        SizedBox(
            height: 50,
            child: TextField(
                controller: searchController,
                onChanged: onchanged,
                decoration: searchInputDecoration(searchController))),
        const SizedBox(height: 30),

        // * 메인화면
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('브랜드 선택', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: -1.5))),
        const SizedBox(height: 15),
      ]),
    ),
  );
}

Column workTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Works',
          // style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -1.5, color: blackTextColor),
          style:
              GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.w600, color: textColor, letterSpacing: -1.5)),
      // * 페이지 설명
      const Text('AMS의 작업물을 확인해보세요.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey, letterSpacing: -0.5)),
    ],
  );
}

AspectRatio workBanner() {
  return AspectRatio(
    aspectRatio: 16 / 9,
    child: Container(
      // height: 200,
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Color(0xFFFDC7BE),
        image: const DecorationImage(
          image: AssetImage('assets/images/banner.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('AMS와 함께 하세요',
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'GmarketSansTTF',
                  // fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: -0.5)),
          // const SizedBox(height: 30),
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
                color: Colors.white.withAlpha(80),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () => Get.to(() => const WorkPage()),
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
                ),
              )),
        ],
      ),
    ),
  );
}

SliverPadding buildListScreen(List<WorkModel> searchedWorkList) {
  return SliverPadding(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    sliver: SliverList.builder(
      itemCount: searchedWorkList.length,
      itemBuilder: (context, index) {
        var work = searchedWorkList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: GreyEmptyBoxContainer(
                    borderRadius: 20,
                    widget: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        work.thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black38.withOpacity(0.5), // 버튼 배경 투명도 조절
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.play_arrow, size: 40, color: Colors.white.withOpacity(0.9)), // 아이콘 투명도 조절
                    onPressed: () {
                      // 재생 버튼 클릭 시 실행할 액션 추가
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Text(work.brandName,
                //     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: -0.5)),
                Text('${work.brandName} ${work.title}(${work.screenDirection})',
                    style: const TextStyle(fontSize: 16, letterSpacing: -0.5, color: textColor)),
                Text(work.year, style: const TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: -0.5)),
              ]),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    ),
  );
}
