import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../data/api/detail_fetcher.dart';
import 'custom_container.dart';
import 'custom_selector.dart';
import '../constants/colors/consts.dart';

enum Session {
  two,
  one,
}

enum University {
  hsbte,
  kuk,
}

enum Course {
  civil,
  cse,
}

enum Semester {
  eight,
  seven,
  six,
  five,
  four,
  three,
  two,
  one,
}

class DetailSelectorUI extends StatefulWidget {
  const DetailSelectorUI({super.key});

  @override
  State<DetailSelectorUI> createState() => _DetailSelectorUIState();
}

class _DetailSelectorUIState extends State<DetailSelectorUI> {
  var session = Session.one;
  var university = University.hsbte;
  var course = Course.civil;
  var semester = Semester.one;

  DetailFetcher detailFetcher = DetailFetcher();
  DetailsFetcherAccordingToUserInput path =
      DetailsFetcherAccordingToUserInput();
  dynamic response;

  Future fetchStart() async {
    response =
        await detailFetcher.customFetcher(path.qp_22_kuk_cse_7th_syllabus);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // return Consumer<DetailsSelectorProvider>(
    //   builder: (context, state, child) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainer(
              title: "Session",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSelector(
                    forwardIcon: false,
                    backwardIcon: false,
                    centerText: true,
                    titleText: "  2021  ",
                    isSquareShapeButton: true,
                    isSelected: session == Session.one,
                    onPress: () {
                      setState(() {
                        session = Session.one;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  CustomSelector(
                    forwardIcon: false,
                    backwardIcon: false,
                    centerText: true,
                    titleText: " 2022 ",
                    isSquareShapeButton: true,
                    isSelected: session == Session.two,
                    onPress: () {
                      setState(() {
                        session = Session.two;
                      });
                    },
                  ),
                ],
              ),
            ),
            CustomContainer(
              title: "Session",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSelector(
                    forwardIcon: false,
                    backwardIcon: false,
                    centerText: true,
                    titleText: "             K.U.K            ",
                    isSquareShapeButton: true,
                    isSelected: university == University.kuk,
                    onPress: () {
                      setState(() {
                        university = University.kuk;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  CustomSelector(
                    forwardIcon: false,
                    backwardIcon: false,
                    centerText: true,
                    titleText: "        H.S.B.T.E       ",
                    isSquareShapeButton: true,
                    isSelected: university == University.hsbte,
                    onPress: () {
                      setState(() {
                        university = University.hsbte;
                      });
                    },
                  ),
                ],
              ),
            ),
            CustomContainer(
              title: "Session",
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSelector(
                    forwardIcon: false,
                    backwardIcon: false,
                    centerText: true,
                    titleText: "  CSE ",
                    isSquareShapeButton: true,
                    isSelected: course == Course.cse,
                    onPress: () {
                      setState(() {
                        course = Course.cse;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  CustomSelector(
                    forwardIcon: false,
                    backwardIcon: false,
                    centerText: true,
                    titleText: "CIVIL",
                    isSquareShapeButton: true,
                    isSelected: course == Course.civil,
                    onPress: () {
                      setState(() {
                        course = Course.civil;
                      });
                    },
                  ),
                ],
              ),
            ),
            CustomContainer(
              title: "Session",
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSelector(
                        forwardIcon: false,
                        backwardIcon: false,
                        centerText: true,
                        titleText: " 1st ",
                        isSquareShapeButton: true,
                        isSelected: semester == Semester.one,
                        onPress: () {
                          setState(() {
                            semester = Semester.one;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      CustomSelector(
                        forwardIcon: false,
                        backwardIcon: false,
                        centerText: true,
                        titleText: " 2nd ",
                        isSquareShapeButton: true,
                        isSelected: semester == Semester.two,
                        onPress: () {
                          setState(() {
                            semester = Semester.two;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      CustomSelector(
                        forwardIcon: false,
                        backwardIcon: false,
                        centerText: true,
                        titleText: " 3rd ",
                        isSquareShapeButton: true,
                        isSelected: semester == Semester.three,
                        onPress: () {
                          setState(() {
                            semester = Semester.three;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      CustomSelector(
                        forwardIcon: false,
                        backwardIcon: false,
                        centerText: true,
                        titleText: " 4th ",
                        isSquareShapeButton: true,
                        isSelected: semester == Semester.four,
                        onPress: () {
                          setState(() {
                            semester = Semester.four;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSelector(
                        forwardIcon: false,
                        backwardIcon: false,
                        centerText: true,
                        titleText: " 5th ",
                        isSquareShapeButton: true,
                        isSelected: semester == Semester.five,
                        onPress: () {
                          setState(() {
                            semester = Semester.five;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      CustomSelector(
                        forwardIcon: false,
                        backwardIcon: false,
                        centerText: true,
                        titleText: " 6th ",
                        isSquareShapeButton: true,
                        isSelected: semester == Semester.six,
                        onPress: () {
                          setState(() {
                            semester = Semester.six;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      CustomSelector(
                        forwardIcon: false,
                        backwardIcon: false,
                        centerText: true,
                        titleText: " 7th ",
                        isSquareShapeButton: true,
                        isSelected: semester == Semester.seven,
                        onPress: () {
                          setState(() {
                            semester = Semester.seven;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      CustomSelector(
                        forwardIcon: false,
                        backwardIcon: false,
                        centerText: true,
                        titleText: " 8th ",
                        isSquareShapeButton: true,
                        isSelected: semester == Semester.eight,
                        onPress: () {
                          setState(() {
                            semester = Semester.eight;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // state.getPdfs();
                },
                child: Text("Search"))
          ],
        ),
      ),
    );
    // },
    // );
  }
}
