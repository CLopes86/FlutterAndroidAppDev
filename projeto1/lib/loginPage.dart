import 'package:flutter/material.dart';
import 'package:projeto1/custom_scalfold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomScafold(
      child: Text('Entrar'),
    );
  }
}
