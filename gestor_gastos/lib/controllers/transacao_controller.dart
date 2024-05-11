import 'package:flutter/foundation.dart';
import 'package:gestor_gastos/exceptions/excecao_ErroAmarzenamento.dart';
import 'package:gestor_gastos/helpers/storage_helper.dart';
import 'package:gestor_gastos/models/transacao.dart';
import 'package:gestor_gastos/validation/validacao.dart';

/// Controlador que gerencia as transações do aplicativo.

/// Este controlador é responsável por intermediar as operações entre a interface do usuário
/// e os dados das transações, manipulando a lógica de negócios e acesso ao armazenamento.

class TransacaoController extends ChangeNotifier {
  List<Transacao> _transacoes = [];

  List<Transacao> get transacoes => List.unmodifiable(_transacoes);

  /// Carrega as transações do armazenamento local.
  Future<void> carregarTransacoes() async {
    try {
      _transacoes = await StorageHelper.carregarTransacao();
      notifyListeners();
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao carregar transações:  ${e.toString()}');
    }
  }

  /// Adiciona uma nova transação.
  Future<void> adcionarTransacao(Transacao novaTransacao) async {
    try {
      Validacao.verificarNulo(novaTransacao, 'novaTransacao');
      _transacoes.add(novaTransacao);
      await StorageHelper.salvarTransacao(_transacoes);
      notifyListeners();
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao adcionar transação: ${e.toString()}');
    }
  }

  /// Remove uma transação.
  Future<void> removerTransacao(Transacao transacao) async {
    try {
      Validacao.verificarNulo(transacao, 'transacao');
      _transacoes.remove(transacao);
      notifyListeners();
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao remover transacao: ${e.toString()}');
    }
  }
}
