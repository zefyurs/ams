import 'package:flutter/material.dart';

SliverPadding buildAboutUsPage() {
  return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverToBoxAdapter(
          child: Column(
        children: [
          Text('액티비티 아웃도어 전문 프로덕션', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          Text('영상을 통해, 더 많은 사람들이 운동을 하고\n멋진 자연을 만나 건강해지기를 바래요')
        ],
      )));
}
