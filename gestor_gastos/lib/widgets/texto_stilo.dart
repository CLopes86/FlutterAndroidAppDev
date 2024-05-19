import 'package:flutter/material.dart';

/// Widget para estilizar texto com propriedades personalizadas.

class TextoStyle extends StatelessWidget {
  final String texto;
  final double fontSize;
  final TextAlign? textAlign;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  const TextoStyle(
    this.texto, {
    this.fontSize = 18,
    this.textAlign,
    this.color = const Color.fromARGB(255, 117, 115, 115),
    this.fontWeight = FontWeight.bold,
    this.fontStyle = FontStyle.normal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
      textAlign: textAlign,
    );
  }
}
