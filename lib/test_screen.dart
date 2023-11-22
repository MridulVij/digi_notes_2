import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share_plus/share_plus.dart';
import 'views/components/custom_loading.dart';
import 'views/components/image_viewer.dart';
import 'views/components/pdf_viewer.dart';
import 'views/constants/colors/colors.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final CollectionReference paths = FirebaseFirestore.instance
      .collection('main_data/2022/KUK/CSE/7th/Notes/oose');

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
    return Scaffold(
      body: StreamBuilder(
        stream: paths.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return ListView.builder(
              itemCount: asyncSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    asyncSnapshot.data!.docs[index];
                checkFileExtension(documentSnapshot['u']);
                return InkWell(
                  splashColor: Colors.grey[350],
                  onTap: () {
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
                  },
                  child: CustomResultBox(
                    title: documentSnapshot['t'],
                    url: documentSnapshot['u'],
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
