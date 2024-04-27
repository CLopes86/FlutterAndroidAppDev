import 'package:uuid/uuid.dart'; // Importa o pacote UUID para gerar identificadores únicos.

class ListaModel {
  final String id; // Identificador único da lista.
  final String title; // Título da lista.
  final String? description; // Descrição opcional da lista.
  final DateTime date; // Data de criação ou modificação da lista.

  // Construtor da ListaModel com parâmetros opcionais para id e data,
  // e parâmetros obrigatórios para o título.
  ListaModel({
    String? cId, // ID personalizado ou gerado automaticamente se não fornecido.
    required this.title, // Título é obrigatório.
    this.description, // Descrição é opcional.
    DateTime? cDate, // Data personalizada ou atual se não fornecida.
  })  : id = cId ??
            const Uuid().v4(), // Gera um UUID se nenhum id for fornecido.
        date = cDate ??
            DateTime.now(); // Usa a data atual se nenhuma data for fornecida.
}
