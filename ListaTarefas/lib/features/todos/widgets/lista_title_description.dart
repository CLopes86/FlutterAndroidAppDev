import 'package:flutter/material.dart';
import 'package:projeto1/shared/models/lista_model.dart';
import 'package:projeto1/shared/widgets/texts/text_widget.dart';

// Widget que exibe o título e a descrição de um item da lista de tarefas.
class ListaTitleDescription extends StatelessWidget {
  // A propriedade `lista` contém os detalhes do item de tarefa, incluindo título e descrição.
  final ListaModel lista;

  // Construtor que recebe um modelo `ListaModel` e opcionalmente uma chave.
  const ListaTitleDescription(this.lista, {super.key});

  @override
  Widget build(BuildContext context) {
    // O widget Expanded permite que este widget preencha o espaço disponível
    // em seu widget pai flexível (como Row ou Column).
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
