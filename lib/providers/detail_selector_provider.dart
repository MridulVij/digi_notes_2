import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailsSelectorProvider extends ChangeNotifier {
//   void getPdfs() async {
//  final FirebaseFirestore firestore = FirebaseFirestore.instance;
// List<String> imageURLs = [];
// // Reference to the "url" collection
// final urlCollectionRef = firestore
//     .collection('question_papers')
//     .doc('2022')
//     .collection('KUK')
//     .doc('CSE')
//     .collection('7th')
//     .doc('Syllabus')
//     .collection('url');

// urlCollectionRef.get().then((QuerySnapshot querySnapshot) {
//   querySnapshot.docs.forEach((QueryDocumentSnapshot doc) {
//     String url = doc.data()['url']; // Assuming 'url' is the field name in Firestore
//     imageURLs.add(url);
//   });
// });

//   }

  notifyListeners();
}
