import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/custom_container.dart';

class DashboardUI extends StatefulWidget {
  const DashboardUI({super.key});

  @override
  State<DashboardUI> createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI> {
  List<String> title = ["Qs'n Papers", "Notes", "Syllabus", "Soutions"];
  List<String> skillSection = ["DSA", "DEV", "Road Maps", "Tech News"];
  List<String> iconPaths = [
    "assets/svg/pyqp.svg",
    "assets/svg/syllabus.svg",
    "assets/icons/syllabus.png",
    "assets/svg/solution.svg"
  ];
  List<String> skillIconPaths = [
    "assets/icons/dsa.png",
    "assets/icons/dev.png",
    "assets/svg/roadmap.svg",
    "assets/svg/technews.svg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Academic Section",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),

              // live updating
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(
                boxColor: ConstColors.lightSky,
                inRow: false,
                isSearchMode: false,
                textColor: ConstColors.primaryColor,
                title: title[0],
                child: SvgPicture.asset(
                  iconPaths[0],
                  height: 130,
                ),
              ),
              CustomContainer(
                boxColor: ConstColors.lightSky,
                inRow: false,
                isSearchMode: false,
                textColor: ConstColors.primaryColor,
                title: title[1],
                child: SvgPicture.asset(
                  iconPaths[1],
                  height: 130,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(
                boxColor: ConstColors.lightSky,
                inRow: false,
                isSearchMode: false,
                textColor: ConstColors.primaryColor,
                title: title[2],
                child: Image.asset(
                  iconPaths[2],
                  height: 130,
                ),
              ),
              CustomContainer(
                boxColor: ConstColors.lightSky,
                inRow: false,
                isSearchMode: false,
                textColor: ConstColors.primaryColor,
                title: title[3],
                child: SvgPicture.asset(
                  iconPaths[3],
                  height: 130,
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Skill Section",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(
                boxColor: ConstColors.lightSky,
                inRow: false,
                isSearchMode: false,
                textColor: ConstColors.primaryColor,
                title: skillSection[0],
                child: Image.asset(
                  skillIconPaths[0],
                  height: 130,
                ),
              ),
              CustomContainer(
                boxColor: ConstColors.lightSky,
                inRow: false,
                isSearchMode: false,
                textColor: ConstColors.primaryColor,
                title: skillSection[1],
                child: Image.asset(
                  skillIconPaths[1],
                  height: 130,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(
                boxColor: ConstColors.lightSky,
                inRow: false,
                isSearchMode: false,
                textColor: ConstColors.primaryColor,
                title: skillSection[2],
                child: SvgPicture.asset(
                  skillIconPaths[2],
                  height: 130,
                ),
              ),
              CustomContainer(
                boxColor: ConstColors.lightSky,
                inRow: false,
                isSearchMode: false,
                textColor: ConstColors.primaryColor,
                title: skillSection[3],
                child: SvgPicture.asset(
                  skillIconPaths[3],
                  height: 130,
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
