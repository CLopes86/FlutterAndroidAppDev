import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto1/homePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 143, 134, 7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Benvindo',
            style: TextStyle(
              color: Color.fromARGB(255, 119, 7, 72),
              fontSize: 55,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Desbloqueie seu Sucesso',
            style: TextStyle(
              color: Colors.red,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Image.network(
              'https://setting.com.br/wp-content/uploads/2020/08/aplicativo-gestao-tarefas.jpg'),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const HomePage();
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber.shade300,
                foregroundColor: Colors.blue.shade900,
                minimumSize: const Size(300, 40)),
            child: const Text('Entrar'),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber.shade300,
                foregroundColor: Colors.blue.shade900,
                minimumSize: const Size(300, 40)),
            child: const Text('Registar'),
          )
        ],
      ),
    );
  }
}
