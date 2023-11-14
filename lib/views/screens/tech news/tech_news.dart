import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TechNewsUI extends StatefulWidget {
  const TechNewsUI({super.key});

  @override
  State<TechNewsUI> createState() => _TechNewsUIState();
}

class _TechNewsUIState extends State<TechNewsUI> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.javatpoint.com/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
