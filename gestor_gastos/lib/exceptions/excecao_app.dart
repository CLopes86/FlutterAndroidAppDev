/// Classe que implementa uma exceção personalizada para o aplicativo.
///
/// Esta classe fornece uma estrutura para lançar exceções com mensagens e prefixos
/// personalizados, facilitando a identificação e o tratamento de erros específicos.
class ExcecaoApp implements Exception {
  /// Mensagem de erro que descreve o que deu errado.
  final String mensagem;

  /// Prefixo opcional que pode ser usado para categorizar ou destacar a natureza da exceção.
  final String? prefixo;

  /// Construtor que permite a definição de uma mensagem e um prefixo opcional para a exceção.
  /// Se nenhum valor for fornecido para a mensagem, "Erro desconhecido" será usado por padrão.
  ExcecaoApp([this.mensagem = 'Erro desconhecido', this.prefixo]);

  /// Representação em string da exceção, formatada com o prefixo (se disponível) e a mensagem.
  @override
  String toString() {
    return "$prefixo: $mensagem";
  }
}
