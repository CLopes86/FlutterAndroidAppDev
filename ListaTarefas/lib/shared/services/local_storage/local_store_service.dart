import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as Storage;
import 'package:projeto1/shared/errors/local_storage_exceptions.dart';

class LocalStorageService {
  final Storage.FlutterSecureStorage storage = Storage
      .FlutterSecureStorage(); // Instância reutilizável do armazenamento.

  // Armazena dados de forma segura com uma chave especificada.
  Future<void> set(String key, String? data) async {
    try {
      await storage.write(key: key, value: data);
    } catch (error, st) {
      final errorMessage = "Error storing data: $data with key: $key";
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException(errorMessage);
    }
  }

  // Recupera dados seguros associados a uma chave especificada.
  Future<String?> get(String key) async {
    try {
      return await storage.read(key: key);
    } catch (error, st) {
      final errorMessage = "Error reading key: $key";
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException(errorMessage);
    }
  }

  // Limpa todos os dados do armazenamento seguro.
  Future<void> clearStorage() async {
    try {
      await storage.deleteAll();
    } catch (error, st) {
      const errorMessage = "Error clearing storage";
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException(errorMessage);
    }
  }
}
