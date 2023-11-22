import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailFetchProvider extends ChangeNotifier {
  CollectionReference? products;
  Future<void> collectionFetchApi(String path) async {
    products = FirebaseFirestore.instance.collection(path);
    notifyListeners();
  }
}
