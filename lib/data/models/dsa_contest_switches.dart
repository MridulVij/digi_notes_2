import 'package:flutter/foundation.dart';

class SettingsModel extends ChangeNotifier {
  bool _isSwitched = false;

  bool get isSwitched => _isSwitched;

  // Update switch state and notify listeners
  void updateSwitchState(bool newState) {
    _isSwitched = newState;
    notifyListeners();
  }
}
