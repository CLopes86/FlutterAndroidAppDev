import 'package:gestor_gastos/exceptions/excecao_app.dart';

/// Classe responsável por realizar validações comuns em todo o aplicativo.

/// Fornece métodos estáticos para validar se um valor é nulo ou se uma lista está vazia,
/// lançando exceções específicas quando uma validação falha
class Validacao {
  /// Verifica se um valor dinâmico é nulo.
  ///
  /// Lança uma [ExcecaoApp] se o valor for nulo.
  ///
  /// Parâmetros:
  ///   - value: O valor a ser verificado.
  ///  - variableName: O nome da variável para incluir na mensagem de erro.
  static void verificarNulo(dynamic value, String variableName) {
    if (value == null) {
      throw ExcecaoApp("$variableName não pode ser nulo");
    }
  }

  /// Verifica se uma lista está vazia.
  ///
  /// Lança uma [ExcecaoApp] se a lista estiver vazia.
  ///
  /// Parâmetros:
  ///   - list: A lista a ser verificada.
  ///   - listName: O nome da lista para incluir na mensagem de erro.
  static void verificarListaVazia(List<dynamic> list, String listName) {
    if (list.isEmpty) {
      throw ExcecaoApp('$listName não pode estar vazio');
    }
  }
}
