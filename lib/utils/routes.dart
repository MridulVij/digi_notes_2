import 'package:digi_notes_2/providers/auth_providers.dart';
import 'package:digi_notes_2/views/components/detail_selector.dart';
import 'package:digi_notes_2/views/components/result_screen.dart';
import 'package:digi_notes_2/views/screens/auth_ui/auth_ui.dart';
import 'package:digi_notes_2/views/screens/dashboard_ui/dashboard.dart';
import 'package:digi_notes_2/views/screens/splash_ui/splash.dart';
import 'package:flutter/material.dart';

import '../views/constants/colors/consts.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 190),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset(0.0, 0.0);
          const curve = Curves.linear;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          switch (settings.name) {
            case RouterNames.dashboard:
              return const DashboardUI();
            case RouterNames.detail_selector:
              return const DetailSelectorUI();
            case RouterNames.result_screen:
              return const ResultScreen();
            case RouterNames.sign_in_screen:
              return SignInUI();
            case RouterNames.splash_screen:
              return const SplashUI();
            case RouterNames.auth_verifier:
              return const AuthVerifier();
            default:
              return const Scaffold(
                body: Center(
                  child: Text("No Routes Found"),
                ),
              );
          }
        });
  }
}
