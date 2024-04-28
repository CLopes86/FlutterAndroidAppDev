import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as Storage;
import 'package:projeto1/shared/errors/local_storage_exceptions.dart';

class LocalStorageService {
  Future<void> set(String key, String? data) async {
    const storage = Storage.FlutterSecureStorage();

    try {
      await storage.write(key: key, value: data);
    } catch (error, st) {
      final errorMessage = "Error storing data: $data with key: $key";
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException(errorMessage);
    }
  }

  Future<String?> get(String key) async {
    const storage = Storage.FlutterSecureStorage();

    try {
      return await storage.read(key: key);
    } catch (error, st) {
      final errorMessage = "Error reading key:  $key";
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException(errorMessage);
    }
  }

  Future<void> clearStorage(String key) async {
    const storage = Storage.FlutterSecureStorage();

    try {
      await storage.deleteAll();
    } catch (error, st) {
      const errorMessage = "Error clearing storage";
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException(errorMessage);
    }
  }
}
