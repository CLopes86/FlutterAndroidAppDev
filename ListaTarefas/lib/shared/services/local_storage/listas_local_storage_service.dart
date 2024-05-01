import 'dart:convert';
import 'dart:developer';

import 'package:projeto1/shared/const/messages_const.dart';
import 'package:projeto1/shared/errors/local_storage_exceptions.dart';
import 'package:projeto1/shared/services/local_storage/local_store_service.dart';

import '../../models/lista_model.dart';

// Serviço para manipulação de dados de lista no armazenamento local.
class ListasLocalStorageService {
  final String todosKey =
      "listas"; // Chave usada para armazenar/retriever as listas.
  final String doneTodosKey = "doneTodosKey";

  final LocalStorageService
      _localStorageService; // Instância do serviço de armazenamento local.

  ListasLocalStorageService(this._localStorageService);

  // Salva a lista de tarefas no armazenamento local.
  Future<String?> setListas(List<ListaModel> listas) async {
    try {
      // Codifica a lista de modelos ListaModel em uma string JSON.
      final String data = jsonEncode(
        listas.map((lista) => lista.toMap()).toList(),
      );
      // Armazena a string JSON no armazenamento local.
      await _localStorageService.set(todosKey, data);
      return null;
    } on LocalStorageException {
      return "Erro ao salvar tarefas."; // Retorna mensagem de erro específica.
    } catch (error, st) {
      log("Error saving todos", error: error, stackTrace: st);
      return defaultErrorMessage; // Retorna mensagem de erro padrão.
    }
  }

  // Recupera a lista de tarefas do armazenamento local.
  Future<(String? error, List<ListaModel>? todos)> getTodos() async {
    try {
      final String? todosJson = await _localStorageService.get(todosKey);
      if (todosJson != null) {
        final List<dynamic> todosList = jsonDecode(todosJson);
        final List<ListaModel> todos = todosList
            .map((todo) => ListaModel.fromMap(todo as Map<String, dynamic>))
            .toList();
        return (null, todos);
      }
      return (null, <ListaModel>[]); // Retorna lista vazia se não houver dados.
    } on LocalStorageException {
      return ("Erro ao carregar tarefas.", null); // Retorna erro ao carregar.
    } catch (error, st) {
      log("Error loading todos", error: error, stackTrace: st);
      return (defaultErrorMessage, null); // Retorna mensagem de erro padrão.
    }
  }

  Future<String?> setDoneListas(List<String> doneTodos) async {
    try {
      final String data = jsonEncode(doneTodos);

      await _localStorageService.set(doneTodosKey, data);
      return null;
    } on LocalStorageException {
      return "Erro ao salvar tarefas feitas."; // Retorna mensagem de erro específica.
    } catch (error, st) {
      log("Error saving  done todos", error: error, stackTrace: st);
      return defaultErrorMessage; // Retorna mensagem de erro padrão.
    }
  }

  Future<(String? error, List<String>? doneTodos)> getDoneTodos() async {
    try {
      final String? doneTodosJson =
          await _localStorageService.get(doneTodosKey);
      if (doneTodosJson != null) {
        final doneTodos = (jsonDecode(doneTodosJson) as List).cast<String>();
        return (null, doneTodos);
      }
      return (null, <String>[]); // Retorna lista vazia se não houver dados.
    } on LocalStorageException {
      return (
        "Erro ao carregar tarefas feitas.",
        null
      ); // Retorna erro ao carregar.
    } catch (error, st) {
      log("Error loading done  todos", error: error, stackTrace: st);
      return (defaultErrorMessage, null); // Retorna mensagem de erro padrão.
    }
  }
}
