import 'package:flutter/foundation.dart';

class SettingsModel extends ChangeNotifier {
  bool _isweeklySwitched = false;
  bool _isbiweeklySwitched = false;

  bool get isWeeklySwitched => _isweeklySwitched;
  bool get isBiWeeklySwitched => _isbiweeklySwitched;

  // Update switch state and notify listeners
  void updateWeeklySwitchState(bool newState) {
    _isweeklySwitched = newState;
    notifyListeners();
  }

  void updateBiWeeklySwitchState(bool newState) {
    _isbiweeklySwitched = newState;
    notifyListeners();
  }
}



// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DSAProvider extends ChangeNotifier {
//   bool weeklyAlert = false;
//   bool biweeklyAlert = false;

//   // Weekly Contest Switch
//   void setWeeklyContest(bool userInput) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool('setweekly', userInput);
//     notifyListeners();
//   }

//   // BiWeekly Contest Switch
//   void setBiWeeklyContest(bool userInput) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool('setbiweekly', userInput);
//     notifyListeners();
//   }

//   void getUpdatesOnContestSwitches() async {
//     final prefs = await SharedPreferences.getInstance();
//     weeklyAlert = prefs.getBool('setweekly');
//     biweeklyAlert = prefs.getBool('setbiweekly');
//     notifyListeners();
//   }
// }
