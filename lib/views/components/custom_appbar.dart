import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;
  final Color? appBarColor;

  CustomAppBar({
    required this.child,
    this.height = kToolbarHeight,
    required this.appBarColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        color: appBarColor, //Color.fromARGB(255, 242, 251, 255),
        child: child,
      ),
    );
  }
}
