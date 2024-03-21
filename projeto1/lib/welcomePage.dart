import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto1/custom_scalfold.dart';
import 'package:projeto1/homePage.dart';
import 'package:projeto1/loginPage.dart';
import 'package:projeto1/registrationPage.dart';
import 'package:projeto1/theme/theme.dart';
import 'package:projeto1/welcomeButton.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}); // Construtor da classe WelcomePage

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      // Utiliza um CustomScaffold para a estrutura básica da página
      child: Column(
        // Coluna que organiza os elementos verticalmente
        children: [
          Flexible(
            // Widget Flexible para o título da página
            flex: 5, // Ocupa 5/6 do espaço disponível
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40.0,
              ),
              child: Center(
                child: RichText(
                  // RichText permite exibir diferentes estilos de texto
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Bem-vindo à sua jornada de produtividade pessoal\n', // Título principal
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Entre e descubra o poder da organização! \n', // Subtítulo
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            // Widget Flexible para os botões de login e registro
            flex: 1, // Ocupa 1/6 do espaço disponível
            child: Align(
              // Alinha os botões à parte inferior direita da tela
              alignment: Alignment.bottomRight,
              child: Row(
                // Linha que organiza os botões horizontalmente
                children: [
                  Expanded(
                    // Expande o primeiro botão para preencher todo o espaço restante
                    child: WelcomeButton(
                      // Botão de login
                      buttonText: 'Entrar',
                      onTap:
                          LoginPage(), // Ao pressionar, direciona para a página de login
                      color: Colors.lightBlue, // Cor de fundo do botão
                      textColor: Colors.white, // Cor do texto do botão
                    ),
                  ),
                  Expanded(
                    // Expande o segundo botão para preencher todo o espaço restante
                    child: WelcomeButton(
                      // Botão de registro
                      buttonText: 'Registar',
                      onTap:
                          const RegistrationPage(), // Ao pressionar, direciona para a página de registro
                      color: Color.fromARGB(
                          255, 9, 31, 94), // Cor de fundo do botão
                      textColor:
                          lightColorScheme.primary, // Cor do texto do botão
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
