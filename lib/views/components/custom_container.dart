import 'package:digi_notes_2/views/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.child,
      required this.title,
      required this.inRow,
      required this.textColor,
      required this.boxColor,
      required this.descriptionTitle});
  final Widget child;
  final String title;
  final bool inRow;
  final Color textColor;
  final Color boxColor;
  final String descriptionTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: boxColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color.fromARGB(255, 202, 202, 202),
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(25)),
      child: inRow
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                ),
                Center(child: child)
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: textColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          descriptionTitle,
                          softWrap: true,
                          maxLines: 5,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        child,
                      ],
                    ),
                  ]),
            ),
    );
  }
}
