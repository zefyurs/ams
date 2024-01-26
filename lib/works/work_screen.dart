import 'package:ams/common/color.dart';
import 'package:ams/common/consonents.dart';
import 'package:ams/common/layout.dart';
import 'package:ams/model/work_model.dart';
import 'package:ams/widget/work_banner.dart';
import 'package:flutter/material.dart';
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
              element.category.contains(searchWord) ||
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
    List<String> categoryName = workList.map((e) => e.category).toSet().toList();

    return Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: containerInnerPadding),
          child: Column(children: [
            const WorkBanner(),
            SizedBox(height: widgetDistanceMiddle),
            Expanded(
                child: WhiteRoundedContainer(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                    bottomLeft: const Radius.circular(20),
                    bottomRight: const Radius.circular(20),
                    widget: [
                  Column(children: [
                    CustomScrollView(slivers: <Widget>[
                      buildBannerAndListTitleWidget(
                        searchWord: searchWord,
                        searchController: searchController,
                        onTap: (value) => updateWorksList(value),
                        context: context,
                        categoryName: categoryName,
                      ),
                      buildListView(searchedWorkList),
                    ]),
                  ]),
                ])),
          ]),
        ));
  }
}

SliverPadding buildBannerAndListTitleWidget(
    {required TextEditingController searchController,
    required Function(String) onTap,
    required String searchWord,
    required context,
    required List<String> categoryName}) {
  return SliverPadding(
    padding: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding, top: 10),
    sliver: SliverToBoxAdapter(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        //
        //
        // * banner
        SizedBox(height: widgetDistanceMiddle),

        //
        //
        // * 소개 및 검색창
        WhiteRoundedContainer(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: const Radius.circular(0),
          bottomRight: const Radius.circular(0),
          widget: [
            // 타이틀 정렬을 위한 padding 추가
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  // * 페이지 제목

                  Text('Works',
                      style: GoogleFonts.openSans(
                          fontSize: 22, fontWeight: FontWeight.w600, color: textColor, letterSpacing: -1.5)),

                  // * 페이지 설명
                  const Text('AMS의 작업물을 확인해보세요.',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey, letterSpacing: -0.5)),
                ],
              ),
            ),
            SizedBox(height: widgetDistanceSmall),

            // * 검색창
            SizedBox(
                height: 45,
                child: TextField(
                    controller: searchController,
                    onChanged: onTap,
                    decoration: searchInputDecoration(searchController))),
            SizedBox(height: widgetDistanceSmall),

            // * 카테고리 선택
            SizedBox(
                height: 32,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () => onTap(''),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: searchWord == '' ? Colors.black : Colors.grey.shade300,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: containerInnerPadding, vertical: 5),
                            child: Text(
                              '전체',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: searchWord == '' ? Colors.white : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.5,
                              ),
                            ))),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryName.length,
                          itemBuilder: (context, index) {
                            var category = categoryName[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: GestureDetector(
                                  onTap: () => onTap(category),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: searchWord == category ? Colors.black : Colors.grey.shade300),
                                      padding: EdgeInsets.symmetric(horizontal: containerInnerPadding, vertical: 5),
                                      child: Text(
                                        category,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: searchWord == category ? Colors.white : Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.5,
                                        ),
                                      ))),
                            );
                          }),
                    ),
                  ],
                )),
          ],
        ),
      ]),
    ),
  );
}

SliverList buildListView(List<WorkModel> searchedWorkList) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      childCount: searchedWorkList.length,
      (context, index) {
        var work = searchedWorkList[index];
        return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.only(left: containerInnerPadding, right: containerInnerPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * 메인화면

                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    AspectRatio(
                        aspectRatio: 4 / 3,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              work.thumbnail,
                              fit: BoxFit.cover,
                            ))),
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
                const SizedBox(height: 8),
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
              ],
            ));
      },
    ),
  );
}
