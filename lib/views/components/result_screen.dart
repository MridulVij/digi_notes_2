import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_selector.dart';

enum Resource { timetable, syllabus, notes, pyqp }

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var resource = Resource.pyqp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: CustomSelector(
                    backwardIcon: false,
                    centerText: true,
                    forwardIcon: false,
                    isSelected: resource == Resource.pyqp,
                    isSquareShapeButton: false,
                    onPress: () {
                      setState(() {
                        resource = Resource.pyqp;
                      });
                    },
                    titleText: " Prev-Year\nQs'n Papers",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: CustomSelector(
                      backwardIcon: false,
                      centerText: true,
                      forwardIcon: false,
                      isSelected: resource == Resource.notes,
                      isSquareShapeButton: false,
                      onPress: () {
                        setState(() {
                          resource = Resource.notes;
                        });
                      },
                      titleText: "Notes"),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: CustomSelector(
                      backwardIcon: false,
                      centerText: true,
                      forwardIcon: false,
                      isSelected: resource == Resource.syllabus,
                      isSquareShapeButton: false,
                      onPress: () {
                        setState(() {
                          resource = Resource.syllabus;
                        });
                      },
                      titleText: "Syllabus"),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: CustomSelector(
                      backwardIcon: false,
                      centerText: true,
                      forwardIcon: false,
                      isSelected: resource == Resource.timetable,
                      isSquareShapeButton: false,
                      onPress: () {
                        setState(() {
                          resource = Resource.timetable;
                        });
                      },
                      titleText: "Time Table"),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
