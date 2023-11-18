import 'package:digi_notes_2/views/constants/colors/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers/auth_providers.dart';
import '../../components/custom_autotext.dart';
import '../../components/custom_buttons.dart';
import '../../components/custom_container.dart';
import '../../components/custom_links.dart';
import '../../components/custom_loading.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  bool _isLoading = false;
  final userData = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(userData!.photoURL!)),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        userData!.displayName!,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      AutoSizeText(
                        userData!.email!,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(
              color: Colors.grey,
              endIndent: 40,
              indent: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AutoSizeText(
                "DATA PRIVACY NOTICE: This App Only Takes E-MAIL ID and UserName of User from Google Login Don't Worry Your Data is 100% Safe as a Indian Developer have Designed and Developed this App So, Please Keep Faith & Support Indian Developers for Adding More Advance Features!",
                color: Colors.grey,
                fontSize: 15,
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              color: Colors.grey,
              endIndent: 40,
              indent: 40,
            ),
            //

            Column(
              children: [
                const Text("Follow Us On:",
                    style: TextStyle(
                        fontFamily: 'Fonts',
                        fontSize: 15,
                        color: Colors.black)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Uri uri = Uri.parse(SocialMediaLinks.youtube);
                        launchUrl(uri,
                            mode: LaunchMode.externalNonBrowserApplication);
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/yt.svg',
                        height: 42,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Uri uri = Uri.parse(SocialMediaLinks.whatsapp);
                        launchUrl(uri,
                            mode: LaunchMode.externalNonBrowserApplication);
                      },
                      icon: Image.asset(
                        'assets/icons/wtsp.png',
                        height: 42,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Uri uri = Uri.parse(SocialMediaLinks.telegram);
                        launchUrl(uri,
                            mode: LaunchMode.externalNonBrowserApplication);
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/tele.svg',
                        height: 43,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Uri uri = Uri.parse(SocialMediaLinks.linkedin);
                        launchUrl(uri,
                            mode: LaunchMode.externalNonBrowserApplication);
                      },
                      icon: Image.asset(
                        'assets/icons/linkd.png',
                        height: 33,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              endIndent: 40,
              indent: 40,
            ),

            Image.asset(
              'assets/images/jmieti_creatify.png',
              color: Colors.black,
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'COPYRIGHT 2023 - Digi Notes By Creatify',
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Settings",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {},
              title: const Text("Theme Mode"),
              subtitle: const Text("Dark / Light"),
              leading: const Icon(Icons.dark_mode),
            ),
            const Divider(
              color: Colors.grey,
            ),
            _isLoading
                ? const CustomLoading()
                : GestureDetector(
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      await provider.logOut();
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: CustomContainer(
                        title: "Log Out  ",
                        boxColor: Colors.red,
                        inRow: true,
                        textColor: Colors.white,
                        child:
                            Icon(Icons.logout, color: Colors.white, size: 20)),
                  ),
          ],
        ),
      ),
    ));
  }
}
