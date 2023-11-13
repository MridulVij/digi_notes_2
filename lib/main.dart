import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_providers.dart';
import 'providers/detail_selector_provider.dart';
import 'views/screens/splash_ui/splash.dart';
import 'views/widgets/detail_selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailsSelectorProvider()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
            debugShowCheckedModeBanner: false,
            home: DetailSelectorUI());
      },
    );
  }
}
