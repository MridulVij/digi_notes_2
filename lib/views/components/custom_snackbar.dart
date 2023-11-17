import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showCustomSnackbar(
      BuildContext context, String message, int warning) {
    final snackBar = SnackBar(
      backgroundColor: (warning == 1)
          ? Colors.red
          : (warning == 2)
              ? Colors.green
              : Colors.yellow,
      content: Text(
        message,
        style: TextStyle(color: warning == 3 ? Colors.black : Colors.white),
      ),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(10),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
