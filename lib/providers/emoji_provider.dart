import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmojiProvider extends ChangeNotifier {
  String _emoji_url = "";
  String get emoji_url => _emoji_url;
  var emoji_img;
  Future<void> fetchData() async {
    QuerySnapshot? emoji_url;
    List<QueryDocumentSnapshot>? output;
    CollectionReference emoji = await FirebaseFirestore.instance
        .collection('navbar_emoji/emoji_url/url');
    emoji_url = await emoji.get();
    for (var url in await emoji_url.docs) {
      emoji_img = url[0].data() as Map<String, dynamic>;
      print('Hello Bro Emoji Fetcher,${emoji_img['url']}');
    }
    _emoji_url = emoji_img['url'];
  }
}
