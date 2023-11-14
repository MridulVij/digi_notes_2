import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child, required this.title});
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 199, 199, 199)),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Session",
              style: TextStyle(
                  color: Color.fromARGB(255, 208, 208, 208),
                  fontSize: 30,
                  fontWeight: FontWeight.normal),
            ),
          ]),
    );
  }
}
