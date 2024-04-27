import 'package:flutter/material.dart';
import 'package:projeto1/shared/models/lista_model.dart';
import 'package:projeto1/shared/widgets/texts/text_widget.dart';

class ListaTitleDescription extends StatelessWidget {
  final ListaModel lista;
  const ListaTitleDescription(this.lista, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            lista.title,
            cFontSize: 20,
          ),
          if (lista.description != null)
            TextWidget(
              lista.description!,
            ),
        ],
      ),
    );
  }
}
