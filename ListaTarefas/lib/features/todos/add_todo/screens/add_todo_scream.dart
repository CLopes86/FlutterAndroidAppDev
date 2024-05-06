import 'package:flutter/material.dart';
import 'package:projeto1/features/todos/add_todo/widget/description_text_input_widget.dart';
import 'package:projeto1/features/todos/add_todo/widget/title_text_input.dart';
import 'package:projeto1/features/todos/controllers/todos_controller.dart';
import 'package:projeto1/shared/mixins/snack_bar_mixin.dart';
import 'package:projeto1/shared/models/lista_model.dart';
import 'package:projeto1/shared/widgets/texts/text_widget.dart';
import 'package:provider/provider.dart';

import '../widget/date_text_input_widget.dart';

class AddTodosScren extends StatefulWidget {
  const AddTodosScren({super.key});

  @override
  State<AddTodosScren> createState() => _AddTodosScrenState();
}

class _AddTodosScrenState extends State<AddTodosScren> with SnackBarMixin {
  final _formKey = GlobalKey<FormState>();

  final _titleTEC = TextEditingController();
  final _titleFN = FocusNode();

  final _descriptionTEC = TextEditingController();
  final _descrptionFN = FocusNode();

  final _todoDateTEC = TextEditingController();
  final _todoDateFN = FocusNode();

  late DateTime todoDate;

  @override
  void dispose() {
    _titleTEC.dispose();
    _titleFN.dispose();

    _descriptionTEC.dispose();
    _descrptionFN.dispose();

    _todoDateTEC.dispose();
    _todoDateFN.dispose();

    super.dispose();
  }

  Future<void> _addTodo() async {
    if (_formKey.currentState!.validate()) {
      final todoCtr1 = Provider.of<TodosController>(context, listen: false);
      final String? error = await todoCtr1.addTodo(ListaModel(
        title: _titleTEC.text,
        description: _descriptionTEC.text,
        cDate: todoDate,
      ));
      if (context.mounted) {
        if (error != null) {
          showSnackBar(error, context: context, isError: true);
        } else {
          Navigator.of(context).pop();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Criar Tarefa'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TitleTextInputWidget(
                  titleTEC: _titleTEC,
                  titleFN: _titleFN,
                  descriptionFN: _descrptionFN,
                ),
                const SizedBox(
                  height: 16,
                ),
                DescriptionTextInputWidget(
                  descriptionTEc: _descriptionTEC,
                  descriptionFN: _descrptionFN,
                  todoDateFN: _todoDateFN,
                ),
                const SizedBox(
                  height: 16,
                ),
                DateTextInputWidget(
                  setDate: (DateTime date) {
                    todoDate = date;
                  },
                  todoDateFN: _todoDateFN,
                  todoDateTEC: _todoDateTEC,
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text('Adcionar tarefa'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
