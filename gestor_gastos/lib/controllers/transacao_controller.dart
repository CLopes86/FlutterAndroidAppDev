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
  double _saldoTotal = 0.0;
  double _saldoDisponivel = 0.0;

  List<Transacao> get transacoes => List.unmodifiable(_transacoes);
  double get saldoTotal => _saldoTotal;
  double get saldoDisponivel => _saldoDisponivel;

  /// Carrega as transações do armazenamento local e calcula os saldos
  Future<void> carregarTransacoes() async {
    try {
      _transacoes = await StorageHelper.carregarTransacao();
      _calcularSaldos();
      notifyListeners();
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao carregar transações:  ${e.toString()}');
    }
  }

  /// Adiciona uma nova transação e recalcula os saldos
  Future<void> adcionarTransacao(Transacao novaTransacao) async {
    try {
      Validacao.verificarNulo(novaTransacao, 'novaTransacao');
      _transacoes.add(novaTransacao);
      _calcularSaldos();
      await StorageHelper.salvarTransacao(_transacoes);
      notifyListeners();
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao adcionar transação: ${e.toString()}');
    }
  }

  /// Remove uma transação e recalcula o saldo
  Future<void> removerTransacao(Transacao transacao) async {
    try {
      Validacao.verificarNulo(transacao, 'transacao');
      _transacoes.remove(transacao);
      _calcularSaldos();
      notifyListeners();
    } catch (e) {
      throw ExcecaoErroArmazenamento(
          'Falha ao remover transacao: ${e.toString()}');
    }
  }

  //Calcular o saldo total e disponivel a partir da lista de transações
  void _calcularSaldos() {
    _saldoTotal = 0.0;
    _saldoDisponivel = 0.0;

    for (Transacao t in _transacoes) {
      _saldoTotal += t.quantia; // Adiciona todas as quantias ao saldo total

      _saldoDisponivel +=
          t.quantia; // Atualiza o saldo disponível baseado na quantia
    }
  }
}
