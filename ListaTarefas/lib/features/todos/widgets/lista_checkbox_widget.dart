import 'package:flutter/material.dart';
import 'package:projeto1/shared/models/lista_model.dart';

class ListaCheckboxWidget extends StatelessWidget {
  final ListaModel lista;
  const ListaCheckboxWidget(this.lista, {super.key});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: false,
      onChanged: (bool? isDone) => print(isDone),
    );
  }
}
