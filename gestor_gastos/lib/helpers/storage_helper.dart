import 'dart:convert';
import 'package:gestor_gastos/exceptions/excecao_ErroAmarzenamento.dart';
import 'package:gestor_gastos/validation/validacao.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transacao.dart';
import '../validation/validacao.dart';

/// Classe responsável pelo armazenamento e recuperação de transações usando SharedPreferences.
class StorageHelper {
  /// Chave usada para armazenar as transações no SharedPreferences.
  static const String _transacaoKey = 'transacao';

  /// Salva uma lista de transações no SharedPreferences.
  ///
  /// Cada transação é convertida para uma representação JSON antes de ser armazenada.
  /// Isso permite armazenar a lista de transações de forma estruturada e recuperável.
  ///
  /// Parâmetros:
  ///   - transacao: Lista de transações a serem salvas.
  static Future<void> salvarTransacao(List<Transacao> transacoes) async {
    Validacao.verificarListaVazia(transacoes, "transacoes");

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Converte cada transação para um mapa e depois para uma string JSON.
      List<String> jsonTransacao = transacoes
          .map((transacao) => json.encode(transacao.toJson()))
          .toList();

      // Armazena a lista de strings JSON no SharedPreferences.
      await prefs.setStringList(_transacaoKey, jsonTransacao);
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao salvar transações: ${e.toString()}');
    }
  }

  /// Carrega a lista de transações do SharedPreferences.
  ///
  /// Recupera a lista de strings JSON, convertendo cada uma delas de volta para objetos Transacao.
  /// Se nenhuma transação estiver armazenada, retorna uma lista vazia.
  ///
  /// Retorna:
  ///   - Uma lista de objetos Transacao recuperados do armazenamento.
  static Future<List<Transacao>> carregarTransacao() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Obtém a lista de strings JSON do SharedPreferences.
      List<String>? jsonTransacao = prefs.getStringList(_transacaoKey);

      // Se nada estiver armazenado, retorna uma lista vazia.
      if (jsonTransacao == null || jsonTransacao.isEmpty) {
        return [];
      }

      // Converte cada string JSON de volta para um objeto Transacao.
      return jsonTransacao
          .map(
              (jsonTransacao) => Transacao.fromJson(json.decode(jsonTransacao)))
          .toList();
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao carregar transações: ${e.toString()}');
    }
  }
}
