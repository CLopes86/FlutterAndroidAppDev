import 'package:flutter/material.dart';

/// Botão para salvar formulários de transação.
class SaveButton extends StatelessWidget {
  final VoidCallback onSave;

  const SaveButton({Key? key, required this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSave,
      child: Text('Salvar Transação'),
    );
  }
}
