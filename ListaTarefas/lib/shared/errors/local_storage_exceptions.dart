// Define uma exceção personalizada para erros relacionados ao armazenamento local.
class LocalStorageException implements Exception {
  final String message;

// Construtor que inicializa a exceção com uma mensagem específica.
  LocalStorageException(this.message);
}
