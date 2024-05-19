import 'package:gestor_gastos/exceptions/excecao_app.dart';

/// Classe que representa uma exceção para erros relacionados ao armazenamento de dados.

class ExcecaoErroArmazenamento extends ExcecaoApp {
  ExcecaoErroArmazenamento([String mensagem = 'Erro ao armazenar dados'])
      : super(mensagem, 'Erro de Armazenamento');
}
