import 'package:ams/model/work_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

final CollectionReference _worksCollectionReference = FirebaseFirestore.instance.collection('works');

class FirestoreDataBase {
  static Future<void> addWork(WorkModel workModel, String idNumber) async {
    await _worksCollectionReference
        .doc(idNumber)
        .set(workModel.toMap())
        .then((_) => Get.snackbar('데이터 등록', '데이터가 등록되었습니다.'))
        .catchError((error) => Get.snackbar('에러', '에러가 발생했습니다: $error'));
  }

  static Future<void> addVideo(VideoModel videoModel, String idNumber) async {
    await _worksCollectionReference
        .doc(idNumber)
        .collection("Movies")
        .add(videoModel.toMap())
        .then((_) => Get.snackbar('비디오 등록', '비디오가 등록되었습니다.'))
        .catchError((error) => Get.snackbar('에러', '에러가 발생했습니다: $error'));
  }
}

Future<List<String>> fetchCategoryList() async {
  QuerySnapshot querySnapshot = await _worksCollectionReference.get();
  List<String> categoryList = querySnapshot.docs.map((doc) {
    // data() 메소드를 사용하여 문서 데이터에 접근
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // 'category' 키를 사용하여 카테고리 값을 가져옴
    return data['category'] as String;
  }).toList();

  return categoryList;
}
