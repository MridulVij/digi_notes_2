import 'package:firebase_messaging/firebase_messaging.dart';

import '../providers/notification_provider.dart';

class FirebaseNotifications {
  final fN = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await fN.requestPermission();
    final fCMTokens = await fN.getToken();
    print('FCM Token: ${fCMTokens}');
    FirebaseMessaging.onBackgroundMessage(backgroundNotifications);
  }
}

List<Map<String, dynamic>> LM = [];
Future<List<Map<String, dynamic>>> backgroundNotifications(
    RemoteMessage message) async {
  print('${message.notification?.title}');
  print('${message.notification?.body}');
  print('${message.data}');
  LM.add({
    "title": message.notification?.title,
    "subtitle": message.notification?.body,
    "data": message.data,
  });

  return LM;
}
