import 'package:flutter/material.dart';

class AutoSizeText extends StatelessWidget {
  AutoSizeText(this.text,
      {this.textAlign,
      this.decoration,
      this.fontWeight,
      this.color,
      this.fontSize = 12,
      super.key});
  String text;
  double fontSize;
  Color? color;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    double boxRatio = 0;

    if (width <= 600) {
      boxRatio = width / 400;
    } else {
      boxRatio = height / 400;
    }
    double size = boxRatio * fontSize;

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontFamily: "Fonts",
          fontSize: size,
          fontWeight: fontWeight,
          decoration: decoration),
    );
  }
}
