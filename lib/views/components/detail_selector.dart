import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_notes_2/views/components/result_screen.dart';
import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../data/api/detail_fetcher.dart';
import '../../providers/internet_provider.dart';
import '../../utils/enums.dart';
import '../../utils/global_functions.dart';
import 'custom_buttons.dart';
import 'custom_container.dart';
import 'custom_loading.dart';
import 'custom_selector.dart';
import 'custom_snackbar.dart';

class DetailSelectorUI extends StatefulWidget {
  const DetailSelectorUI({super.key});

  @override
  State<DetailSelectorUI> createState() => _DetailSelectorUIState();
}

class _DetailSelectorUIState extends State<DetailSelectorUI> {
  var session = Session.nill;
  var university = University.nill;
  var course = Course.nill;
  var semester = Semester.nill;

  DetailFetcher detailFetcher = DetailFetcher();
  QuerySnapshot? querySnapshot;
  Future<void> getQuestionPapers(String path) async {
    // Specify the path to the collection
    CollectionReference questionPapersCollection =
        await FirebaseFirestore.instance.collection(path);

    // Get documents in the collection
    querySnapshot = await questionPapersCollection.get();
    setState(() {});
  }

  String base = "question_papers";
  String sess = "";
  String univrsty = "";
  String corse = "";
  String sem = "";
  bool isLoading = false;

  void refresh() {
    isLoading = !isLoading;
    setState(() {});
  }

  GlobalFunctions globalFunctions = GlobalFunctions();

  InternetProvider internetProvider = InternetProvider();
  @override
  Widget build(BuildContext context) {
    // return Consumer<DetailsSelectorProvider>(
    //   builder: (context, state, child) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomContainer(
                    boxColor: ConstColors.lightSky,
                    textColor: ConstColors.primaryColor,
                    isSearchMode: false,
                    inRow: false,
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
                              titleText: "  2021  ",
                              isSquareShapeButton: true,
                              isSelected: session == Session.one,
                              onPress: () {
                                setState(() {
                                  session = Session.one;
                                });
                                sess = "/2021";

                                print(base);
                              },
                            ),
                            const Gap(25),
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
                                sess = "/2022";
                                print(base);
                              },
                            ),
                          ],
                        ),
                        const Gap(10),
                      ],
                    ),
                  ),
                  CustomContainer(
                    boxColor: ConstColors.lightSky,
                    textColor: ConstColors.primaryColor,
                    isSearchMode: false,
                    inRow: false,
                    title: "University",
                    child: Column(
                      children: [
                        Row(
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
                                univrsty = "/KUK";
                              },
                            ),
                            const Gap(25),
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
                                univrsty = "/HSBTE";
                              },
                            ),
                          ],
                        ),
                        const Gap(10),
                      ],
                    ),
                  ),
                  CustomContainer(
                    boxColor: ConstColors.lightSky,
                    textColor: ConstColors.primaryColor,
                    isSearchMode: false,
                    inRow: false,
                    title: "Course",
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSelector(
                              forwardIcon: false,
                              backwardIcon: false,
                              centerText: true,
                              titleText: "   CSE   ",
                              isSquareShapeButton: true,
                              isSelected: course == Course.cse,
                              onPress: () {
                                setState(() {
                                  course = Course.cse;
                                });
                                corse = "/CSE";
                              },
                            ),
                            const Gap(25),
                            CustomSelector(
                              forwardIcon: false,
                              backwardIcon: false,
                              centerText: true,
                              titleText: "  CIVIL  ",
                              isSquareShapeButton: true,
                              isSelected: course == Course.civil,
                              onPress: () {
                                setState(() {
                                  course = Course.civil;
                                });
                                corse = "/CIVIL";
                              },
                            ),
                          ],
                        ),
                        const Gap(10),
                      ],
                    ),
                  ),
                  CustomContainer(
                    boxColor: ConstColors.lightSky,
                    textColor: ConstColors.primaryColor,
                    isSearchMode: false,
                    inRow: false,
                    title: "Semester",
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSelector(
                              forwardIcon: false,
                              backwardIcon: false,
                              centerText: true,
                              titleText: "  1st  ",
                              isSquareShapeButton: true,
                              isSelected: semester == Semester.one,
                              onPress: () {
                                setState(() {
                                  semester = Semester.one;
                                });
                                sem = "/1st";
                              },
                            ),
                            const Gap(25),
                            CustomSelector(
                              forwardIcon: false,
                              backwardIcon: false,
                              centerText: true,
                              titleText: "  2nd  ",
                              isSquareShapeButton: true,
                              isSelected: semester == Semester.two,
                              onPress: () {
                                setState(() {
                                  semester = Semester.two;
                                });
                                sem = "/2nd";
                              },
                            ),
                            const Gap(25),
                            CustomSelector(
                              forwardIcon: false,
                              backwardIcon: false,
                              centerText: true,
                              titleText: "  3rd  ",
                              isSquareShapeButton: true,
                              isSelected: semester == Semester.three,
                              onPress: () {
                                setState(() {
                                  semester = Semester.three;
                                });
                                sem = "/3rd";
                              },
                            ),
                            const Gap(25),
                            CustomSelector(
                              forwardIcon: false,
                              backwardIcon: false,
                              centerText: true,
                              titleText: "  4th  ",
                              isSquareShapeButton: true,
                              isSelected: semester == Semester.four,
                              onPress: () {
                                setState(() {
                                  semester = Semester.four;
                                });
                                sem = "/4th";
                              },
                            ),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomSelector(
                              forwardIcon: false,
                              backwardIcon: false,
                              centerText: true,
                              titleText: "  5th  ",
                              isSquareShapeButton: true,
                              isSelected: semester == Semester.five,
                              onPress: () {
                                setState(() {
                                  semester = Semester.five;
                                });
                                sem = "/5th";
                              },
                            ),
                            const Gap(25),
                            CustomSelector(
                              forwardIcon: false,
                              backwardIcon: false,
                              centerText: true,
                              titleText: "  6th  ",
                              isSquareShapeButton: true,
                              isSelected: semester == Semester.six,
                              onPress: () {
                                setState(() {
                                  semester = Semester.six;
                                });
                                sem = "/6th";
                              },
                            ),
                            const Gap(25),
                            CustomSelector(
                              forwardIcon: false,
                              backwardIcon: false,
                              centerText: true,
                              titleText: "  7th  ",
                              isSquareShapeButton: true,
                              isSelected: semester == Semester.seven,
                              onPress: () {
                                setState(() {
                                  semester = Semester.seven;
                                });
                                sem = "/7th";
                              },
                            ),
                            const Gap(25),
                            CustomSelector(
                              forwardIcon: false,
                              backwardIcon: false,
                              centerText: true,
                              titleText: "  8th  ",
                              isSquareShapeButton: true,
                              isSelected: semester == Semester.eight,
                              onPress: () {
                                setState(() {
                                  semester = Semester.eight;
                                });
                                sem = "/8th";
                              },
                            ),
                          ],
                        ),
                        const Gap(10),
                      ],
                    ),
                  ),
                  //
                  InkWell(
                    onTap: () async {
                      String queryUrl = base + sess + univrsty + corse + sem;

                      if (queryUrl.isNotEmpty &&
                          base.isNotEmpty &&
                          sess.isNotEmpty &&
                          univrsty.isNotEmpty &&
                          corse.isNotEmpty &&
                          sem.isNotEmpty) {
                        refresh();
                        bool result =
                            await internetProvider.checkInternetConnectivity();
                        if (result) {
                          print(queryUrl);
                          // api fetching start
                          await getQuestionPapers(queryUrl);
                          String pathShower =
                              globalFunctions.removeFirstPath(queryUrl);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                querySnapshot: querySnapshot,
                                queryPath: pathShower,
                              ),
                            ),
                          );
                          refresh();
                        } else {
                          CustomSnackbar.showCustomSnackbar(context,
                              "Please Check Your Internet Connection!", 1);
                          refresh();
                        }
                      } else {
                        print('Options is not selected - Error');
                        CustomSnackbar.showCustomSnackbar(
                            context, "Please Select All Options!", 3);
                      }
                    },
                    child: CustomContainer(
                        boxColor: ConstColors.lightSky,
                        textColor: ConstColors.whitetext,
                        inRow: true,
                        isSearchMode: true,
                        child: CustomButton(
                          iconBackgroundColor: ConstColors.whitetext,
                          icon: Icons.search,
                          radius: 20,
                          iconColor: ConstColors.primaryColor,
                        ),
                        title: "Search"),
                  )
                ],
              ),
            ),
            isLoading
                ? Container(
                    color: const Color.fromARGB(182, 0, 0, 0),
                    child: const CustomLoading(),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
    // },
    // );
  }
}
