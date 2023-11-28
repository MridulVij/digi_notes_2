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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 250,
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
                  Gap(50),
                  Text('You Have ${flash} Flashes!')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
