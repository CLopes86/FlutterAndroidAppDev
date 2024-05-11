import 'package:gestor_gastos/exceptions/excecao_app.dart';

/// Classe que representa uma exceção para casos onde os dados necessários não são encontrados.

/// Esta exceção é lançada quando uma operação espera encontrar dados específicos, mas eles não estão disponíveis,
/// como ao tentar recuperar informações de um banco de dados ou de um armazenamento local.
class ExcecaoDadosNaoEncontrados extends ExcecaoApp {
  /// Constrói a exceção com uma mensagem opcional.
  /// Se nenhuma mensagem é fornecida, "Dados não encontrados" é usado como padrão.

  ExcecaoDadosNaoEncontrados([String mensagem = 'Dados não encontrados'])
      : super(mensagem, 'Não Encontrado');
}
