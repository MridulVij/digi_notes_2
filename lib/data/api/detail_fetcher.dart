import 'package:cloud_firestore/cloud_firestore.dart';

class DetailFetcher {
  customFetcher(String path) async {
    List<String> value = path.split("/");

    var response = await FirebaseFirestore.instance
        .collection(value[0])
        .doc(value[1])
        .collection(value[2])
        .doc(value[3])
        .collection(value[4])
        .doc(value[5])
        .snapshots();

    return response;
  }
}
