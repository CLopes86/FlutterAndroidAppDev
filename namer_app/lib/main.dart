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
  /// Palavra aleatoria atualmente exibida.
  var current = WordPair.random();

  /// Obtém a próxima palavra aleatória, notifica os ouvintes sobre a mudança
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  /// Lista de palavras favoritas do usuário.
  var favorites = <WordPair>[];

  /// Método para alternar o status de favorito para a palavra atual.
  ///
  /// Se a palavra atual já estiver na lista de favoritos, ela será removida.
  /// Caso contrário, será adicionada à lista de favoritos.
  /// O método também notifica os ouvintes sobre a mudança no estado.
  void toggleFavorite() {
    if (favorites.contains(current)) {
      // Se a palavra já está nos favoritos, remova-a.
      favorites.remove(current);
    } else {
      // Se a palavra não está nos favoritos, adicione-a.
      favorites.add(current);
    }
    // Notifique os ouvintes sobre a mudança no estado.
    notifyListeners();
  }
}

/// Página principal do aplicativo.
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair),
            SizedBox(height: 12),

            //Adcionando um botão
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      appState.getNext();
                    },
                    child: Text('Next')),
              ],
            )
          ],
        ),
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
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
