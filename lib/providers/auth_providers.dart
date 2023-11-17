import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digi_notes_2/utils/global_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../views/components/custom_loading.dart';
import '../views/components/custom_snackbar.dart';
import '../views/screens/auth_ui/auth_ui.dart';
import '../views/screens/navbar.dart';
import 'internet_provider.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // No internet connection
        return 4;
      }

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future logOut() async {
    await googleSignIn.disconnect();
    // await googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}

InternetProvider internetProvider = InternetProvider();

class AuthVerifier extends StatelessWidget {
  const AuthVerifier({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
                child: Container(
              color: const Color.fromARGB(182, 0, 0, 0),
              child: const CustomLoading(),
            )),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Something Went Wrong!"),
            ),
          );
        } else if (snapshot.hasData) {
          return NavbarUI();
        } else {
          return FutureBuilder(
            future: internetProvider.checkInternetConnectivity(),
            builder: (context, AsyncSnapshot<bool> connectivitySnapshot) {
              if (connectivitySnapshot.connectionState ==
                  ConnectionState.waiting) {
                return Scaffold(
                  body: Center(
                      child: Container(
                    color: const Color.fromARGB(182, 0, 0, 0),
                    child: const CustomLoading(),
                  )),
                );
              } else if (connectivitySnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Something Went Wrong!"),
                  ),
                );
              } else if (!connectivitySnapshot.data!) {
                // No internet connection
                return Scaffold(
                  body: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No Internet Connection",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Please Close the App and Open Again!",
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              GlobalFunctions globalFunctions =
                                  GlobalFunctions();
                              globalFunctions.checkInternetConnectionAndNotify(
                                  context,
                                  "Please Check Your Internet Connection!",
                                  1);
                            },
                            child: Text("Try Again!"))
                      ],
                    ),
                  ),
                );
              } else {
                return SignInUI();
              }
            },
          );
        }
      }),
    );
  }
}
