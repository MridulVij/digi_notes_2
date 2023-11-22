import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'views/components/custom_loading.dart';
import 'views/constants/colors/colors.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // CollectionReference? paths;
  void fetchData() {
    // final CollectionReference paths =
    //     FirebaseFirestore.instance.collection('test');
  }

  ////
  bool isPNG = false;
  bool isPDF = false;
  void checkFileExtension(String url) {
    isPNG = checkFileType(url, '.png');
    isPDF = checkFileType(url, '.pdf');

    print('.png found: $isPNG');
    print('.pdf found: $isPDF');
  }

////
  bool checkFileType(String input, String fileType) {
    String lowercaseInput = input.toLowerCase();
    String lowercaseFileType = fileType.toLowerCase();
    return lowercaseInput.contains(lowercaseFileType);
  }

////
  final CollectionReference paths = FirebaseFirestore.instance
      .collection('main_data/2022/KUK/CSE/7th/Notes/oose');
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
                return CustomResultBox(
                  title: documentSnapshot['t'],
                  isPdf: isPDF,
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
    );
  }
}

class CustomResultBox extends StatelessWidget {
  const CustomResultBox({super.key, required this.isPdf, required this.title});
  final bool isPdf;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: ConstColors.lightGrey,
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
          color: Colors.white),
      child: Row(
        children: [
          isPdf
              ? const Icon(
                  Icons.picture_as_pdf_rounded,
                  color: Colors.red,
                  size: 80,
                )
              : const Icon(
                  Icons.photo_library_rounded,
                  color: Colors.blue,
                  size: 80,
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.download),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
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

//

