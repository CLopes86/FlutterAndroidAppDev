import 'package:flutter/material.dart';
import 'package:projeto1/custom_scalfold.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomScafold(
      child: Text('Registar'),
    );
  }
}
