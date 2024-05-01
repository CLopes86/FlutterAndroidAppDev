import 'package:flutter/material.dart';
import 'package:projeto1/shared/models/lista_model.dart';

// Widget para apresentar um checkbox que representa um item da lista de tarefas.
class ListaCheckboxWidget extends StatelessWidget {
  // A propriedade `lista` contém os detalhes do item de tarefa.
  final ListaModel lista;

  // Construtor que recebe um modelo `ListaModel` e opcionalmente uma chave
  const ListaCheckboxWidget(this.lista, {super.key});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: false,
      onChanged: (bool? isDone) => print(isDone),
    );
  }
}
