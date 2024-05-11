import 'package:gestor_gastos/exceptions/excecao_app.dart';

/// Classe que representa uma exceção para erros relacionados ao armazenamento de dados.

/// Esta exceção é lançada quando ocorre um problema ao tentar salvar ou manipular dados em armazenamento persistente,
/// como databases ou SharedPreferences.
class ExcecaoErroArmazenamento extends ExcecaoApp {
  /// Constrói a exceção com uma mensagem opcional.
  /// Se nenhuma mensagem é fornecida, "Erro ao armazenar dados" é usado como padrão.
  ExcecaoErroArmazenamento([String mensagem = 'Erro ao armazenar dados'])
      : super(mensagem, 'Erro de Armazenamento');
}
