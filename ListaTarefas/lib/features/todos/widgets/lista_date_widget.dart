import 'package:flutter/material.dart';
import 'package:projeto1/shared/models/lista_model.dart';
import 'package:projeto1/shared/widgets/texts/text_widget.dart';

class ListaDateWidget extends StatelessWidget {
  final ListaModel lista;

  const ListaDateWidget(this.lista, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: TextWidget(
        lista.date.toIso8601String(),
      ),
    );
  }
}
