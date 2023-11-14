import 'package:digi_notes_2/views/screens/syllabus/syllabus.dart';
import 'package:flutter/material.dart';
import 'package:digi_notes_2/views/constants/colors/colors.dart';

import 'dashboard_ui/dashboard.dart';
import 'guide/guide.dart';
import 'ques_papers_ui/question_papers_ui.dart';

class NavbarUI extends StatefulWidget {
  const NavbarUI({super.key});

  @override
  State<NavbarUI> createState() => _NavbarUIState();
}

class _NavbarUIState extends State<NavbarUI> {
  int _currentIndex = 0;
  List<Widget> screenList = [
    const DashboardUI(),
    const QuestionPapersUI(),
    const SyllabusUI(),
    const GuideUI(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ConstColors.primaryColor,
          elevation: 0.0,
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined)),
          actions: [
            // InkWell(
            //   onTap: () {},
            //   child: Image.asset(
            //     'assets/icons/linkd.png',
            //     height: 20,
            //     width: 45,
            //   ),
            // ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: screenList[_currentIndex],
        bottomNavigationBar: _bottomNavigationbar());
  }

  Widget _bottomNavigationbar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTabTapped,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: ConstColors.lightGrey,
      selectedItemColor: ConstColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      // backgroundColor: CustomColors.otherColor,
      iconSize: 18.5,
      unselectedFontSize: 10,
      selectedFontSize: 11.5,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
          ),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.folder_copy,
          ),
          label: 'Tech News',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.file_copy_rounded,
          ),
          label: 'Road Maps',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people_alt,
          ),
          label: 'My Profile',
        ),
      ],
    );
  }
}
