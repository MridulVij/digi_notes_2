import 'package:flutter/material.dart';

class RoadMapDetailsUI extends StatefulWidget {
  const RoadMapDetailsUI({super.key, required this.link});
  final String link;

  @override
  State<RoadMapDetailsUI> createState() => _RoadMapDetailsUIState();
}

class _RoadMapDetailsUIState extends State<RoadMapDetailsUI> {
  @override
  Widget build(BuildContext context) {
    //WebView
    return Scaffold(
      body: Container(),
    );
  }
}
