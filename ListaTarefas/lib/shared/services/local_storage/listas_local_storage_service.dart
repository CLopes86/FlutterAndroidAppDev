import 'dart:convert';
import 'dart:developer';

import 'package:projeto1/shared/const/messages_const.dart';
import 'package:projeto1/shared/errors/local_storage_exceptions.dart';
import 'package:projeto1/shared/services/local_storage/local_store_service.dart';

import '../../models/lista_model.dart';

class ListasLocalStorageService {
  final String todoskey = "todos";

  final ListasLocalStorageService _localStorageService;

  ListasLocalStorageService(this._localStorageService);

  Future<String?> setListas(List<ListaModel> listas) async {
    try {
      final String data = jsonEncode(
        listas.map((lista) => lista.toMap()).toList(),
      );

      await _localStorageService.set(todoskey, data);

      return null;
    } on LocalStorageException {
      return "Erro ao salvar tarefas.";
    } catch (error, st) {
      log("Error saving todos", error: error, stackTrace: st);
      return defaultErrorMessage;
    }
  }

  Future<(String? error, List<ListaModel>? todos)> getTodos() async {
    try {
      final String? todosJson = await _localStorageService.get(todoskey);

      if(todosJson != null) {
        final todos = jsonDecode(todosJson) as List)
        .map<ListaModel>((todo) => ListaModel.fromMap(todo),).toList();

        return (null, todos);
      }

      return(null, <ListaModel>[]);
      
    } on LocalStorageException {
      return ("Erro ao carregar tarefas.", null);
    } catch (error, st) {
      log("Error loading todos", error: error, stackTrace: st);
      return (defaultErrorMessage, null);
    }
  }
  }
}
