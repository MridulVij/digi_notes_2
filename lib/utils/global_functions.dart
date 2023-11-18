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

  String removeFirstPath(String path) {
    // Split the path using '/'
    List<String> pathParts = path.split('/');

    // Remove the first part of the path
    if (pathParts.isNotEmpty) {
      pathParts.removeAt(0);
    }

    // Join the path parts back together with '/'
    String updatedPath = pathParts.join('/');

    return updatedPath;
  }
}
