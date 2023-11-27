import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/dsa_providers.dart';
import '../../../utils/shared_preferences.dart';
import '../../components/custom_appbar.dart';
import '../../components/custom_buttons.dart';
import '../../constants/colors/colors.dart';

class DSAUI extends StatefulWidget {
  const DSAUI({super.key});

  @override
  State<DSAUI> createState() => _DSAUIState();
}

class _DSAUIState extends State<DSAUI> {
  @override
  void initState() {
    super.initState();
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

          Container(
            // padding: EdgeInsets.all(0),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: ConstColors.whitetext,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: ConstColors.lightGrey,
                  )
                ]),
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
                      Consumer<SettingsModel>(
                        builder: (context, state, child) => Switch(
                          activeTrackColor:
                              const Color.fromARGB(230, 120, 16, 51),
                          value: state.isWeeklySwitched,
                          onChanged: (value) {
                            state.updateWeeklySwitchState(value);
                            SharedPreferencesService.setWeeklySwitchState(
                                value);
                          },
                        ),
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
                      Consumer<SettingsModel>(
                        builder: (context, state, child) => Switch(
                          activeTrackColor:
                              const Color.fromARGB(230, 120, 16, 51),
                          value: state.isBiWeeklySwitched,
                          onChanged: (value) {
                            state.updateBiWeeklySwitchState(value);
                            SharedPreferencesService.setBiWeeklySwitchState(
                                value);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          Container()
        ]),
      ),
    );
  }
}
