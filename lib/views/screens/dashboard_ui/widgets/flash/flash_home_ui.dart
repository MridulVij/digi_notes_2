import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FlashUI extends StatefulWidget {
  const FlashUI({super.key});

  @override
  State<FlashUI> createState() => _FlashUIState();
}

class _FlashUIState extends State<FlashUI> {
  int flash = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[100],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              color: Colors.red[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      flash <= 0
                          ? const SizedBox()
                          : Text(
                              '$flash',
                              style: const TextStyle(
                                  fontSize: 70, fontWeight: FontWeight.bold),
                            ),
                      Image.asset(
                        'assets/icons/fire.png',
                        height: 100,
                      ),
                    ],
                  ),
                  const Gap(60),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('You Have $flash Flashes!'),
                  )
                ],
              ),
            ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     "Resource Contributers",
            //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            //   ),
            // ),
            Gap(59),
            Text(
              'Sorry, Feature in Development! Available in 1.1 Update!',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
