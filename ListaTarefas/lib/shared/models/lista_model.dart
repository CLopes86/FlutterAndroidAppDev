import 'package:uuid/uuid.dart';

/// Classe que representa um modelo de item de lista.
/// Cada item tem um identificador único, um título, uma descrição opcional, e uma data de criação ou modificação.
class ListaModel {
  /// Identificador único do item de lista. Um UUID v4 é gerado se nenhum ID é fornecido.
  final String id;

  /// Título do item de lista. Este campo é obrigatório.
  final String title;

  /// Descrição opcional do item de lista.
  final String? description;

  /// Data de criação ou modificação do item de lista. A data atual é usada se nenhuma data é fornecida.
  final DateTime date;

  /// Construtor que inicializa um item de lista com [cId] e [cDate] opcionais, e [title] obrigatório.
  /// Se nenhum [cId] é fornecido, um UUID v4 é gerado.
  /// Se nenhum [cDate] é fornecido, a data atual é usada.
  ListaModel({
    String? cId,
    required this.title,
    this.description,
    DateTime? cDate,
  })  : id = cId ?? Uuid().v4(),
        date = cDate ?? DateTime.now();

  /// Converte uma instância de [ListaModel] para um mapa, facilitando o armazenamento ou transferência.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.microsecondsSinceEpoch,
    };
  }

  /// Cria uma instância de [ListaModel] a partir de um mapa.
  /// Útil para deserialização de dados armazenados ou recebidos em formatos de mapa.
  factory ListaModel.fromMap(Map<String, dynamic> map) {
    if (!map.containsKey('id') ||
        !map.containsKey('title') ||
        !map.containsKey('date')) {
      throw FormatException('Missing required fields for ListaModel');
    }
    return ListaModel(
      cId: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String?,
      cDate: DateTime.fromMicrosecondsSinceEpoch(map['date'] as int),
    );
  }
}
