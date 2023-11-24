import 'package:flutter/material.dart';

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
            Text(
              'DSA Guide & Roadmap',
              style: TextStyle(
                  color: const Color.fromARGB(230, 120, 16, 51),
                  fontSize: 30,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          //
        ]),
      ),
    );
  }
}
