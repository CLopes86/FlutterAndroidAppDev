import 'package:flutter/material.dart';
import 'home_controler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Primeira Liga',
          style: TextStyle(color: Colors.amberAccent),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext contexto, int i) {
          final times = _controller.times[i]; // Obter o time da lista
          return ListTile(
            leading: Image.asset(
              'assets/images/${times.logo}',
              fit: BoxFit.contain,
            ),
            title: Text(times.nome),
            trailing: Text(times.pontos.toString()),
          );
        },
        separatorBuilder: (_, __) => Divider(),
        padding: EdgeInsets.all(16),
        itemCount: _controller.times.length, // Usar o tamanho da lista de times
      ),
    );
  }
}
