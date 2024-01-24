import 'package:flutter/material.dart';

class BrandList extends StatelessWidget {
  const BrandList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // Image.asset('${imgUrl}brand_andar.png', width: 50),
          Image.asset('assets/images/brand_lululemon.png'),
          const SizedBox(width: 15),
          Image.asset('assets/images/brand_sk2.png'),
          const SizedBox(width: 15),
          Image.asset('assets/images/brand_sulwhasoo.png'),
          const SizedBox(width: 15),
          Image.asset('assets/images/brand_gregory.png'),
          const SizedBox(width: 15),
          Image.asset('assets/images/brand_polo.png'),
          const SizedBox(width: 15),
          Image.asset('assets/images/brand_hanssem.png'),

          Image.asset('assets/images/brand_sergio.png'),

          // const SizedBox(width: 15),
          // Image.asset('assets/images/brand_hongkong.png', height: 20),
          const SizedBox(width: 15),
          Image.asset(
            'assets/images/brand_andar.png',
          ),
        ],
      ),
    );
  }
}
