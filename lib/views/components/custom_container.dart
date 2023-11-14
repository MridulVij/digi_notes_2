import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.child,
      required this.title,
      required this.inRow,
      required this.isSearchMode,
      required this.textColor});
  final Widget child;
  final String title;
  final bool inRow;
  final bool isSearchMode;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isSearchMode
              ? ConstColors.primaryColor
              : Color.fromARGB(255, 242, 251, 255),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: const Color.fromARGB(255, 202, 202, 202),
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: inRow
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w300),
                ),
                child
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: ConstColors.primaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w300),
                  ),
                  child
                ]),
    );
  }
}
