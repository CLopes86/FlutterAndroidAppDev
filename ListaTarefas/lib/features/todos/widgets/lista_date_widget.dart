import 'package:flutter/material.dart';
import 'package:projeto1/shared/exetensions/date_extension.dart';
import 'package:projeto1/shared/models/lista_model.dart';
import 'package:projeto1/shared/widgets/texts/text_widget.dart';

// Widget que exibe a data de um item da lista de tarefas.
class ListaDateWidget extends StatelessWidget {
  // A propriedade `lista` contém os detalhes do item de tarefa, incluindo a data.
  final ListaModel lista;

// Construtor que recebe um modelo `ListaModel` e opcionalmente uma chave
  const ListaDateWidget(this.lista, {super.key});

  @override
  Widget build(BuildContext context) {
    // Utiliza um widget Padding para adicionar um espaço à esquerda do texto
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: TextWidget(
        lista.date.formatDate,
      ),
    );
  }
}
