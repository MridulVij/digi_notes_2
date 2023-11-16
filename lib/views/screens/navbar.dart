import 'package:digi_notes_2/views/screens/tech%20news/tech_news.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dashboard_ui/dashboard.dart';
import 'my profile/my_profile.dart';
import 'road map/road_map.dart';

class NavbarUI extends StatefulWidget {
  const NavbarUI({super.key});

  @override
  State<NavbarUI> createState() => _NavbarUIState();
}

class _NavbarUIState extends State<NavbarUI> {
  int _currentIndex = 0;
  List<Widget> screenList = [
    const DashboardUI(),
    const TechNewsUI(),
    const RoadMapUI(),
    const ProfileUI(),
  ];

  final String Url = "https://www.javatpoint.com/";

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (_currentIndex == 1) {
      launchUrl(Uri.parse(Url));
    }
  }

  final userData = FirebaseAuth.instance.currentUser;
  // String userName = 'User';

  int energies = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ConstColors.whitetext,
          elevation: 0.0,
          title: Text('Hi, ${userData!.displayName}',
              style: const TextStyle(fontSize: 18)),
          titleSpacing: 10.0,
          actions: [
            const Gap(1),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red[100]),
                child: Row(
                  children: [
                    energies <= 0
                        ? const SizedBox()
                        : Text(
                            '${energies}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                    Image.asset(
                      'assets/icons/fire.png',
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
            const Gap(6),
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
            Icons.newspaper_sharp,
          ),
          label: 'Tech News',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map_sharp,
          ),
          label: 'Road Maps',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_rounded,
          ),
          label: 'My Profile',
        ),
      ],
    );
  }
}
