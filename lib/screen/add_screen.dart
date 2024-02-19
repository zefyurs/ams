import 'package:ams/database/firebase.dart';
import 'package:ams/model/work_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  static String idNumber = '2024020102';
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          ElevatedButton(
              onPressed: () {
                WorkModel workModel = WorkModel(
                    timeStamp: Timestamp.now(),
                    idNumber: idNumber,
                    category: '패션/의류',
                    brandName: 'EIDER',
                    title: 'F/W 눈꽃 산행',
                    description:
                        '상고대로 뒤덮인 설산을 걸으며\n고요하고 아름다운 겨울의 정취를 만끽합니다. \n\n그리고 걸음마다 뽀드득 거리는 눈 소리와 바람소리가 어우러져 마치 자연과 하나가 된 듯한 느낌을 받을 수 있습니다.\n\n이처럼 겨울 산행에서만 느낄 수 있는 특별한 경험은\n몸과 마음을 치유해 앞으로 나아갈 수 있는 새로운 에너지의 원동력이 되어줍니다.',
                    tag: '#눈꽃여행');
                VideoModel movieModel = VideoModel(
                  thumbnail: 'assets/images/eider_202402.png',
                  url: 'https://www.youtube.com/watch?v=7Qoq75-DQm4',
                  screenDirection: '가로',
                );
                FirestoreDataBase.addWork(workModel, idNumber);
                FirestoreDataBase.addVideo(movieModel, idNumber);
              },
              child: Text('데이터 입력'))
        ]));
  }
}
