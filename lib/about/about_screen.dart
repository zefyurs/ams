import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/logo_long.png',
            width: 250,
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.8),
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://www.bearingwholesalelots.com/v/vspfiles/photos/100-3-16-inch-Chrome-G25-2.jpg?v-cache=1417625264',
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
                  icon: Icon(Icons.play_arrow, size: 50, color: Colors.white.withOpacity(0.9)), // 아이콘 투명도 조절
                  onPressed: () {
                    // 재생 버튼 클릭 시 실행할 액션 추가
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
