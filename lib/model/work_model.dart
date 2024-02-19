import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  String thumbnail;
  String url;
  String screenDirection;

  VideoModel({
    required this.thumbnail,
    required this.url,
    required this.screenDirection,
  });
  Map<String, dynamic> toMap() {
    return {
      'thumbnail': thumbnail,
      'url': url,
      'screenDirection': screenDirection,
    };
  }
} // sk2

class WorkModel {
  Timestamp timeStamp;
  String idNumber;
  String category;
  String brandName;
  String title;
  int likes;
  // List<String> thumbnail;
  // List<String> url;
  // List<String> screenDirection;
  String description; //
  String tag;

  WorkModel({
    required this.timeStamp,
    required this.idNumber,
    required this.category,
    required this.brandName,
    required this.title,
    this.likes = 0,
    // required this.thumbnail,
    // required this.url,
    // required this.screenDirection,
    required this.description,
    required this.tag,
  });
  Map<String, dynamic> toMap() {
    return {
      'timeStamp': timeStamp,
      'idNumber': idNumber,
      'category': category,
      'brandName': brandName,
      'title': title,
      'likes': likes,
      // 'thumbnail': thumbnail,
      // 'url': url,
      // 'screenDirection': screenDirection,
      'description': description,
      'tag': tag,
    };
  }
}

// eider, Sulshasoo, GREGORY, POLO, LANCOME, SERGIO TAACHINI, WILSON, REATHERDOWN, HANSSEM, SSG.COM, Columbia, LOTTE ON, LEKI, HYUNDAI, KG MOBILITY, TREK,
// List<WorkModel> workList = [
//   WorkModel(
//       timeStamp: '22',
//       idNumber: '2024020101',
//       category: '패션/의류',
//       brandName: 'EIDER',
//       title: 'F/W 눈꽃 산행',
//       // thumbnail: ['assets/images/eider_202402.png'],
//       // url: ['https://www.youtube.com/watch?v=7Qoq75-DQm4'],
//       // screenDirection: ['가로', '세로'],
//       description:
//           '상고대로 뒤덮인 설산을 걸으며\n고요하고 아름다운 겨울의 정취를 만끽합니다. \n\n그리고 걸음마다 뽀드득 거리는 눈 소리와 바람소리가 어우러져 마치 자연과 하나가 된 듯한 느낌을 받을 수 있습니다.\n\n이처럼 겨울 산행에서만 느낄 수 있는 특별한 경험은\n몸과 마음을 치유해 앞으로 나아갈 수 있는 새로운 에너지의 원동력이 되어줍니다.',
//       tag: '#눈꽃여행'),
//   WorkModel(
//       timeStamp: '33',
//       idNumber: '20240101',
//       category: '화장품',
//       brandName: 'SK-II',
//       title: '화장품광고',
//       // thumbnail: ['assets/images/sk2_202401.png', 'assets/images/sk2_202401.png', 'assets/images/sk2_202401.png'],
//       // url: [
//       //   'https://www.youtube.com/watch?v=7Qoq75-DQm4',
//       //   'https://www.youtube.com/watch?v=7Qoq75-DQm4',
//       //   'https://www.youtube.com/watch?v=7Qoq75-DQm4'
//       // ],
//       // screenDirection: ['세로', '가로', '세로'],
//       description: 'SKII 메종키츠네 제품과함께 여러분들의 피부를 보호하세요!',
//       tag: '#화장품 #화장품광고 #영상제작'),
//   WorkModel(
//       timeStamp: '333',
//       idNumber: '20231201',
//       brandName: 'ANDAR',
//       category: '패션/의류',
//       title: '홍콩관광청 x ANDAR 요가',
//       // thumbnail: ['assets/images/hongkong_202303.png'],
//       // url: ['https://www.youtube.com/watch?v=7Qoq75-DQm4'],
//       // screenDirection: ['세로'],
//       description: '꿈만 같았던 홍콩 요가 촬영! \n여행과 운동을 좋아하는 저에게 너무 값진 경험이었어요 :)\n러닝, 여행 영상도 곧 오픈 예정이니 많은 기대 부탁드려요!',
//       tag: '#discoverhongkong #홍콩아웃도어 #홍콩선셋요가#harbourcity #FromCitytoNatu'),
//   WorkModel(
//       timeStamp: '344',
//       idNumber: '20231101',
//       category: '패션/의류',
//       brandName: '룰루레몬',
//       title: '쇼핑편',
//       // thumbnail: ['assets/images/lululemon_202302.png'],
//       // url: ['https://www.youtube.com/watch?v=7Qoq75-DQm4'],
//       // screenDirection: ['가로'],
//       description: '요가복은 룰루레몬 !',
//       tag: '#룰루레몬 #요가복 #영상 #요가영상'),
// ];
