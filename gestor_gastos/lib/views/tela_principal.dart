import 'package:flutter/material.dart';
import 'package:gestor_gastos/controllers/transacao_controller.dart';
import 'package:gestor_gastos/widgets/transacao_lista.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestão de Gastos'),
        actions: [
          IconButton(
            onPressed: () {
              // Implementar funcionalidade de busca
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: TransacaoLista(
            transacoes: TransacaoController,
          ))
        ],
      ),
    );
  }
}
