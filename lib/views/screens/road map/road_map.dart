import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_notes_2/data/api/detail_fetcher.dart';
import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/custom_container.dart';
import '../../components/custom_loading.dart';
import 'road_map_details.dart';

class RoadMapUI extends StatefulWidget {
  const RoadMapUI({super.key});

  @override
  State<RoadMapUI> createState() => _RoadMapUIState();
}

class _RoadMapUIState extends State<RoadMapUI> {
  DetailFetcher detailFetcher = DetailFetcher();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: StreamBuilder(
            stream: DetailFetcher().fetchRoadmapData().snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemCount: asyncSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot documentSnapshot =
                        asyncSnapshot.data!.docs[index];
                    return InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(documentSnapshot['u']),
                            mode: LaunchMode.platformDefault);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         RoadMapDetailsUI(link: documentSnapshot['u']),
                        //   ),
                        // );
                      },
                      child: CustomContainer(
                        boxColor: ConstColors.whitetext,
                        inRow: false,
                        textColor: Colors.black,
                        title: documentSnapshot['t'],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              documentSnapshot['l'],
                              height: 50,
                              width: 50,
                            ),
                            Text('Beginner to Advance')
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                    child: Container(
                  color: const Color.fromARGB(125, 0, 0, 0),
                  child: const CustomLoading(),
                ));
              }
            }));
  }
}
