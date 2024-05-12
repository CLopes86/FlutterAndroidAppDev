// lib/widgets/transacao_lista.dart

import 'package:flutter/material.dart';
import 'package:gestor_gastos/controllers/transacao_controller.dart';
import '../models/transacao.dart';
import 'transacao_item.dart';

/// Widget que exibe uma lista de transações em forma de lista scrollável.
///
/// Este widget é responsável por criar uma lista scrollável de transações,
/// onde cada transação é representada por um widget TransacaoItem.
class TransacaoLista extends StatelessWidget {
  /// Lista de transações que será exibida.
  final List<Transacao> transacoes;

  //Controlador para gerenciar as açoes sobre as transações
  final TransacaoController controller;

  /// Construtor que recebe a lista de transações e o controlador.
  ///
  /// Parâmetros:
  ///   - transacoes: A lista de objetos Transacao que serão exibidos na lista.
  ///   - controller: O controlador responsável pelas operações sobre as transações.
  const TransacaoLista(
      {super.key, required this.transacoes, required this.controller});

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

        // Retorna o widget TransacaoItem passando a 'Transacao' e o 'controller'
        return TransacaoItem(
          transacao: transacao,
          controller: controller,
        );
      },
    );
  }
}
