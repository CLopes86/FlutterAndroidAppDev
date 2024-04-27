import 'package:flutter/material.dart';

import '../../../shared/models/lista_model.dart';
import '../widgets/lista_checkbox_widget.dart';
import '../widgets/lista_date_widget.dart';
import '../widgets/lista_title_description.dart';

final List<ListaModel> listas = [
  ListaModel(title: 'Titulo 1', description: 'Descrição 1'),
  ListaModel(title: 'Titulo 2', description: 'Descrição 2')
];

final class TodosScreen extends StatelessWidget {
  //Contrutor da classe
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo com um título
      appBar: AppBar(
        title: const Text("Lista de Tarefas"), // Título da barra superior
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listas.length,
        itemBuilder: (_, int index) {
          final ListaModel lista = listas[index];
          return Row(
            children: [
              ListaCheckboxWidget(lista),
              const SizedBox(
                width: 12,
              ),
              ListaTitleDescription(lista),
              ListaDateWidget(lista),
            ],
          );
        },
      ), // Corpo da tela
    );
  }
}
