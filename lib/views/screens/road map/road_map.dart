import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/detail_fetch_provider.dart';
import '../../components/custom_container.dart';

class RoadMapUI extends StatefulWidget {
  const RoadMapUI({super.key});

  @override
  State<RoadMapUI> createState() => _RoadMapUIState();
}

class _RoadMapUIState extends State<RoadMapUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        // itemCount: titleTxt!.entries.length,
        itemBuilder: (context, index) {
          return CustomContainer(
            boxColor: ConstColors.whitetext,
            child: Image.network(
              "",
              fit: BoxFit.cover,
              height: 100,
            ),
            inRow: false,
            textColor: Colors.black,
            title: "",
          );
        },
      ),
    );
  }
}
