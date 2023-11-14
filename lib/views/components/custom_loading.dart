import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/creatify_loading.gif',
        fit: BoxFit.cover,
        // width: 100,
        height: 50,
      ),
    );
  }
}
