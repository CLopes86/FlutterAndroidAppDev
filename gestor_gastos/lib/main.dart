import 'package:flutter/material.dart';
import 'package:gestor_gastos/controllers/transacao_controller.dart';
import 'package:provider/provider.dart';

import 'views/tela_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransacaoController()..carregarTransacoes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gestão de Gastos',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              titleTextStyle: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(
                color: Colors.grey,
              )),
        ),
        home: const TelaPrincipal(),
      ),
    );
  }
}
