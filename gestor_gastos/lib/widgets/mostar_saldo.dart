import 'package:flutter/material.dart';
import 'package:gestor_gastos/controllers/transacao_controller.dart';

/// Widget que exibe o saldo total e disponível no aplicativo de gestão de gastos.
///
/// Este widget é responsável por apresentar as informações de saldo de forma
/// clara e destacada, contribuindo para uma interface intuitiva e informativa.
class MostrarSaldo extends StatelessWidget {
  // Controlador que contém as informações de saldo
  final TransacaoController controller;

  // Construtor que recebe o controlador como parâmetro
  const MostrarSaldo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
          20), // Espaçamento interno para melhor visualização
      color: Colors.blueGrey[50], // Cor de fundo suave para destacar a seção
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Texto para o saldo total
          Text(
            'Saldo Total: ${controller.saldoTotal.toStringAsFixed(2)} € ',
          ),
          SizedBox(
            height: 8,
          ),
          Text(
              'Saldo Disponivel: ${controller.saldoDisponivel.toStringAsFixed(2)} €'),
        ],
      ),
    );
  }
}
