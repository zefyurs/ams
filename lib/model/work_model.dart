// sk2
class WorkModel {
  int idNumber;
  String category;
  String brandName;
  String title;
  String thumbnail;
  String url;
  String year;
  String screenDirection;
  String description; //

  WorkModel({
    required this.idNumber,
    required this.category,
    required this.brandName,
    required this.title,
    required this.thumbnail,
    required this.url,
    required this.year,
    required this.screenDirection,
    required this.description,
  });
}

// eider, Sulshasoo, GREGORY, POLO, LANCOME, SERGIO TAACHINI, WILSON, REATHERDOWN, HANSSEM, SSG.COM, Columbia, LOTTE ON, LEKI, HYUNDAI, KG MOBILITY, TREK,
List<WorkModel> workList = [
  WorkModel(
    idNumber: 202402,
    category: '패션/의류',
    brandName: 'EIDER',
    title: 'F/W 눈꽃 산행',
    thumbnail: 'assets/images/eider_202402.png',
    url: 'https://www.youtube.com/watch?v=7Qoq75-DQm4',
    year: '2024',
    screenDirection: '가로/세로',
    description: '',
  ),
  WorkModel(
    idNumber: 202401,
    category: '화장품',
    brandName: 'SK-II',
    title: '화장품광고',
    thumbnail: 'assets/images/sk2_202401.png',
    url: 'https://www.youtube.com/watch?v=7Qoq75-DQm4',
    year: '2024',
    screenDirection: '세로',
    description: '',
  ),
  WorkModel(
    idNumber: 202312,
    brandName: 'ANDAR',
    category: '패션/의류',
    title: '홍콩관광청 x ANDAR 요가',
    thumbnail: 'assets/images/hongkong_202303.png',
    url: 'https://www.youtube.com/watch?v=7Qoq75-DQm4',
    year: '2023',
    screenDirection: '세로',
    description: '',
  ),
  WorkModel(
    idNumber: 202311,
    category: '패션/의류',
    brandName: '룰루레몬',
    title: '쇼핑편',
    thumbnail: 'assets/images/lululemon_202302.png',
    url: 'https://www.youtube.com/watch?v=7Qoq75-DQm4',
    year: '2023',
    screenDirection: '가로',
    description: '',
  ),
];
