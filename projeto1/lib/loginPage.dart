import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto1/custom_scalfold.dart'; // Importa o widget CustomScaffold
import 'package:projeto1/theme/theme.dart'; // Importa o tema do aplicativo

class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); // Construtor da página de login

  @override
  State<LoginPage> createState() =>
      _LoginPageState(); // Cria o estado da página de login
}

class _LoginPageState extends State<LoginPage> {
  final _formSignInKey =
      GlobalKey<FormState>(); // Chave para o formulário de login
  bool rememberPassword = true; // Variável para lembrar a senha do usuário

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      // Utiliza o widget CustomScaffold para a estrutura da página
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0,
                  20.0), // Define o preenchimento do contêiner
              decoration: const BoxDecoration(
                color: Colors.white, // Cor de fundo do contêiner
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey, // Associa a chave ao formulário
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Bem-vindo', // Título da página de login
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary, // Cor do texto
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor coloque o e-mail'; // Mensagem de erro para campo vazio
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email', // Rótulo do campo de texto
                          hintText: 'Digite o email', // Sugestão para o usuário
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
