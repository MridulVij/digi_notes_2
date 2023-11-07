import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/detail_selector_provider.dart';
import 'views/screens/auth_ui/sign_in.dart';
import 'views/screens/splash_ui/splash.dart';
import 'views/widgets/detail_selector.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DetailsSelectorProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
            debugShowCheckedModeBanner: false,
            home: SplashUI());
      },
    );
  }
}
