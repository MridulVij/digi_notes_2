import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/detail_fetch_provider.dart';
import '../../components/custom_container.dart';

class RoadMapUI extends StatefulWidget {
  const RoadMapUI({super.key});

  @override
  State<RoadMapUI> createState() => _RoadMapUIState();
}

class _RoadMapUIState extends State<RoadMapUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Provider.of<DetailFetchProvider>(context)
        .collectionFetchApi("roadmaps");
    fetchResources();
  }

  String? logoImgUrl;
  String? titleTxtUrl;

  Map<String, dynamic>? logoImg, roadmapUrl, titleTxt;
  List<QueryDocumentSnapshot>? document;
  void fetchResources() async {
    QuerySnapshot? querySnapshot =
        context.read<DetailFetchProvider>().querySnapshot;
    document = await querySnapshot!.docs;
    logoImg = document![0].data() as Map<String, dynamic>;
    roadmapUrl = document![1].data() as Map<String, dynamic>;
    titleTxt = document![2].data() as Map<String, dynamic>;
    logoImgUrl = logoImg!['url'];
    titleTxtUrl = titleTxt!['title'];
    print(logoImgUrl);
    print(titleTxtUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailFetchProvider>(
      builder: (context, state, child) => Scaffold(
        backgroundColor: Colors.grey[200],
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // You can change this value based on your needs
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: titleTxt!.entries.length,
          itemBuilder: (context, index) {
            return CustomContainer(
              boxColor: ConstColors.whitetext,
              child: Image.network(
                logoImg![index]['url'],
                fit: BoxFit.cover,
                height: 100,
              ),
              inRow: false,
              textColor: Colors.black,
              title: titleTxt![index]['title'],
            );
          },
        ),
      ),
    );
  }
}
