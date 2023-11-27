import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String weekly = 'weeklyKey';
  static const String biweekly = 'biweeklyKey';

  static Future<bool> getWeeklySwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(weekly) ?? false;
  }

  static Future<bool> getBiWeeklySwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(biweekly) ?? false;
  }

  static Future<void> setWeeklySwitchState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(weekly, value);
  }

  static Future<void> setBiWeeklySwitchState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(biweekly, value);
  }
}
