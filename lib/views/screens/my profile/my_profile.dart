import 'package:digi_notes_2/views/constants/colors/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers/auth_providers.dart';
import '../../components/custom_autotext.dart';
import '../../components/custom_buttons.dart';
import '../../components/custom_container.dart';
import '../../components/custom_links.dart';
import '../../components/custom_loading.dart';
import '../../components/custom_snackbar.dart';
import '../../constants/colors/colors.dart';

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "My Profile",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: userData!.photoURL!.isNotEmpty
                          ? Image.network(userData!.photoURL!)
                          : Icon(Icons.account_circle)),
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
            ListTile(
              onTap: () {
                CustomSnackbar.showCustomSnackbar(
                    context, "Feature Available in 1.1 Version", 2);
              },
              title: const Text("Unlock Premium"),
              subtitle: const Text("Unlock All Resources, Remove Ads."),
              leading: const Icon(Icons.workspace_premium_sharp),
            ),
            Divider(color: ConstColors.lightGrey),
            ListTile(
              onTap: () {
                CustomSnackbar.showCustomSnackbar(
                    context, "Feature Available in 1.1 Version", 2);
              },
              title: const Text("Theme Mode"),
              subtitle: const Text("Dark / Light"),
              leading: const Icon(Icons.dark_mode),
            ),
            Divider(color: ConstColors.lightGrey),
            ListTile(
              onTap: () {
                CustomSnackbar.showCustomSnackbar(
                    context, "Feature Available in 1.1 Version", 2);
              },
              title: const Text("Clear Cache"),
              subtitle: const Text("Delete Old Trash Pdf's, Images in App"),
              leading: const Icon(Icons.delete),
            ),
            Divider(color: ConstColors.lightGrey),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouterNames.donate);
              },
              title: const Text("Donate Developer"),
              subtitle: const Text("Buy me Coffee / Appreciate Hard Work!"),
              leading: const Icon(Icons.monetization_on),
            ),
            Divider(color: ConstColors.lightGrey),
            ListTile(
              onTap: () {
                launchUrl(
                    Uri.parse(
                        'https://www.linkedin.com/in/mridul-vij-31969b160/'),
                    mode: LaunchMode.externalNonBrowserApplication);
              },
              title: const Text("About Developer"),
              subtitle:
                  const Text("What is Creatify?, Who developed this App?"),
              leading: const Icon(Icons.person),
            ),
            Divider(color: ConstColors.lightGrey),
            ListTile(
              onTap: () {
                String appDownloadLink = "";
                Share.share("App Download Link:\n${appDownloadLink}");
              },
              title: const Text("Share Digi Notes App"),
              subtitle: const Text("Share the Apk file with friends!"),
              leading: const Icon(Icons.person),
            ),
            const Divider(
              color: Colors.grey,
              endIndent: 40,
              indent: 40,
            ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AutoSizeText(
                "Data Privacy Notice - This App Only Stores UserName & Email ID, We don't take personal phone number of any student / user. As an indian developer we respect our user's privacy policy! ",
                color: Colors.grey,
                fontSize: 15,
                textAlign: TextAlign.center,
              ),
            ),
            // Image.asset(
            //   'assets/images/jmieti_creatify.png',
            //   color: Colors.black,
            //   height: 80,
            // ),

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: AutoSizeText(
                    'App Version - Digi Notes 1.0 (Early Access)',
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    'COPYRIGHT 2023 - All Rights Reserved',
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
