import 'package:flutter/material.dart';

class MyButtom extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButtom({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.yellow,
      child: Text(text),
    );
  }
}
