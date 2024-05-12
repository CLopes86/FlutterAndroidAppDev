import 'package:flutter/material.dart';

/// Widget para entrada de título em formulários de transação.

class TituloFormulario extends StatelessWidget {
  final Function(String) onSaved;

  const TituloFormulario({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Titulo'),
      onSaved: (value) => onSaved(value!),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Por favor insira um titulo';
      },
    );
  }
}
