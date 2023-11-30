import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digi_notes_2/data/api/detail_fetcher.dart';
import 'package:digi_notes_2/providers/internet_provider.dart';
import 'package:digi_notes_2/views/components/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../utils/google_ads.dart';
import '../../../components/custom_appbar.dart';
import '../../../components/custom_buttons.dart';
import '../../../components/custom_loading.dart';
import '../../../constants/colors/colors.dart';

const backgroundColor = const Color.fromARGB(108, 233, 30, 98);
const mainColor = const Color.fromARGB(230, 120, 16, 51);

class DSASheets extends StatefulWidget {
  const DSASheets({super.key});

  @override
  State<DSASheets> createState() => _DSASheetsState();
}

class _DSASheetsState extends State<DSASheets> {
  DetailFetcher detailFetcher = DetailFetcher();
  GoogleAds ads = GoogleAds();

  @override
  Widget build(BuildContext context) {
    return Consumer<InternetProviderNotifier>(
      builder: (context, state, child) => Scaffold(
          appBar: CustomAppBar(
            appBarColor: backgroundColor,
            child: Row(
              children: [
                CustomButton(
                    iconBackgroundColor: mainColor,
                    icon: Icons.arrow_back_rounded,
                    iconColor: ConstColors.whitetext,
                    onPress: () => Navigator.pop(context),
                    radius: 22),
                const Text(
                  'DSA Sheets',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.grey[200],
          body: state.result
              ? StreamBuilder(
                  stream: DetailFetcher().fetchDSASheetsData().snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                    if (asyncSnapshot.hasData) {
                      return ListView.builder(
                        itemCount: asyncSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              asyncSnapshot.data!.docs[index];
                          return Ink(
                            child: Card(
                              margin: const EdgeInsets.all(10),
                              elevation: 1,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  CustomSnackbar.showCustomSnackbar(
                                      context, 'Loading Sheet...', 2);
                                  launchUrl(Uri.parse(documentSnapshot['u']),
                                      mode: LaunchMode.platformDefault);
                                },
                                child: ListTile(
                                  leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child:
                                          Image.network(documentSnapshot['l'])),
                                  title: Text(documentSnapshot['t']),
                                  subtitle: Row(
                                    children: [
                                      Text('Questions:'),
                                      Text(
                                        ' ${documentSnapshot['q']}',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
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
                  })
              : Center(
                  child: Text('Please Check Your Internet Connection!'),
                )),
    );
  }
}
