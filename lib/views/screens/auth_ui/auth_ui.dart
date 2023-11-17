// Google Sign In UI
import 'package:flutter/material.dart';
import '../../../providers/auth_providers.dart';
import '../../../utils/global_functions.dart';
import '../../components/custom_loading.dart';
import '../../components/custom_snackbar.dart';
import '../../constants/colors/colors.dart';

bool isLoading = false;

class SignInUI extends StatefulWidget {
  SignInUI({super.key});

  @override
  State<SignInUI> createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  GoogleSignInProvider googleSignInProvider = GoogleSignInProvider();
  void showLoading() {
    isLoading = !isLoading;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                'Skills > Degree',
                style: TextStyle(
                    color: ConstColors.whitetext,
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'assets/images/splash_logo_diginotes.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                'Your Great Buddy for Academic Study!',
                style: TextStyle(
                    color: ConstColors.whitetext,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const Divider(endIndent: 10, indent: 10),
            isLoading == true
                ? CustomLoading()
                : Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Ink(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.0),
                        splashColor: Colors.white,
                        onTap: () async {
                          showLoading();
                          await googleSignInProvider.googleLogin();
                          GlobalFunctions globalFunctions = GlobalFunctions();
                          globalFunctions.checkInternetConnectionAndNotify(
                              context,
                              "Please Check Your Internet Connection!",
                              1);
                          showLoading();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: ConstColors.whitetext,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(8),
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/googlepng.png',
                                height: 30,
                                width: 30,
                              ),
                              const Text(
                                ' Continue with Google',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            Column(
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Made with ',
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 20,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                //Divider(),
                Image.asset('assets/images/from_creatify_black.png',
                    height: 90, width: 900),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
