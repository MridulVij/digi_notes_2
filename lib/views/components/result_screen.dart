import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
  String queryPath = "Unknown Path, Please Go Back & Search Again!";
  ResultScreen({required this.queryPath});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // App Bar Selector!
  var resource = Resource.pyqp;

  bool isPNG = false;
  bool isPDF = false;
  void checkFileExtension(String url) {
    isPNG = checkFileType(url, '.png');
    isPDF = checkFileType(url, '.pdf');

    print('.png found: $isPNG');
    print('.pdf found: $isPDF');
  }

  bool checkFileType(String input, String fileType) {
    String lowercaseInput = input.toLowerCase();
    String lowercaseFileType = fileType.toLowerCase();
    return lowercaseInput.contains(lowercaseFileType);
  }

  @override
  Widget build(BuildContext context) {
    DocumentSnapshot? documentSnapshot;
    return Consumer<DetailFetchProvider>(
      builder: (context, state, child) => Scaffold(
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
                          //
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
                          isSelected: resource == Resource.sessionals,
                          isSquareShapeButton: false,
                          onPress: () {
                            setState(() {
                              resource = Resource.sessionals;
                            });
                            //
                          },
                          titleText: "Sessionals"),
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
                            //
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
                            //
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
                            //
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
                      widget.queryPath,
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
          stream: state.products!.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              return ListView.builder(
                itemCount: asyncSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  documentSnapshot = asyncSnapshot.data!.docs[index];
                  // checkFileExtension(documentSnapshot['u']);
                  return InkWell(
                    splashColor: Colors.grey[350],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => isPDF
                              ? PdfViewer(
                                  path: documentSnapshot!['u'],
                                )
                              : ImageViewer(
                                  imageUrls: [documentSnapshot!['u']],
                                  initialIndex: 0),
                        ),
                      );
                    },
                    child: CustomResultBox(
                      title: documentSnapshot!['t'],
                      url: documentSnapshot!['u'],
                      isPdf: isPDF,
                    ),
                  );
                },
              );
            } else {
              return Center(
                  child: Container(
                color: Color.fromARGB(125, 0, 0, 0),
                child: const CustomLoading(),
              ));
            }
          },
        ),
      ),
    );
  }
}

// CustomResultBox Widget
class CustomResultBox extends StatelessWidget {
  const CustomResultBox(
      {super.key, required this.isPdf, required this.title, required this.url});
  final bool isPdf;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: ConstColors.lightGrey,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          isPdf
              ? const Icon(
                  Icons.picture_as_pdf_rounded,
                  color: Colors.red,
                  size: 60,
                )
              : const Icon(
                  Icons.photo_library_rounded,
                  color: Colors.blue,
                  size: 60,
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  ' $title',
                  style: const TextStyle(fontSize: 15),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Gap(190),
                  IconButton(
                    icon: Icon(Icons.remove_red_eye, size: 18),
                    onPressed: () {
                      print("View File");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => isPdf
                              ? PdfViewer(
                                  path: url,
                                )
                              : ImageViewer(imageUrls: [url], initialIndex: 0),
                        ),
                      );
                    },
                  ),
                  // IconButton(
                  //   icon: const Icon(
                  //     Icons.download,
                  //     size: 18,
                  //   ),
                  //   onPressed: () {
                  //     print("Download File");
                  //   },
                  // ),
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      size: 18,
                      // color: ConstColors.primaryColor,
                    ),
                    onPressed: () {
                      String appLink = "";
                      print("Share File");
                      Share.share(
                          "File Download Link: ${url}\n\nWant More Resources?\nDownload Digi Notes App Specially Designed for Your College!\nApp Download Link:\n${appLink}");
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
