import 'package:flutter/material.dart';
import '../constants/colors/colors.dart';

class CustomSelector extends StatefulWidget {
  final bool forwardIcon;
  final bool backwardIcon;
  final bool centerText;
  final String titleText;
  final VoidCallback onPress;
  final bool isSquareShapeButton;
  final bool isSelected;

  const CustomSelector({
    super.key,
    required this.forwardIcon,
    required this.backwardIcon,
    required this.centerText,
    required this.titleText,
    required this.onPress,
    required this.isSquareShapeButton,
    required this.isSelected,
  });

  @override
  State<CustomSelector> createState() => _CustomSelectorState();
}

class _CustomSelectorState extends State<CustomSelector> {
  @override
  Widget build(BuildContext context) {
    Color buttonColor =
        widget.isSelected ? ConstColors.primaryColor : ConstColors.whitetext;
    Color textColor =
        widget.isSelected ? ConstColors.whitetext : ConstColors.primaryColor;
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: buttonColor,
          boxShadow: [
            BoxShadow(
              color: ConstColors.primaryColor,
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
          borderRadius: widget.isSquareShapeButton == true
              ? BorderRadius.circular(10)
              : BorderRadius.circular(30),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          widget.backwardIcon == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 16,
                    color: textColor,
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: widget.centerText == false
                ? const EdgeInsets.fromLTRB(0, 0, 10, 0)
                : const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Text(' ${widget.titleText} ',
                style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500,
                    color: textColor)),
          ),
          widget.forwardIcon == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 16,
                    color: textColor,
                  ),
                )
              : const SizedBox()
        ]),
      ),
    );
  }
}
