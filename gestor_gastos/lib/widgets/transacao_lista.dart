import 'package:flutter/material.dart';

import '../models/transacao.dart';
import 'transacao_item.dart';

/// Widget que exibe uma lista de transações.
///
/// Este widget é responsável por criar uma lista scrollável de transações,
/// onde cada transação é representada por um widget TransacaoItem.
class TransacaoLista extends StatelessWidget {
  /// Lista de transações que será exibida.
  final List<Transacao> transacoes;

  /// Construtor que recebe a lista de transações.
  ///
  /// Parâmetro:
  ///   - transacoes: A lista de objetos Transacao que serão exibidos na lista.
  TransacaoLista({required this.transacoes});

  @override
  Widget build(BuildContext context) {
    // Retorna um ListView.builder que é um construtor de listas otimizado para grandes listas,
    // construindo apenas os itens que são necessários na tela.
    return ListView.builder(
      // itemCount define o número de itens na lista, que é a quantidade de transações.
      itemCount: transacoes.length,

      // itemBuilder é uma função que é chamada para cada item da lista. Esta função retorna
      // um widget que define como cada item da lista deve ser construído na tela.
      itemBuilder: (context, index) {
        // A variável 'transacao' contém a transação atual na lista, acessada pelo índice 'index'.
        final transacao = transacoes[index];

        // Retorna o widget TransacaoItem, que é responsável por renderizar a visualização de cada transação.
        // Passamos a 'transacao' atual como parâmetro para o TransacaoItem.
        return TransacaoItem(transacao: transacao);
      },
    );
  }
}
