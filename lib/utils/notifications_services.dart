import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class Notify {
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  void showScheduledNotification() async {
    AndroidNotificationDetails androiddetails =
        const AndroidNotificationDetails(
            "notifications-youtube", "Youtube Notifications",
            audioAttributesUsage: AudioAttributesUsage.alarm,
            priority: Priority.max,
            importance: Importance.max);

    DarwinNotificationDetails iosdetails = const DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androiddetails, iOS: iosdetails);
    DateTime scheduleDate = DateTime.now().add(
      const Duration(seconds: 5),
    );
    await notificationsPlugin.zonedSchedule(
        0,
        "Sample Notification",
        "This is a notification",
        tz.TZDateTime.from(scheduleDate, tz.local),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: "notification-payload");

    // notificationsPlugin.cancel(0);
  }

  void showNormalNotifications() async {
    AndroidNotificationDetails androiddetails =
        const AndroidNotificationDetails(
            "notifications-youtube", "Youtube Notifications",
            audioAttributesUsage: AudioAttributesUsage.alarm,
            priority: Priority.max,
            importance: Importance.max);

    DarwinNotificationDetails iosdetails = const DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androiddetails, iOS: iosdetails);
    DateTime scheduleDate = DateTime.now().add(
      const Duration(seconds: 5),
    );
    await notificationsPlugin.show(0, "Sample Notification",
        "This is a notification", notificationDetails);

    // notificationsPlugin.cancel(0);
  }

  void checkForNotificationDetails() async {
    NotificationAppLaunchDetails? details =
        await notificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null) {
      if (details.didNotificationLaunchApp) {
        NotificationResponse? response = details.notificationResponse;

        if (response != null) {
          String? payload = response.payload;
          log("Notification Payload: $payload");
        }
      }
    }
  }
}
