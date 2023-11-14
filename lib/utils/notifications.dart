// import 'package:file_manager_app_task2/views/screens/lock_screen_notifications/services.dart';
import 'package:flutter/material.dart';

import 'notifications_services.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Notify().showNormalNotifications();
              },
              child: Text('Normal Notifications'),
            ),
            ElevatedButton(
                onPressed: () {
                  Notify().showScheduledNotification();
                },
                child: Text('Scheduled Notication'))
          ],
        ),
      ),
    );
  }
}
