import 'package:flutter/material.dart';

class TodosScreen extends StatelessWidget {
  //Contrutor da classe
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo com um título
      appBar: AppBar(
        title: const Text("Lista de Tarefas"), // Título da barra superior
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(), // Corpo da tela
    );
  }
}
