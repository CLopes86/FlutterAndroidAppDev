/// Importando pacotes necessários do Flutter e de terceiros.
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Função principal que inicia o aplicativo Flutter.
void main() {
  runApp(MyApp());
}

/// Classe principal do aplicativo.
class MyApp extends StatelessWidget {
  /// Construtor da classe `MyApp`.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 24, 79, 124)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

/// Classe de estado para gerenciar o estado do aplicativo.
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

/// Página principal do aplicativo.
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Scaffold(
      body: Column(
        children: [
          Text('A random AWESOME idea:'),
          BigCard(pair: pair),

          //Adcionando um botão
          ElevatedButton(
              onPressed: () {
                appState.getNext();
              },
              child: Text('Next'))
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(pair.asLowerCase),
      ),
    );
  }
}
