import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/custom_loading.dart';

class TechNewsUI extends StatefulWidget {
  const TechNewsUI({super.key});

  @override
  State<TechNewsUI> createState() => _TechNewsUIState();
}

class _TechNewsUIState extends State<TechNewsUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstColors.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(250),
              CustomLoading(),
              Gap(200),
              Text('If Something is Not Opened,',
                  style: TextStyle(
                    color: ConstColors.whitetext,
                  )),
              Text('1. Switch the Tabs and Comeback Again!',
                  style: TextStyle(
                    color: ConstColors.whitetext,
                  )),
              Text('2. Click the Tech News Button Again!',
                  style: TextStyle(
                    color: ConstColors.whitetext,
                  ))
            ],
          ),
        ));
  }
}
