import 'package:cloud_firestore/cloud_firestore.dart';

class DetailFetcher {
  CollectionReference fetchData(String path) {
    print(path);
    final CollectionReference data =
        FirebaseFirestore.instance.collection(path);
    return data;
  }
}
