import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    Key? key,
    this.buttonText,
    this.onTap,
    this.color,
    this.textColor,
  }) : super(key: key); // Construtor para o widget WelcomeButton

  final String? buttonText; // Texto exibido no botão
  final Widget? onTap; // Widget a ser exibido quando o botão é pressionado
  final Color? color; // Cor de fundo do botão
  final Color? textColor; // Cor do texto do botão

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Widget GestureDetector para detectar toques no botão
      onTap: () {
        // Função executada quando o botão é pressionado
        Navigator.push(
          // Navega para a próxima página quando o botão é pressionado
          context,
          MaterialPageRoute(
            builder: (e) => onTap!, // Construtor da próxima página
          ),
        );
      },
      child: Container(
        // Contêiner que representa o botão
        padding:
            const EdgeInsets.all(30.0), // Preenchimento interno do contêiner
        decoration: BoxDecoration(
          // Decoração do contêiner
          color: color!, // Cor de fundo do contêiner
          borderRadius: const BorderRadius.only(
            // Borda arredondada do contêiner
            topLeft: Radius.circular(
                50), // Apenas o canto superior esquerdo é arredondado
          ),
        ),
        child: Text(
          // Texto exibido dentro do contêiner
          buttonText!, // Texto do botão
          textAlign: TextAlign.center, // Alinhamento do texto ao centro
          style: TextStyle(
            // Estilo do texto
            fontSize: 20.0, // Tamanho da fonte do texto
            fontWeight: FontWeight.bold, // Peso da fonte do texto
            color: textColor!, // Cor do texto
          ),
        ),
      ),
    );
  }
}
