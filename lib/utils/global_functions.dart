import 'package:digi_notes_2/providers/internet_provider.dart';
import 'package:flutter/material.dart';

import '../views/components/custom_snackbar.dart';

class GlobalFunctions {
  InternetProvider internetProvider = InternetProvider();
  // BuildContext? context;
  Future<bool> checkInternetConnectionAndNotify(
      BuildContext context, String message, int msgType) async {
    bool check = await internetProvider.checkInternetConnectivity();
    if (!check) {
      CustomSnackbar.showCustomSnackbar(context, message, msgType);
    }
    return true;
  }
}
