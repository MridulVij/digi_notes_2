import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailFetchProvider extends ChangeNotifier {
  QuerySnapshot? querySnapshot;
  Future<void> getQuestionPapers(String path) async {
    // Specify the path to the collection
    CollectionReference questionPapersCollection =
        await FirebaseFirestore.instance.collection(path);
    // Get documents in the collection
    querySnapshot = await questionPapersCollection.get();
    notifyListeners();
  }
}
