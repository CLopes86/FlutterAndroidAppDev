import 'package:flutter/foundation.dart';
import 'package:projeto1/shared/models/lista_model.dart';
import '../../../shared/services/local_storage/listas_local_storage_service.dart';

/// Classe que atua como o controlador para as operações relacionadas a tarefas,
/// incluindo carregamento, adição e atualização de tarefas concluídas.
class TodosController extends ChangeNotifier {
  /// Serviço de armazenamento local para persistência de tarefas.
  final ListasLocalStorageService _listasLocalStorageService;

  TodosController(this._listasLocalStorageService);

  /// Lista de todas as tarefas.
  final List<ListaModel> todos = [];

  /// Lista de IDs das tarefas que foram marcadas como concluídas.
  final List<String> doneTodos = [];

  /// Carrega as tarefas do armazenamento local.
  /// Retorna um erro se algo der errado, caso contrário retorna null.
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

  /// Ordena as tarefas pela data, da mais antiga para a mais recente, e notifica os ouvintes.
  void sortTodosByData() {
    todos.sort((todoA, todoB) => todoA.date.compareTo(todoB.date));
    notifyListeners();
  }

  /// Carrega as tarefas concluídas do armazenamento local.
  /// Retorna um erro se algo der errado, caso contrário retorna null.
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

  /// Adiciona uma nova tarefa à lista e salva a lista atualizada.
  /// Retorna um erro se algo der errado, caso contrário retorna null.
  Future<String?> addTodo(ListaModel todo) async {
    todos.add(todo);
    final String? error = await saveTodos();

    if (error == null) {
      sortTodosByData();
    }
    return error;
  }

  /// Salva a lista de tarefas no armazenamento local.
  Future<String?> saveTodos() {
    return _listasLocalStorageService.setListas(todos);
  }

  /// Verifica se uma tarefa está marcada como concluída.
  bool isTodoChecked(String id) {
    return doneTodos.indexWhere((checkedTodoId) => checkedTodoId == id) != -1;
  }

  /// Marca ou desmarca uma tarefa como concluída e salva o estado atualizado.
  /// Retorna um erro se algo der errado, caso contrário retorna null.
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
    return error;
  }
}
