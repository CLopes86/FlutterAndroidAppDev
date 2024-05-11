import 'package:flutter/material.dart';
import 'package:gestor_gastos/controllers/transacao_controller.dart';
import 'package:gestor_gastos/models/transacao.dart';

/// Widget para representar um único item de transação.
///
/// Este widget é responsável por exibir os detalhes de uma transação individual,
/// como parte de uma lista em TransacaoLista. Inclui interações para edição e remoção.

class TransacaoItem extends StatelessWidget {
  /// A transação que será exibida neste item.
  final Transacao transacao;

  /// Controlador que gerencia ações sobre as transações.
  final TransacaoController controller;

  /// Construtor que recebe a transação e o controlador correspondente.
  ///
  /// Parâmetros:
  ///   - transacao: A transação a ser exibida.
  ///   - controller: O controlador para gerenciar ações como edição e remoção.
  const TransacaoItem({
    required this.transacao,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Constrói um Card que encapsula a visualização de uma transação.
    return Card(
      // Adiciona elevação para um efeito visual de sombreamento.
      elevation: 2,

      // Margens uniformes ao redor do card para espaçamento visual na lista.
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),

      // ListTile é usado para uma exibição padrão de item de lista com título, subtítulo e ícones.
      child: ListTile(
        // O leading mostra um círculo com a quantia da transação.
        leading: CircleAvatar(
          radius: 30,

          // Padding interno para o texto dentro do círculo.
          child: Padding(
            padding: EdgeInsets.all(6),

            // FittedBox garante que o texto não saia do círculo.
            child: FittedBox(
              child: Text('R\$${transacao.quantia.toStringAsFixed(2)}'),
            ),
          ),
        ),

        // Título do ListTile com o título da transação.
        title: Text(
          transacao.titulo,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
