import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DSAProvider extends ChangeNotifier {
  bool? weeklyAlert;
  bool? biweeklyAlert;

  // Weekly Contest Switch
  void setWeeklyContest(bool userInput) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('setweekly', userInput);
    notifyListeners();
  }

  // BiWeekly Contest Switch
  void setBiWeeklyContest(bool userInput) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('setbiweekly', userInput);
    notifyListeners();
  }

  void getUpdatesOnContestSwitches() async {
    final prefs = await SharedPreferences.getInstance();
    weeklyAlert = prefs.getBool('setweekly');
    biweeklyAlert = prefs.getBool('setbiweekly');
    notifyListeners();
  }
}
