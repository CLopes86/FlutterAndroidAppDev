import 'dart:convert';
import 'package:gestor_gastos/exceptions/excecao_ErroAmarzenamento.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transacao.dart';

/// Classe responsável pelo armazenamento e recuperação de transações usando SharedPreferences.
class StorageHelper {
  /// Chave usada para armazenar as transações no SharedPreferences.
  static const String _transacaoKey = 'transacao';

  /// Salva uma lista de transações no SharedPreferences.
  /// Parâmetros:
  ///   - transacoes: Lista de transações a serem salvas.
  static Future<void> saveTransacao(List<Transacao> transacoes) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> jsonTransacao =
        transacoes.map((transacao) => json.encode(transacao.toJson())).toList();

    await prefs.setStringList(_transacaoKey, jsonTransacao);
  }

  /// Carrega a lista de transações do SharedPreferences.
  /// Retorna:
  ///   - Uma lista de objetos Transacao recuperados do armazenamento.
  static Future<List<Transacao>> loadTransacao() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? jsonTransacao = prefs.getStringList(_transacaoKey);

      if (jsonTransacao == null || jsonTransacao.isEmpty) {
        return [];
      }

      return jsonTransacao
          .map(
              (jsonTransacao) => Transacao.fromJson(json.decode(jsonTransacao)))
          .toList();
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao carregar transações: ${e.toString()}');
    }
  }

  /// Obtém uma transação específica pelo ID.
  /// Retorna:
  ///   - A transação correspondente ao ID fornecido, ou nulo se não for encontrada.
  static Future<Transacao?> getTransaction(String id) async {
    try {
      List<Transacao> transacoes = await loadTransacao();
      // Procura pela transação com o ID fornecido.
      Transacao? transacaoEncontrada;
      try {
        transacaoEncontrada =
            transacoes.firstWhere((transacao) => transacao.id == id);
      } catch (e) {
        transacaoEncontrada = null;
      }
      return transacaoEncontrada;
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao obter transação: ${e.toString()}');
    }
  }

  /// Exclui uma transação pelo ID.
  ///
  /// Parâmetros:
  ///   - id: O ID da transação a ser excluída.
  static Future<void> deleteTransacao(String id) async {
    try {
      List<Transacao> transacoes = await loadTransacao();

      transacoes.removeWhere((transacao) => transacao.id == id);

      await saveTransacao(transacoes);
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao excluir transação: ${e.toString()}');
    }
  }

  /// Atualiza uma transação existente.
  ///
  /// Parâmetros:
  ///   - updatedTransaction: A transação atualizada a ser salva.
  static Future<void> updateTransacao(Transacao updatedTransacao) async {
    try {
      List<Transacao> transacoes = await loadTransacao();

      // Encontra o índice da transação a ser atualizada.
      int index = transacoes
          .indexWhere((transacao) => transacao.id == updatedTransacao.id);

      if (index != -1) {
        // Atualiza a transação no índice encontrado.
        transacoes[index] = updatedTransacao;

        await saveTransacao(transacoes);
      } else {
        throw ExcecaoErroArmazenamento(
            'Transação não encontrada para atualização');
      }
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao atualizar transação: ${e.toString()}');
    }
  }
}
