import 'package:digi_notes_2/views/constants/colors/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../providers/auth_providers.dart';
import '../../../utils/notifications_services.dart';
import '../../components/custom_autotext.dart';
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
                          : const Icon(Icons.account_circle)),
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
                      Row(
                        children: [
                          AutoSizeText(
                            userData!.displayName!,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          const Gap(5),
                          Image.asset(
                            'assets/images/blutk.png',
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                      // AutoSizeText(
                      //   userData!.email!,
                      //   fontSize: 14,
                      //   color: Colors.black,
                      // ),
                      //
                      Container(
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 188, 251, 190),
                        ),
                        child: const Text(
                          'Early Access Verified Member!',
                          style: TextStyle(
                              fontSize: 10,
                              color: Color.fromARGB(255, 41, 105, 43)),
                        ),
                      )
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
              title: const Text("Upload Resources"),
              subtitle: Text(
                  "Contribute Your Own HandWritten Notes with your Name!",
                  style: TextStyle(color: ConstColors.lightGrey)),
              leading: const Icon(Icons.workspace_premium_sharp),
            ),
            ListTile(
              onTap: () {
                CustomSnackbar.showCustomSnackbar(
                    context, "Feature Available in 1.1 Version", 2);
              },
              title: const Text("Unlock Premium"),
              subtitle: Text("Unlock All Resources, Remove Ads.",
                  style: TextStyle(color: ConstColors.lightGrey)),
              leading: const Icon(Icons.workspace_premium_sharp),
            ),
            ListTile(
              onTap: () {
                CustomSnackbar.showCustomSnackbar(
                    context, "Feature Available in 1.1 Version", 2);
              },
              title: const Text("Theme Mode"),
              subtitle: Text("Dark / Light",
                  style: TextStyle(color: ConstColors.lightGrey)),
              leading: const Icon(Icons.dark_mode),
            ),
            ListTile(
              onTap: () {
                CustomSnackbar.showCustomSnackbar(
                    context, "Feature Available in 1.1 Version", 2);
              },
              title: const Text("Clear Cache"),
              subtitle: Text("Delete Old Trash Pdf's, Images in App",
                  style: TextStyle(color: ConstColors.lightGrey)),
              leading: const Icon(Icons.delete),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouterNames.donate);
              },
              title: const Text("Donate Developer"),
              subtitle: Text("Buy me Coffee / Appreciate Hard Work!",
                  style: TextStyle(color: ConstColors.lightGrey)),
              leading: const Icon(Icons.monetization_on),
            ),
            ListTile(
              onTap: () {
                launchUrl(
                    Uri.parse(
                        'https://www.linkedin.com/in/mridul-vij-31969b160/'),
                    mode: LaunchMode.externalNonBrowserApplication);
              },
              title: const Text("About Developer"),
              subtitle: Text("What is Creatify?, Who developed this App?",
                  style: TextStyle(color: ConstColors.lightGrey)),
              leading: const Icon(Icons.person),
            ),
            ListTile(
              onTap: () async {
                String appDownloadLink =
                    "https://creatifyappsstore.blogspot.com/2023/02/digi-notes-app.html";
                await Share.share("App Download Link:\n${appDownloadLink}");
                await LocalNotifications.showSimpleNotification(
                    title: "Thanks For Sharing, Digi Notes App!",
                    body:
                        "From Now, Our Algorithm will provide you more resources and advance features!",
                    payload: 'data');
              },
              title: const Text("Share App"),
              subtitle: Text("Share Digi Notes Apk file with your friends!",
                  style: TextStyle(color: ConstColors.lightGrey)),
              leading: const Icon(Icons.share),
            ),
            const Gap(10),
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
                    child: const CustomContainer(
                        descriptionTitle: '',
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
