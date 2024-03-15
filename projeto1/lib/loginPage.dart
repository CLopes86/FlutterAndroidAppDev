import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desbloqueie seu Sucesso'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [
            Text(
              'Benvindo',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
