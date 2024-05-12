import 'package:flutter/material.dart';

/// Widget para entrada de valor em formulários de transação.
class ValorFormField extends StatelessWidget {
  final Function(String) onSaved;

  const ValorFormField({Key? key, required this.onSaved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Valor'),
      keyboardType: TextInputType.number,
      onSaved: (value) => onSaved(value!),
      validator: (value) {
        if (value == null || value.isEmpty)
          return 'Por favor, insira um valor.';
        if (double.tryParse(value) == null)
          return 'Por favor, insira um número válido.';
        return null;
      },
    );
  }
}
