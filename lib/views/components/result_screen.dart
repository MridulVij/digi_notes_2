import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../data/api/detail_fetcher.dart';
import '../../providers/internet_provider.dart';
import '../../utils/enums.dart';
import '../../utils/notifications_services.dart';
import '../constants/colors/colors.dart';
import 'custom_appbar.dart';
import 'custom_buttons.dart';
import 'custom_live_updating.dart';
import 'custom_loading.dart';
import 'custom_selector.dart';
import 'custom_snackbar.dart';
import 'image_viewer.dart';
import 'pdf_viewer.dart';

class ResultScreen extends StatefulWidget {
  String queryPath;
  ResultScreen({required this.queryPath});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    splitAndShow();
    fetchSelector();
  }

  // App Bar Status Selector!
  var resource = Resource.pyqp;

  String? pqyp, sess, nots, syllbs, tmetble;
  String finalPath = "";

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

  String showPath = "Error, Please Go Back and Select Options Again!";

  void splitAndShow() {
    // Split the string into parts based on the slash delimiter
    List<String> parts = widget.queryPath.split('/');

    // Check if there are at least two parts
    if (parts.length >= 2) {
      // Remove the first part (main_data)
      parts.removeAt(0);

      // Join the remaining parts back into a string
      showPath = parts.join('/');

      // Output the result
      print('UI Show Path$showPath');
    } else {
      // Handle the case where there are not enough parts
      print('Invalid input string');
    }
  }

  // Chip Fetch Api Selector
  void fetchSelector() {
    finalPath = widget.queryPath + "/Pyqp/pyqp";
    print('API Show Path $finalPath');
  }

  InternetProvider internetProvider = InternetProvider();

  @override
  Widget build(BuildContext context) {
    return Consumer<InternetProviderNotifier>(
      builder: (context, state, child) => Scaffold(
        appBar: CustomAppBar(
          appBarColor: const Color.fromARGB(255, 242, 251, 255),
          height: 155,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButton(
                      iconBackgroundColor: ConstColors.primaryColor,
                      icon: Icons.arrow_back_rounded,
                      iconColor: ConstColors.whitetext,
                      onPress: () => Navigator.pop(context),
                      radius: 22),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Academic Resources',
                      style: TextStyle(
                          color: ConstColors.primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSelector(
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
                          pqyp = "/Pyqp/pyqp";
                          finalPath = widget.queryPath + pqyp!;
                        },
                        titleText: " Prev-Year\nQs'n Papers",
                      ),
                      const Gap(5),
                      CustomSelector(
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
                            sess = "/Sessional/sessional";
                            finalPath = widget.queryPath + sess!;
                          },
                          titleText: "Sessionals"),
                      const Gap(5),
                      CustomSelector(
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
                            nots = "/Notes/notes";
                            finalPath = widget.queryPath + nots!;
                          },
                          titleText: "Notes"),
                      const Gap(5),
                      CustomSelector(
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
                            syllbs = "/Syllabus/syllabus";
                            finalPath = widget.queryPath + syllbs!;
                          },
                          titleText: "Syllabus"),
                      const Gap(5),
                      CustomSelector(
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
                            tmetble = "/Timetable/timetable";
                            finalPath = widget.queryPath + tmetble!;
                          },
                          titleText: "Time Table"),
                      const Gap(5),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Text(
                      showPath,
                      style: TextStyle(
                          color: ConstColors.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  // live updating widget
                  (state.result) ? LiveUpdating() : NotLiveUpdating(),
                ],
              )
            ],
          ),
        ),
        body: StreamBuilder(
          stream: DetailFetcher().fetchData(finalPath).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              return ListView.builder(
                itemCount: asyncSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot =
                      asyncSnapshot.data!.docs[index];
                  checkFileExtension(documentSnapshot['u']);
                  return InkWell(
                    splashColor: Colors.grey[350],
                    onTap: () async {
                      bool result =
                          await internetProvider.checkInternetConnectivity();
                      if (result) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => isPDF
                                ? PdfViewer(
                                    path: documentSnapshot['u'],
                                  )
                                : ImageViewer(
                                    imageUrls: [documentSnapshot['u']],
                                    initialIndex: 0),
                          ),
                        );
                      } else {
                        CustomSnackbar.showCustomSnackbar(context,
                            "Please Check Your Internet Connection!", 1);
                      }
                    },
                    child: CustomResultBox(
                      title: documentSnapshot['t'],
                      url: documentSnapshot['u'] ?? "",
                      isPdf: isPDF,
                    ),
                  );
                },
              );
            }
            //  else if (asyncSnapshot.hasError) {
            //   return Center(
            //     child: Text(
            //         "No Data Found Please Try Again Later! We are Working on it!"),
            //   );
            // }
            else {
              return Center(
                  child: Container(
                color: const Color.fromARGB(125, 0, 0, 0),
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
                children: [
                  const Gap(190),
                  IconButton(
                    icon: const Icon(Icons.remove_red_eye, size: 18),
                    onPressed: () {
                      print("View File");
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
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
                    icon: const Icon(
                      Icons.share,
                      size: 18,
                    ),
                    onPressed: () {
                      String appLink =
                          "https://creatifyappsstore.blogspot.com/2023/02/digi-notes-app.html";
                      print("Share File");
                      Share.share(
                          "File Download Link: ${url}\n\nWant More Resources?\nDownload Digi Notes App Specially Designed for Your College!\nApp Download Link:\n${appLink}");
                      LocalNotifications.showSimpleNotification(
                          title: 'Thanks for Sharing Documents!',
                          body:
                              'Share this App to Your Friends to Access Premium Subscription & More Resources!',
                          payload: 'test');
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
