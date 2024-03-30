import 'package:flutter/material.dart';
import 'package:projeto1/screens/welcome_screen.dart';
import 'package:projeto1/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

/// Classe principal que inicializa o aplicativo Flutter.
class MyApp extends StatelessWidget {
  /// Construtor da classe MyApp.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode, // Define o tema do aplicativo
      home: const WelcomeScreen(), // Define a tela inicial do aplicativo
    );
  }
}
