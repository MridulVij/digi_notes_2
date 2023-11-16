import 'package:flutter/material.dart';

class CustomSnackbar {
  static showSnackBarMessage(BuildContext context, String msg) {
    void showSnackbar(BuildContext context) {
      final snackbar = SnackBar(content: Text(msg));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
