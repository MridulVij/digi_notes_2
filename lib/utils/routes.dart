import 'package:digi_notes_2/views/components/detail_selector.dart';
import 'package:digi_notes_2/views/screens/dashboard_ui/dashboard.dart';
import 'package:digi_notes_2/views/screens/splash_ui/splash.dart';
import 'package:flutter/material.dart';

import '../views/constants/colors/consts.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterNames.detail_selector:
        return MaterialPageRoute(
            builder: (context) => const DetailSelectorUI());
      case RouterNames.dashboard:
        return MaterialPageRoute(builder: (context) => const DashboardUI());
      case RouterNames.splash_screen:
        return MaterialPageRoute(builder: (context) => const SplashUI());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route Not Found"),
            ),
          ),
        );
    }
  }
}
