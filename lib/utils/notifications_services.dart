import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  final fN = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await fN.requestPermission();
    final fCMTokens = await fN.getToken();
    print('FCM Token: ${fCMTokens}');
    FirebaseMessaging.onBackgroundMessage(backgroundNotifications);
  }
}

Future<void> backgroundNotifications(RemoteMessage message) async {
  print('${message.notification?.title}');
  print('${message.notification?.body}');
  print('${message.data}');
}
