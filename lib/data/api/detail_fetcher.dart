import 'package:cloud_firestore/cloud_firestore.dart';

class DetailFetcher {
//
  CollectionReference fetchData(String path) {
    print(path);
    final CollectionReference data =
        FirebaseFirestore.instance.collection(path);
    return data;
  }

//
  CollectionReference fetchRoadmapData() {
    // print(path);
    final CollectionReference data =
        FirebaseFirestore.instance.collection('roadmaps');
    return data;
  }

//
  CollectionReference fetchDSASheetsData() {
    // print(path);
    final CollectionReference data =
        FirebaseFirestore.instance.collection('dsa_sheets');
    return data;
  }
}
