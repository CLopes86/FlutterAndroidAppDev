import 'package:flutter/foundation.dart';
import 'package:gestor_gastos/helpers/storage_helper.dart';
import 'package:gestor_gastos/models/transacao.dart';

import '../exceptions/excecao_ErroAmarzenamento.dart';

/// Controlador que gerencia as transações do aplicativo.

class TransacaoController extends ChangeNotifier {
  List<Transacao> _transacoes = [];
  double _saldoTotal = 0.0;
  double _saldoDisponivel = 0.0;

  List<Transacao> get transacoes => List.unmodifiable(_transacoes);
  double get saldoTotal => _saldoTotal;
  double get saldoDisponivel => _saldoDisponivel;

  /// Carrega as transações do armazenamento local e calcula os saldos.
  Future<void> carregarTransacoes() async {
    try {
      _transacoes = await StorageHelper.loadTransacao();
      _calcularSaldos();
      notifyListeners();
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao carregar transações: ${e.toString()}');
    }
  }

  /// Adiciona ou atualiza uma nova transação e recalcula os saldos.
  Future<void> adicionarTransacao(Transacao novaTransacao) async {
    try {
      int index = _transacoes.indexWhere((t) => t.id == novaTransacao.id);
      if (index >= 0) {
        _transacoes[index] = novaTransacao;
      } else {
        _transacoes.add(novaTransacao);
      }
      _calcularSaldos();
      await StorageHelper.saveTransacao(_transacoes);
      notifyListeners();
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao adicionar ou atualizar transação: ${e.toString()}');
    }
  }

  /// Remove uma transação e recalcula o saldo.
  Future<void> removerTransacao(Transacao transacao) async {
    try {
      _transacoes.remove(transacao);
      _calcularSaldos();
      await StorageHelper.saveTransacao(_transacoes);
      notifyListeners();
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao remover transação: ${e.toString()}');
    }
  }

  /// Calcula o saldo total e disponível a partir da lista de transações.
  void _calcularSaldos() {
    _saldoTotal = 0.0;
    _saldoDisponivel = 0.0;

    for (Transacao t in _transacoes) {
      _saldoTotal += t.quantia;
      _saldoDisponivel += t.quantia;
    }
  }
}
