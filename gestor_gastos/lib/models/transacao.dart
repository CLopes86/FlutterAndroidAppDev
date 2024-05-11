/// Classe que representa uma transação financeira no aplicativo.

/// Esta classe é usada para armazenar dados relacionados a transações financeiras,
/// como o ID da transação, título, quantia e data
class Transacao {
  final String id;
  final String titulo;
  final double quantia;
  final DateTime data;

  Transacao(
      {required this.id,
      required this.titulo,
      required this.quantia,
      required this.data});

  /// Cria uma instância de [Transacao] a partir de um mapa de valores chave-valor (JSON).
  ///
  /// Esse construtor é usado para desserializar os dados JSON que foram armazenados
  /// no SharedPreferences
  ///
  /// Parâmetros:
  ///   - json: Um mapa representando dados de uma transação.
  factory Transacao.fromJson(Map<String, dynamic> json) {
    return Transacao(
      id: json['id'] as String,
      titulo: json['titulo'] as String,
      quantia: (json['quantia'] as num).toDouble(),
      data: DateTime.parse(json['data'] as String),
    );
  }

  /// Converte uma instância de [Transacao] para um mapa JSON.
  ///
  /// Este método é usado para serializar os dados de uma transação para que possam ser
  /// armazenados no SharedPreferences ou enviados a um serviço web.
  ///
  /// Retorna:
  ///   - Um mapa que representa os dados da transação.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'quantia': quantia,
      'data': data.toIso8601String(),
    };
  }
}
