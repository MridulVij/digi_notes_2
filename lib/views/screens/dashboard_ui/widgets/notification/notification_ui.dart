import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationUI extends StatefulWidget {
  const NotificationUI({super.key});

  @override
  State<NotificationUI> createState() => _NotificationUIState();
}

class _NotificationUIState extends State<NotificationUI> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return Scaffold(
          body: ListView.builder(
            itemBuilder: (context, index) {
              return Container();
            },
          ),
        );
      },
    );
  }
}
