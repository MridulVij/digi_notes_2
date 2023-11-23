import 'package:digi_notes_2/views/components/custom_snackbar.dart';
import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../utils/notifications_services.dart';
import '../../components/custom_container.dart';
import '../../constants/colors/consts.dart';

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
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Academic Section",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),

                  // live updating
                ],
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ConstColors.whitetext,
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 5,
                        color: Color.fromARGB(255, 202, 202, 202),
                        offset: Offset(0, 2),
                      ),
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            LocalNotifications.showSimpleNotification(
                                title: 'test', body: 'test', payload: 'test');

                            Navigator.pushNamed(
                                context, RouterNames.detail_selector);
                          },
                          child: CustomContainer(
                            boxColor: const Color.fromARGB(255, 147, 206, 255),
                            inRow: false,
                            textColor: const Color.fromARGB(255, 35, 98, 150),
                            title: title[0],
                            child: SvgPicture.asset(
                              iconPaths[0],
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouterNames.detail_selector);
                          },
                          child: CustomContainer(
                            boxColor: const Color.fromARGB(255, 252, 212, 216),
                            inRow: false,
                            textColor: const Color.fromARGB(255, 255, 118, 132),
                            title: title[1],
                            child: SvgPicture.asset(
                              iconPaths[1],
                              height: 80,
                              width: 80,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouterNames.detail_selector);
                          },
                          child: CustomContainer(
                            boxColor: const Color.fromARGB(188, 172, 255, 175),
                            inRow: false,
                            textColor: const Color.fromARGB(255, 73, 165, 76),
                            title: title[2],
                            child: Image.asset(
                              iconPaths[2],
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouterNames.detail_selector);
                          },
                          child: CustomContainer(
                            boxColor: const Color.fromARGB(255, 255, 248, 186),
                            inRow: false,
                            textColor: const Color.fromARGB(255, 180, 169, 65),
                            title: title[3],
                            child: SvgPicture.asset(
                              iconPaths[3],
                              width: 80,
                              height: 80,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Placement & Skill Section",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ConstColors.whitetext,
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 5,
                        color: Color.fromARGB(255, 202, 202, 202),
                        offset: Offset(0, 2),
                      ),
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouterNames.dsa);
                          },
                          child: CustomContainer(
                            boxColor: const Color.fromARGB(108, 233, 30, 98),
                            inRow: false,
                            textColor: const Color.fromARGB(230, 120, 16, 51),
                            title: skillSection[0],
                            child: Image.asset(
                              skillIconPaths[0],
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            CustomSnackbar.showCustomSnackbar(
                                context,
                                "Early Access Doesn't Represent Final Feature",
                                2);
                            Navigator.pushNamed(context, RouterNames.tech_news);
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              Navigator.pop(context);
                            });
                          },
                          child: CustomContainer(
                            boxColor: const Color.fromARGB(146, 155, 39, 176),
                            inRow: false,
                            textColor: const Color.fromARGB(255, 60, 15, 68),
                            title: skillSection[3],
                            child: SvgPicture.asset(
                              skillIconPaths[3],
                              width: 80,
                              height: 80,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouterNames.dev);
                          },
                          child: CustomContainer(
                            boxColor: const Color.fromARGB(187, 139, 195, 74),
                            inRow: false,
                            textColor: const Color.fromARGB(251, 71, 100, 40),
                            title: skillSection[1],
                            child: Image.asset(
                              skillIconPaths[1],
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouterNames.road_maps);
                          },
                          child: CustomContainer(
                            boxColor: const Color.fromARGB(148, 255, 153, 0),
                            inRow: false,
                            textColor: const Color.fromARGB(233, 78, 51, 11),
                            title: skillSection[2],
                            child: SvgPicture.asset(
                              skillIconPaths[2],
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(50),
            ],
          ),
        ));
  }
}
