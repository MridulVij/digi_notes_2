import 'package:digi_notes_2/providers/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/custom_appbar.dart';
import '../../../../components/custom_buttons.dart';
import '../../../../constants/colors/colors.dart';

class NotificationUI extends StatefulWidget {
  const NotificationUI({super.key});

  @override
  State<NotificationUI> createState() => _NotificationUIState();
}

class _NotificationUIState extends State<NotificationUI> {
  int notificationCount = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: CustomAppBar(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        iconBackgroundColor: ConstColors.primaryColor,
                        icon: Icons.arrow_back_rounded,
                        iconColor: ConstColors.whitetext,
                        onPress: () {
                          Navigator.pop(context);
                        },
                        radius: 22),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        notificationCount == 0
                            ? "No Notification's"
                            : notificationCount < 2
                                ? "${notificationCount.toString()} Notification"
                                : "${notificationCount.toString()} Notification's",
                        style: TextStyle(
                            color: ConstColors.primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Provider.of<NotificationProvider>(context, listen: false)
                          .removeAllItemsFromCart();
                    },
                    child: Text("Clear All Notifications"))
              ],
            ),
          ),
          body: ListView.builder(
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) {
              var title = state.cartItems[index];
              return Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ConstColors.whitetext,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: const Color.fromARGB(255, 202, 202, 202),
                        offset: const Offset(0, 2),
                      ),
                    ]),
                child: ListTile(
                  title: Text(title["title"].toString()),
                  subtitle: Text(title["subtitle"].toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Provider.of<NotificationProvider>(context, listen: false)
                          .removeItemsFromCart(index);
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
