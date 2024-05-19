import 'package:flutter/material.dart';
import 'package:gestor_gastos/widgets/texto_stilo.dart';

/// Widget para entrada de valor em formulários de transação.

class EditarFormulario extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final void Function()? onTap;
  final bool readOnly;

  const EditarFormulario({
    required this.controller,
    required this.focusNode,
    required this.label,
    this.validator,
    required this.keyboardType,
    this.onTap,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      style: const TextStyle(
        color: Colors.blue,
      ),
      decoration: InputDecoration(
        label: TextoStyle(label),
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
