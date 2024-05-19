/// Classe que implementa uma exceção personalizada para .

class ExcecaoApp implements Exception {
  final String mensagem;

  final String? prefixo;

  ExcecaoApp([this.mensagem = 'Erro desconhecido', this.prefixo]);

  @override
  String toString() {
    return prefixo != null ? "$prefixo: $mensagem" : mensagem;
  }
}
