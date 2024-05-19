import 'package:flutter/material.dart';
import 'package:gestor_gastos/controllers/transacao_controller.dart';
import 'package:gestor_gastos/widgets/texto_stilo.dart';
import 'package:intl/intl.dart';

class MostrarSaldo extends StatelessWidget {
  final TransacaoController controller;

  const MostrarSaldo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Formatação de moeda
    final NumberFormat currencyFormat =
        NumberFormat.simpleCurrency(locale: 'pt_PT', name: 'EUR');

    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.account_balance_wallet, color: Colors.blue),
                const SizedBox(width: 8),
                const TextoStyle(
                  'Saldo Total:',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                TextoStyle(
                  currencyFormat.format(controller.saldoTotal),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.money, color: Colors.green),
                const SizedBox(width: 8),
                const TextoStyle(
                  'Saldo Disponível:',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                TextoStyle(
                  currencyFormat.format(controller.saldoDisponivel),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
