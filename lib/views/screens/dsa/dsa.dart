import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/google_ads.dart';
import '../../components/custom_appbar.dart';
import '../../components/custom_buttons.dart';
import '../../components/custom_container.dart';
import '../../components/custom_snackbar.dart';
import '../../constants/colors/colors.dart';
import 'components/dsa_container.dart';

class DSAUI extends StatefulWidget {
  const DSAUI({super.key});

  @override
  State<DSAUI> createState() => _DSAUIState();
}

class _DSAUIState extends State<DSAUI> {
  GoogleAds ads = GoogleAds();
  @override
  void initState() {
    super.initState();
    ads.showRewardedAd();
  }

  bool weeklyAlert = false;
  bool biweeklyAlert = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: const Color.fromARGB(108, 233, 30, 98),
        child: Row(
          children: [
            CustomButton(
                iconBackgroundColor: const Color.fromARGB(230, 120, 16, 51),
                icon: Icons.arrow_back_rounded,
                iconColor: ConstColors.whitetext,
                onPress: () => Navigator.pop(context),
                radius: 22),
            const Text(
              'DSA',
              style: TextStyle(
                  color: Color.fromARGB(230, 120, 16, 51),
                  fontSize: 30,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Leetcode Contest Alerts",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),

                // live updating
                // (state.result) ? LiveUpdating() : NotLiveUpdating(),
              ],
            ),
          ),
          // weekly biweekly switches
          DSAContainer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.notifications_active_outlined),
                          Text(
                            " Weekly Alert",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Switch(
                        activeTrackColor:
                            const Color.fromARGB(230, 120, 16, 51),
                        value: weeklyAlert,
                        onChanged: (value) {
                          // state.updateWeeklySwitchState(value);
                          // SharedPreferencesService.setWeeklySwitchState(
                          //     value);
                          weeklyAlert = value;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.notifications_active_outlined),
                          Text(
                            " BiWeekly Alert",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Switch(
                        activeTrackColor:
                            const Color.fromARGB(230, 120, 16, 51),
                        value: biweeklyAlert,
                        onChanged: (value) {
                          biweeklyAlert = value;
                          // state.updateBiWeeklySwitchState(value);
                          // SharedPreferencesService.setBiWeeklySwitchState(
                          //     value);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DSA Roadmap & Guide",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),

                // live updating
                // (state.result) ? LiveUpdating() : NotLiveUpdating(),
              ],
            ),
          ),
          DSAContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      CustomSnackbar.showCustomSnackbar(
                          context, "Please Wait!", 3);
                      final String Url = "https://t.me/diginotescreatify";
                      launchUrl(Uri.parse(Url),
                          mode: LaunchMode.platformDefault);
                    },
                    child: CustomContainer(
                      inRow: false,
                      boxColor: const Color.fromARGB(152, 155, 39, 176),
                      descriptionTitle: 'Start Your DSA Journey',
                      title: 'Roadmap',
                      textColor: Color.fromARGB(241, 78, 21, 88),
                      child: Image.asset(
                        'assets/icons/dsa.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      final String Url =
                          "https://www.geeksforgeeks.org/complete-guide-to-dsa-for-beginners/?ref=shm";
                      launchUrl(Uri.parse(Url),
                          mode: LaunchMode.externalApplication);
                    },
                    child: CustomContainer(
                      inRow: false,
                      boxColor: const Color.fromARGB(184, 33, 149, 243),
                      descriptionTitle: 'Latest Free DSA Courses!',
                      title: 'Courses',
                      textColor: const Color.fromARGB(255, 17, 71, 116),
                      child: Image.asset(
                        'assets/icons/dsa.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text('More Features Coming Soon in 1.1 Update!'),
        ]),
      ),
    );
  }
}
