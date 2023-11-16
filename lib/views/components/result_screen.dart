import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/enums.dart';
import '../constants/colors/colors.dart';
import 'custom_appbar.dart';
import 'custom_buttons.dart';
import 'custom_selector.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({super.key, required this.querySnapshot});
  final QuerySnapshot? querySnapshot;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var resource = Resource.pyqp;

  String pyqp = "";
  String notes = "";
  String syllabus = "";
  String timetable = "";

  String pdfUrl = "";
  void fetchResources() {
    // Process each document in the collection
    for (QueryDocumentSnapshot document in widget.querySnapshot!.docs) {
      // Access document data as a Map
      Map<String, dynamic> questionPaperData =
          document.data() as Map<String, dynamic>;

      // Print or process the data as needed
      // pdfUrl = questionPaperData['url'];
      print('Document ID: ${document.id}');
      print('url: ${questionPaperData['url']}');

      // pdfUrl = questionPaperData['url'];
    }
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
                        onPress: () {
                          Navigator.pop(context);
                        },
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
                            fetchResources();
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
            return CustomCards();
          },
        ));
  }
}

class CustomCards extends StatelessWidget {
  const CustomCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: ConstColors.primaryColor),
          color: Colors.white),
    );
  }
}
