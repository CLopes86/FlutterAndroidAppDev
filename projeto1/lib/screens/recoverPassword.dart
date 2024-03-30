// ignore: file_names
import 'package:flutter/material.dart';

/// Tela para redefinir a senha esquecida.
class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

/// Estado da tela para redefinir a senha esquecida.
class _RecoverPasswordState extends State<RecoverPassword> {
  @override
  Widget build(BuildContext context) {
    return const Text(
        'Forget Password'); // Retorna um widget Text com o texto "Forget Password"
  }
}
