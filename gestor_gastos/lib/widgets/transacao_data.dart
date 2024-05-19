import 'package:flutter/material.dart';
import 'package:gestor_gastos/models/transacao.dart';
import 'package:gestor_gastos/widgets/data_formatado.dart';

/// Widget que exibe a data formatada de uma transação.
///
class TransacaoData extends StatelessWidget {
  final Transacao transacao;

  const TransacaoData({super.key, required this.transacao});

  @override
  Widget build(BuildContext context) {
    final String dataFormatado = transacao.data.formatDate;
    return Text(
      dataFormatado,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
