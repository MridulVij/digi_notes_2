import 'package:flutter/material.dart';

import '../../../constants/colors/colors.dart';

class DSAContainer extends StatelessWidget {
  final Widget child;
  const DSAContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ConstColors.whitetext,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 5,
              color: ConstColors.lightGrey,
            )
          ]),
      child: child,
    );
  }
}
