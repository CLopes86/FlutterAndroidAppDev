import 'package:flutter/material.dart';
import 'package:projeto1/features/todos/add_todo/screens/add_todo_scream.dart';
import 'package:projeto1/features/todos/controllers/todos_controller.dart';
import 'package:projeto1/features/todos/widgets/add_todo_icon_widget.dart';
import 'package:projeto1/shared/widgets/texts/text_widget.dart';
import 'package:provider/provider.dart';

import '../../../shared/models/lista_model.dart';
import '../widgets/lista_checkbox_widget.dart';
import '../widgets/lista_date_widget.dart';
import '../widgets/lista_title_description.dart';
import '../widgets/loading_error_widget.dart';

final class TodosScreen extends StatefulWidget {
  //Contrutor da classe
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  bool isLoading = true;
  String? error;

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadTodosAndDoneTodos();
    });
    super.initState();
  }

  Future<void> loadTodosAndDoneTodos() async {
    isLoading = true;
    error = null;

    final todosCtr1 = context.read<TodosController>();

    final String? errorLoadingTodos = await todosCtr1.loadTodos();
    final String? errorLoadingDoneTodos = await todosCtr1.loadDoneTodos();

    if (errorLoadingTodos != null || errorLoadingDoneTodos != null) {
      setState(() {
        error = errorLoadingTodos ?? errorLoadingDoneTodos;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void _goToAddTodosScren() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AddTodosScren(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todosCtr1 = context.watch<TodosController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        actions: [
          AddTodoIconWidget(goToAddTodosScren: _goToAddTodosScren),
        ],
      ),
      body: isLoading || error != null
          ? LoadingErrorWidget(
              isLoading: isLoading,
              error: error,
              loadTodosAndDoneTodos: loadTodosAndDoneTodos,
            )
          : todosCtr1.todos.isEmpty
              ? const Center(
                  child: TextWidget('Ainda não tens nenhuma tarefa!'),
                )
              : ListView.builder(
                  itemCount: todosCtr1.todos.length,
                  itemBuilder: (_, int index) {
                    final ListaModel lista = todosCtr1.todos[index];
                    return Row(
                      children: [
                        ListaCheckboxWidget(lista),
                        const SizedBox(width: 12),
                        ListaTitleDescription(lista),
                        ListaDateWidget(lista),
                      ],
                    );
                  },
                ), // Corpo da tela
    );
  }
}
