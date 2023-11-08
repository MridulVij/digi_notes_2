import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../providers/auth_providers.dart';

class SplashUI extends StatefulWidget {
  const SplashUI({super.key});

  @override
  State<SplashUI> createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Wait for 2 seconds and then navigate to the home screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AuthVerifier()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(),
        body: Center(
          child: Image.asset(
            'assets/images/splash.gif',
            width: 200,
            height: 200,
          ),
        ));
  }
}
