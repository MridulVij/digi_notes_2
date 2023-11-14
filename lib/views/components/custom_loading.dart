import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(112, 0, 0, 0),
      height: double.maxFinite,
      width: double.maxFinite,
      child: Center(
        child: Image.asset('assets/images/creatify_loading.gif'),
      ),
    );
  }
}
