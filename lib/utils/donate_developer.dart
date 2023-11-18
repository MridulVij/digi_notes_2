import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../views/components/custom_autotext.dart';
import '../views/constants/colors/colors.dart';

class Donate extends StatelessWidget {
  const Donate({super.key});
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    final snackBar = const SnackBar(
      content: Text('UPI ID Copied!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AutoSizeText(
        "Donate Developer",
        color: Colors.black,
        fontSize: 20,
      )),
      body: SingleChildScrollView(
        child: Column(children: [
          AutoSizeText(
            "Scan QR to Support & Donate!",
            color: ConstColors.primaryColor,
            fontSize: 25,
          ),
          AutoSizeText(
            "Please Confirm: Payment Receiver Name - Mridul Vij",
            fontSize: 12,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/upi.jpg"),
                height: 280,
                width: 280,
                // UPI ID - mridulvij1569@okaxis
              ),
            ],
          ),
          AutoSizeText(
            "PAY with Google Pay, Phone Pay, Paytm etc.",
            color: Colors.grey,
            fontSize: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              child: AutoSizeText(
                "OR",
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          InkWell(
              onTap: () {
                _copyToClipboard(context, "mridulvij1569@okaxis");
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.black)),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("mridulvij1569@okaxis"),
                ),
              )),
          SizedBox(
            height: 5,
          ),
          AutoSizeText(
            "PAY with UPI ID, Tap To Copy.",
            color: Colors.grey,
            fontSize: 15,
          ),
          Divider(
            color: ConstColors.lightGrey,
            endIndent: 40,
            indent: 40,
          ),
          AutoSizeText(
            "Why We Need Donation?",
            color: Colors.red,
            fontSize: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AutoSizeText(
              "We Collect Donation from Supporters, Users, Family who appreciate our Hard Work, We will focus on providing the best quality experience to our users to play game efficiently and in return we also have to Pay the App Server Cost to Company So, This App is Totally Free but to run this app on server requires money to keep app running without interruption!\nHow Much Amount You Pay is Totally Depend Upon Your Choice!",
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ]),
      ),
    );
  }
}
