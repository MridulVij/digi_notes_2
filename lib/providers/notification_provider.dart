import 'package:digi_notes_2/utils/notifications_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cartItems = [];

  Future<void> addItemsInCart() async {
    Future<List<Map<String, dynamic>>> result =
        backgroundNotifications(RemoteMessage());
    for (var output in await result) {
      print(output);
      cartItems.add(output);
    }
    notifyListeners();
  }

  void removeItemsFromCart(int i) {
    cartItems.removeAt(i);
    notifyListeners();
  }

  void removeAllItemsFromCart() {
    cartItems.clear();
    notifyListeners();
  }
}
