import 'package:ams/common/color.dart';
import 'package:ams/common/consonents.dart';
import 'package:ams/common/layout.dart';
import 'package:ams/model/work_model.dart';
import 'package:ams/screen/popup_screen.dart';
import 'package:ams/widget/work_banner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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
  List<WorkModel> searchedWorkList = [];

  Future<void> fetchData() async {
    // List<WorkModel> initialWorkList = await List.from(workList);
    // setState(() {
    //   searchedWorkList = initialWorkList;
    // });
  }

  // void updateWorksList(String newSearchWord) {
  //   setState(() {
  //     searchWord = newSearchWord;
  //     searchedWorkList = workList
  //         .where((element) =>
  //             element.category.contains(searchWord) ||
  //             element.brandName.contains(searchWord) ||
  //             element.title.contains(searchWord))
  //         // element.screenDirection.contains(searchWord))
  //         .toList();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // List<String> categoryName = workList.map((e) => e.category).toSet().toList();
    List<String> categoryName = ['화장품', '의류'];
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
                    Text('Works',
                        style: GoogleFonts.openSans(
                            fontSize: 22, fontWeight: FontWeight.w600, color: textColor, letterSpacing: -1.0)),
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
                      // onChanged: (value) => updateWorksList(value),
                      onChanged: (value) {},
                      decoration: searchInputDecoration(searchController))),
              SizedBox(height: widgetDistanceSmall),

              // * 카테고리 선택
              SizedBox(
                  height: 32,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          // onTap: () => updateWorksList(''),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: searchWord == '' ? primaryColor : Colors.grey.shade200,
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
                                        // onTap: () => updateWorksList(category),
                                        onTap: () => {},
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: searchWord == category ? primaryColor : Colors.grey.shade200),
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
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('works').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final work = snapshot.data!.docs[index];
                        return Text(work['title']);
                      },
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(child: Text('error: ${snapshot.error}'));
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              // GridView.builder(
              //     shrinkWrap: true,
              //     primary: false,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       crossAxisSpacing: 1,
              //       mainAxisSpacing: 1,
              //     ),
              //     itemCount: searchedWorkList.length,
              //     itemBuilder: (context, index) {
              //       var work = searchedWorkList[index];
              //       return GestureDetector(
              //           onTap: () {
              //             Get.to(
              //               PopupScreen(work: work),
              //             );
              //           },
              //           child: Stack(children: [
              //             // AspectRatio(aspectRatio: 1, child: Image.asset(work.thumbnail[0], fit: BoxFit.cover)),
              //             Positioned(
              //                 bottom: 10,
              //                 left: 10,
              //                 child: Row(children: [
              //                   const Icon(
              //                     CupertinoIcons.heart_fill,
              //                     size: 12,
              //                     color: Colors.redAccent,
              //                   ),
              //                   const SizedBox(width: 5),
              //                   Text(
              //                     work.likes.toString(),
              //                     style: const TextStyle(fontWeight: FontWeight.w500),
              //                   ),
              //                 ])),
              //           ]));
              //     }),
              SizedBox(height: widgetDistanceLarge),

              // ListView.builder(
              //     shrinkWrap: true,
              //     primary: false,
              //     itemCount: searchedWorkList.length,
              //     itemBuilder: (context, index) {
              //       var work = searchedWorkList[index];
              //       return Container(
              //           decoration: const BoxDecoration(
              //             color: Colors.white,
              //           ),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               // * 메인 list view
              //               // * 썸네일
              //               Stack(
              //                 alignment: Alignment.center,
              //                 children: <Widget>[
              //                   AspectRatio(
              //                       aspectRatio: 4 / 3,
              //                       child: Image.asset(
              //                         work.thumbnail,
              //                         fit: BoxFit.cover,
              //                       )),
              //                   Container(
              //                     decoration: BoxDecoration(
              //                       color: Colors.black38.withOpacity(0.5), // 버튼 배경 투명도 조절
              //                       shape: BoxShape.circle,
              //                     ),
              //                     child: IconButton(
              //                       icon: Icon(Icons.play_arrow,
              //                           size: 40, color: Colors.white.withOpacity(0.9)), // 아이콘 투명도 조절
              //                       onPressed: () {
              //                         // 재생 버튼 클릭 시 실행할 액션 추가
              //                       },
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               SizedBox(height: widgetDistanceMiddle),
              //               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //                 // * title
              //                 Row(
              //                   children: [
              //                     Expanded(
              //                       child: Text(work.title,
              //                           //     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: -0.5)),
              //                           style: const TextStyle(
              //                               fontSize: 18,
              //                               letterSpacing: -0.5,
              //                               color: textColor,
              //                               fontWeight: FontWeight.w600)),
              //                     ),
              //                     Text(
              //                       work.screenDirection,
              //                       style: TextStyle(color: middleGrey),
              //                     )
              //                   ],
              //                 ),
              //                 SizedBox(height: widgetDistanceSmall),
              //                 // * 설명
              //                 Text(
              //                   work.description,
              //                   style: TextStyle(color: darkGrey),
              //                   // maxLines: 5,
              //                   // overflow: TextOverflow.ellipsis,
              //                 ),
              //                 SizedBox(height: widgetDistanceLarge),
              //                 SizedBox(height: widgetDistanceLarge),

              //                 // if (work.description.length > 100)
              //                 //   Row(
              //                 //     children: [
              //                 //       const Expanded(child: SizedBox.shrink()),
              //                 //       TextButton(
              //                 //         onPressed: () {},
              //                 //         child: const Text('더보기 >', textAlign: TextAlign.end),
              //                 //       ),
              //                 //     ],
              //                 //   ),
              //                 SizedBox(height: widgetDistanceSmall),
              //                 Text(work.tag,
              //                     style: TextStyle(
              //                       color: middleGrey,
              //                       letterSpacing: -0.5,
              //                     )),
              //                 // Row(
              //                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 //   children: [
              //                 //     Text(work.screenDirection, style: TextStyle(color: middleGrey, letterSpacing: -0.5)),
              //                 //     Text(work.year, style: TextStyle(color: middleGrey, letterSpacing: -0.5)),
              //                 //   ],
              //                 // ),
              //               ]),
              //               SizedBox(height: widgetDistanceSmall),

              //               Divider(
              //                 height: 1,
              //                 thickness: 1,
              //                 color: lightGrey,
              //               ),
              //               SizedBox(height: widgetDistanceLarge),
              //               SizedBox(height: widgetDistanceLarge),
              //               SizedBox(height: widgetDistanceLarge)
              //             ],
              //           ));
              //     })
            ]),
            SizedBox(height: widgetDistanceLarge),
          ]),
        ));
  }
}
