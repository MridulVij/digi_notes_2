import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/colors/colors.dart';
import 'custom_appbar.dart';
import 'custom_buttons.dart';
import 'custom_selector.dart';

enum Resource { timetable, syllabus, notes, pyqp }

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var resource = Resource.pyqp;

  String pyqp = "";
  String notes = "";
  String syllabus = "";
  String timetable = "";
  void fetchResources() {
    //
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        iconBackgroundColor: ConstColors.primaryColor,
                        icon: Icons.arrow_back_rounded,
                        iconColor: ConstColors.whitetext,
                        onPress: () {},
                        radius: 22),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Resources',
                        style: TextStyle(
                            color: ConstColors.primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6),
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
                        padding: const EdgeInsets.all(6),
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
                        padding: const EdgeInsets.all(6),
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
                        padding: const EdgeInsets.all(6),
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
                ),
                const Gap(3)
              ],
            )),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Column(
              children: [],
            );
          },
        ));
  }
}

class CustomCards extends StatelessWidget {
  const CustomCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Titletext'),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
