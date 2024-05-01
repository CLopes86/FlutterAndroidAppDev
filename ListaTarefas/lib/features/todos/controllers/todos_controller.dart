import 'package:flutter/foundation.dart';
import 'package:projeto1/shared/models/lista_model.dart';

import '../../../shared/services/local_storage/listas_local_storage_service.dart';

class TodosController extends ChangeNotifier {
  final ListasLocalStorageService _listasLocalStorageService;

  TodosController(this._listasLocalStorageService);

  final List<ListaModel> todos = [];

  final List<String> doneTodos = [];

  Future<String?> loadTodos() async {
    final (String? error, List<ListaModel>? loadedTodos) =
        await _listasLocalStorageService.getTodos();

    if (error == null) {
      todos
        ..clear()
        ..addAll(loadedTodos!);

      sortTodosByData();
    }
    return error;
  }

  void sortTodosByData() {
    todos.sort((todoA, todoB) => todoA.date.compareTo(todoB.date));
    notifyListeners();
  }

  Future<String?> loadDoneTodos() async {
    final (String? error, List<String>? loadedDoneTodos) =
        await _listasLocalStorageService.getDoneTodos();

    if (error == null) {
      doneTodos
        ..clear()
        ..addAll(loadedDoneTodos!);
    }

    return error;
  }

  Future<String?> addTodo(ListaModel todo) async {
    todos.add(todo);

    final String? error = await saveTodos();

    if (error == null) {
      sortTodosByData();
    }
    return error;
  }

  Future<String?> saveTodos() {
    return _listasLocalStorageService.setListas(todos);
  }

  bool isTodoChecked(String id) {
    return doneTodos.indexWhere((checkedTodoId) => checkedTodoId == id) != -1;
  }

  Future<String?> checkTodo(String id) async {
    if (!isTodoChecked(id)) {
      doneTodos.add(id);
    } else {
      doneTodos.removeWhere((checkedTodoId) => checkedTodoId == id);
    }

    final String? error =
        await _listasLocalStorageService.setDoneListas(doneTodos);

    if (error == null) {
      notifyListeners();
    }

    if (isTodoChecked(id)) {
      doneTodos.add(id);
    } else {
      doneTodos.removeWhere((checkedTodoId) => checkedTodoId == id);
    }

    return error;
  }
}
