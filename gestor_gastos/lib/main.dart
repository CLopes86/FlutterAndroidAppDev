import 'package:flutter/material.dart';
import 'package:gestor_gastos/themes/app_tema.dart';

import 'views/tela_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestão de Gastos',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const TelaPrincipal(),
    );
  }
}
