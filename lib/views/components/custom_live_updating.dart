import 'package:flutter/material.dart';

class LiveUpdating extends StatelessWidget {
  const LiveUpdating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green[100],
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/live.gif',
              height: 15,
              width: 15,
            ),
            const Text(
              ' Live',
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotLiveUpdating extends StatelessWidget {
  const NotLiveUpdating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red[100],
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/live.gif',
              height: 15,
              width: 15,
              color: Colors.red,
            ),
            const Text(
              ' Disconnected',
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
