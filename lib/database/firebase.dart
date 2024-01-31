import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDataBase {
  final CollectionReference _usersCollectionReference = FirebaseFirestore.instance.collection('Works');

  Future<void> addWork(String idNumber, String category, String brandName, String title, String thumbnail, String url,
      String screenDirection, String description, String tag) async {
    return await _usersCollectionReference
        .doc(idNumber)
        .set({
          'idNumber': idNumber,
          'category': category,
          'brandName': brandName,
          'title': title,
          'thumbnail': thumbnail,
          'url': url,
          'screenDirection': screenDirection,
          'description': description,
          'tag': tag,
        })
        .then((value) => print("Work Added"))
        .catchError((error) => print("Failed to add Work: $error"));
  }

  Stream<QuerySnapshot> getWorks() {
    return _usersCollectionReference.snapshots();
  }
}
