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
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const WorkBanner(),
            ),
            SizedBox(height: widgetDistanceMiddle),
            WhiteRoundedContainer(padding: containerHeaderPadding, widget: [
              // 타이틀 정렬을 위한 padding 추가
              Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    //
                    // * 페이지 제목

                    // * 페이지 설명
                    const Text('AMS의 작업물을 확인해보세요.',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey))
                  ])),
              SizedBox(height: widgetDistanceLarge),

              // * 검색창
              SizedBox(
                  height: 45,
                  child: TextField(
                      controller: searchController,
                      onChanged: (value) => updateWorksList(value),
                      decoration: searchInputDecoration(searchController))),
              SizedBox(height: widgetDistanceSmall),

              // * 카테고리 선택
              SizedBox(
                  height: 32,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () => updateWorksList(''),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: searchWord == '' ? primaryColor : Colors.grey.shade300,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: containerInnerPadding, vertical: 5),
                              child: Text(
                                '전 체',
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
                                        onTap: () => updateWorksList(category),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: searchWord == category ? primaryColor : Colors.grey.shade300),
                                            padding:
                                                EdgeInsets.symmetric(horizontal: containerInnerPadding, vertical: 5),
                                            child: Text(
                                              category,
                                              style: TextStyle(
                                                  color: searchWord == category ? Colors.white : Colors.black),
                                            ))));
                              })),
                    ],
                  )),
              SizedBox(height: widgetDistanceSmall),
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: searchedWorkList.length,
                  itemBuilder: (context, index) {
                    var work = searchedWorkList[index];
                    return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
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
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.black38.withOpacity(0.5), // 버튼 배경 투명도 조절
                                //     shape: BoxShape.circle,
                                //   ),
                                //   child: IconButton(
                                //     icon: Icon(Icons.play_arrow,
                                //         size: 40, color: Colors.white.withOpacity(0.9)), // 아이콘 투명도 조절
                                //     onPressed: () {
                                //       // 재생 버튼 클릭 시 실행할 액션 추가
                                //     },
                                //   ),
                                // ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                // Text(work.brandName,
                                //     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: -0.5)),
                                Text('${work.brandName} ${work.title}(${work.screenDirection})',
                                    style: const TextStyle(fontSize: 16, letterSpacing: -0.5, color: textColor)),
                                Text(work.year,
                                    style: const TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: -0.5)),
                              ]),
                            ),
                            SizedBox(height: widgetDistanceSmall)
                          ],
                        ));
                  })
            ]),
            SizedBox(height: widgetDistanceMiddle),
          ]),
        ));
  }
}
