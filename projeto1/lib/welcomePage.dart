import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto1/custom_scalfold.dart';
import 'package:projeto1/homePage.dart';
import 'package:projeto1/loginPage.dart';
import 'package:projeto1/registrationPage.dart';
import 'package:projeto1/welcomeButton.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScafold(
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40.0,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text:
                              'Bem-vindo à sua jornada de produtividade pessoal\n',
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                          )),
                      TextSpan(
                          text: 'Entre e descubra o poder da organização! \n',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Entrar',
                      onTap: LoginPage(),
                      color: Colors.lightBlue,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Registar',
                      onTap: RegistrationPage(),
                      color: Color.fromARGB(255, 9, 31, 94),
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
