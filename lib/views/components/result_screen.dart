import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../providers/detail_fetch_provider.dart';
import '../../utils/enums.dart';
import '../constants/colors/colors.dart';
import 'custom_appbar.dart';
import 'custom_buttons.dart';
import 'custom_loading.dart';
import 'custom_selector.dart';
import 'image_viewer.dart';
import 'pdf_viewer.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(

      // required this.querySnapshot
      // required this.queryPath
      );
  // final QuerySnapshot? querySnapshot;
  // String queryPath = "Unknown Path, Please Go Back & Search Again!";

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  //Artifical Fetch

  void testFetch() {
    CollectionReference _products = FirebaseFirestore.instance
        .collection('main_data/2022/KUK/CSE/7th/Notes/oose/');
    Future<QuerySnapshot> querySnapshot = _products.get();
  }

  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchResources();
    testFetch();
  }

  var resource = Resource.pyqp;

  String pyqp = "";
  String notes = "";
  String syllabus = "";
  String timetable = "";
  String pdfUrl = "";
  String resultWanted = "";
  String data = "";

  Map<String, dynamic>? TimeTable, Syllabus, PYQP, Notes;
  // List<Map<String, dynamic>> Notes = [];
  List<QueryDocumentSnapshot>? document;
  void fetchResources() async {
    QuerySnapshot? querySnapshot =
        context.read<DetailFetchProvider>().querySnapshot;
    document = await querySnapshot!.docs;
    Notes = document![0].data() as Map<String, dynamic>;
    PYQP = document![1].data() as Map<String, dynamic>;
    Syllabus = document![2].data() as Map<String, dynamic>;
    TimeTable = document![3].data() as Map<String, dynamic>;

    print(Notes);
    print(PYQP);
    print(Syllabus);
    print(TimeTable);

    switch (resultWanted) {
      case "syllabus":
        data = Syllabus!['url'];
      case "timetable":
        data = TimeTable!['url'];
      case "pyqp":
        data = PYQP!['url'];
      case "notes":
        data = Notes!['url'];
      default:
        data = PYQP!['url'];
        count = PYQP!.entries.length;
    }
    checkFileExtension(data);
    setState(() {});
  }

  bool isPNG = false;
  bool isPDF = false;
  void checkFileExtension(String url) {
    isPNG = checkFileType(url, '.png');
    isPDF = checkFileType(url, '.pdf');

    print('.png found: $isPNG');
    print('.pdf found: $isPDF');
  }

  bool checkFileType(String input, String fileType) {
    // Convert the input string and file type to lowercase for case-insensitive matching
    String lowercaseInput = input.toLowerCase();
    String lowercaseFileType = fileType.toLowerCase();

    return lowercaseInput.contains(lowercaseFileType);
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailFetchProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: CustomAppBar(
          appBarColor: Color.fromARGB(255, 242, 251, 255),
          height: 155,
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
                    padding: const EdgeInsets.all(4.0),
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
                          resultWanted = "pyqp";
                          fetchResources();
                          count = PYQP!.entries.length;
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
                            resultWanted = "notes";
                            fetchResources();
                            // count = Notes!.entries.length;
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
                            resultWanted = "syllabus";
                            fetchResources();
                            count = Syllabus!.entries.length;
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
                            resultWanted = "timetable";
                            fetchResources();
                            count = TimeTable!.entries.length;
                          },
                          titleText: "Time Table"),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      // widget.queryPath,
                      "",
                      style: TextStyle(
                          color: ConstColors.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: StreamBuilder(
          // stream: paths.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              return ListView.builder(
                itemCount: asyncSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      asyncSnapshot.data!.docs[index];
                  return Column(
                    children: [
                      Text('${documentSnapshot['t']}'),
                      Text('${documentSnapshot['u']}'),
                    ],
                  );
                },
              );
            } else {
              return Center(
                  child: Container(
                color: const Color.fromARGB(182, 0, 0, 0),
                child: const CustomLoading(),
              ));
            }
          },
        ),
      ),
    );
  }
}
