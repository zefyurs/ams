import 'package:ams/common/color.dart';
import 'package:ams/common/consonents.dart';
import 'package:ams/model/work_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PopupScreen extends StatefulWidget {
  final WorkModel work;
  const PopupScreen({super.key, required this.work});

  @override
  State<PopupScreen> createState() => _PopupScreenState();
}

class _PopupScreenState extends State<PopupScreen> {
  CarouselController buttonCarouselController = CarouselController();
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    int thumbnailQty = widget.work.thumbnail.length;

    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // * thumbnail
        Stack(children: [
          CarouselSlider.builder(
              itemBuilder: (context, index, realIndex) {
                return Stack(alignment: Alignment.center, children: [
                  Image.asset(widget.work.thumbnail[index], fit: BoxFit.cover),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.black38.withOpacity(0.5), // 버튼 배경 투명도 조절
                          shape: BoxShape.circle),
                      child: IconButton(
                          icon: Icon(Icons.play_arrow, size: 40, color: Colors.white.withOpacity(0.9)), // 아이콘 투명도 조절
                          onPressed: () {
                            // 재생 버튼 클릭 시 실행할 액션 추가
                          })),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration:
                              BoxDecoration(color: lightGrey.withOpacity(0.3), borderRadius: BorderRadius.circular(15)),
                          child: Text(widget.work.screenDirection[index]))),
                  if (thumbnailQty > 1)
                    Positioned(
                        bottom: 10,
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: thumbnailQty,
                          effect: const ExpandingDotsEffect(
                              dotColor: Colors.grey, activeDotColor: Colors.white, dotHeight: 8, dotWidth: 8),
                        ))
                ]);
              },
              itemCount: thumbnailQty,
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      pageController = PageController(initialPage: index);
                    });
                  },
                  aspectRatio: 4 / 3,
                  initialPage: 0,
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false))
        ]),

        Padding(
          padding: containerHeaderPadding,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // * brand
            Text('${widget.work.brandName} >', style: TextStyle(color: darkGrey)),
            SizedBox(height: widgetDistanceSmall / 2),

            // * title
            Text(widget.work.title,
                style:
                    const TextStyle(fontSize: 20, letterSpacing: -0.5, color: textColor, fontWeight: FontWeight.w600)),

            SizedBox(height: widgetDistanceLarge),
            // * 설명
            Text(
              widget.work.description,
              style: TextStyle(color: boldGrey),
            ),
            SizedBox(height: widgetDistanceLarge * 2),
            SizedBox(height: widgetDistanceSmall),
            Text(widget.work.tag, style: TextStyle(color: middleGrey, letterSpacing: -0.5))
          ]),
        ),
        SizedBox(height: widgetDistanceSmall)
      ]),
    );
  }
}
