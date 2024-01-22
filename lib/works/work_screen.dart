import 'package:ams/const/consonents.dart';
import 'package:ams/const/layout.dart';
import 'package:ams/model/work_model.dart';
import 'package:flutter/material.dart';

SliverPadding buildWorkScreen() {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    sliver: SliverToBoxAdapter(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('브랜드 선택', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -1.5)),
        const Text('AMS의 작업물을 확인해보세요.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey, letterSpacing: -0.5)),
        SizedBox(height: widgetDistanceSmall),
      ]),
    ),
  );
}

SliverPadding buildListScreen() {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    sliver: SliverList.builder(
      itemCount: workList.length,
      itemBuilder: (context, index) {
        var work = workList[index];
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
                    style: const TextStyle(fontSize: 16, letterSpacing: -0.5)),
                Text(work.year, style: const TextStyle(fontSize: 16, color: Colors.grey, letterSpacing: -0.5)),
              ]),
            ),
            const SizedBox(height: 20)
          ],
        );
      },
    ),
  );
}
