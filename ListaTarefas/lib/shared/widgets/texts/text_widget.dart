import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;

  const TextWidget(
    this.text, {
    double? cFontSize,
    this.textAlign,
    super.key,
  }) : fontSize = cFontSize ?? 16;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
      ),
      textAlign: textAlign,
    );
  }
}
