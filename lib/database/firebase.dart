import 'package:ams/model/work_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreDataBase {
  static final CollectionReference _worksCollectionReference = FirebaseFirestore.instance.collection('works');

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
