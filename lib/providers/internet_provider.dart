import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetProvider {
  Future<bool> checkInternetConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}

class InternetProviderNotifier extends ChangeNotifier {
  bool result = false;
  void checkInternet() async {
    print(result);
    result = await InternetProvider().checkInternetConnectivity();
    print(result);
    notifyListeners();
  }
}

// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// class InternetProvider {
//   StreamController<bool> _internetStatusController = StreamController<bool>();

//   Stream<bool> get internetStatusStream => _internetStatusController.stream;

//   Future<void> checkInternetConnectivity() async {
//     final connectivityResult = await Connectivity().checkConnectivity();
//     _updateInternetStatus(connectivityResult != ConnectivityResult.none);
//   }

//   void _updateInternetStatus(bool isConnected) {
//     _internetStatusController.add(isConnected);
//   }
// }

// class InternetProviderNotifier extends ChangeNotifier {
//   bool result = false;
//   final InternetProvider _internetProvider = InternetProvider();

//   StreamSubscription<bool>? _internetStatusSubscription;

//   InternetProviderNotifier() {
//     _internetStatusSubscription =
//         _internetProvider.internetStatusStream.listen((bool isConnected) {
//       result = isConnected;
//       notifyListeners();
//     });
//   }

//   void checkInternet() async {
//     print(result);
//     await _internetProvider.checkInternetConnectivity();
//   }

//   @override
//   void dispose() {
//     _internetStatusSubscription?.cancel();
//     super.dispose();
//   }
// }
