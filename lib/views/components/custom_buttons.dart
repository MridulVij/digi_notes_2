import 'package:flutter/material.dart';

import '../constants/colors/colors.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final double radius;
  final Color iconColor;
  final VoidCallback onPress;
  const CustomButton(
      {super.key,
      required this.icon,
      required this.radius,
      required this.iconColor,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: ConstColors.primaryColor,
        radius: radius,
        child: Center(
          child: IconButton(
              onPressed: onPress,
              icon: Icon(
                icon,
                color: iconColor,
                // size: 25,
              )),
        ),
      ),
    );
  }
}
