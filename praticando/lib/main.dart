import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Classe principal que inicia o aplicativo Flutter
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define as rotas nomeadas do aplicativo
      routes: {
        '/': (context) => HomeScreen(), // Rota padrão é a HomeScreen
        '/details': (context) => DetailsScreen(), // Rota para a DetailsScreen
      },
    );
  }
}

// Classe para armazenar uma mensagem
class Message {
  String text;

  Message(this.text); // Construtor da classe Message
}

// Tela inicial do aplicativo
class HomeScreen extends StatelessWidget {
  final TextEditingController _controller =
      TextEditingController(); // Controlador para o campo de texto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'), // Título da barra de aplicativos
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: 'Digite uma mensagem'), // Rótulo do campo de texto
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navega para a tela DetailsScreen passando a mensagem digitada como argumento
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: Message(_controller.text),
                );
              },
              child: Text('Ir para a DetailsScreen'), // Texto do botão
            ),
          ],
        ),
      ),
    );
  }
}

// Tela de detalhes acessada a partir da tela inicial
class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recupera a mensagem passada como argumento
    final Message message =
        ModalRoute.of(context)!.settings.arguments as Message;

    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'), // Título da barra de aplicativos
      ),
      body: Center(
        child: Text(
          message.text, // Exibe a mensagem recebida
          style: TextStyle(fontSize: 24.0), // Estilo do texto
        ),
      ),
    );
  }
}
