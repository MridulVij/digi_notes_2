import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../components/custom_container.dart';

class RoadMapUI extends StatefulWidget {
  const RoadMapUI({super.key});

  @override
  State<RoadMapUI> createState() => _RoadMapUIState();
}

class _RoadMapUIState extends State<RoadMapUI> {
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
        itemCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              //
            },
            child: CustomContainer(
              boxColor: ConstColors.whitetext,
              child: Container(),
              inRow: false,
              textColor: Colors.black,
              title: "",
            ),
          );
        },
      ),
    );
  }
}
