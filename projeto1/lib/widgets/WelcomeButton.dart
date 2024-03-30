import 'package:flutter/material.dart';

/// Widget para exibir um botão de boas-vindas.
class WelcomeButton extends StatelessWidget {
  /// Construtor da classe WelcomeButton.
  const WelcomeButton({
    Key? key,
    required this.buttonText, // Texto exibido no botão
    required this.onTap, // Ação executada quando o botão é pressionado
    required this.color, // Cor de fundo do botão
    required this.textColor, // Cor do texto do botão
  }) : super(key: key);

  /// Texto exibido no botão.
  final String? buttonText;

  /// Ação executada quando o botão é pressionado.
  final Widget? onTap;

  /// Cor de fundo do botão.
  final Color? color;

  /// Cor do texto do botão.
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => onTap!,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: color!,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColor!,
          ),
        ),
      ),
    );
  }
}
