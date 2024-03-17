import 'package:flutter/material.dart';
import 'package:projeto1/custom_scalfold.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  @override
  Widget build(BuildContext context) {
    return const CustomScafold(
      child: Text('Esqueceu a Senha?'),
    );
  }
}
