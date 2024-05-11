import 'package:flutter/material.dart';

/// Um widget de diálogo de confirmação genérico que pode ser reutilizado em várias partes do aplicativo.
/// Ele exibe um diálogo modal com opções para confirmar ou cancelar uma ação.

class DialogoConfirmacao extends StatelessWidget {
  final BuildContext context; //Contexto onde o dialogo é chamado
  final String titulo; //Titulo do dialogo
  final String conteudo; //Mensagem de conteudo do dialogo
  final VoidCallback onConfirm; //Callback para a açao de comfiirmação
  final VoidCallback onCancel; //Callback para a açao de camcelamemto

  const DialogoConfirmacao({
    super.key,
    required this.context,
    required this.titulo,
    required this.conteudo,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titulo), //Define o titulo
      content: Text(conteudo), //Define o conteudo textual do dialogo
      actions: <Widget>[
        TextButton(
          child: Text('Não'), // Botão para cancelar a ação.
          onPressed: onCancel, // Executa a função de cancelamento.
        ),
        TextButton(
          child: Text('Sim'), // Botão para confirmar a ação.
          onPressed: onConfirm, // Executa a função de confirmação.
        ),
      ],
    );
  }
}
