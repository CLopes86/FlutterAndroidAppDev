import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto1/features/todos/controllers/todos_controller.dart';
import 'package:projeto1/features/todos/screens/todos_screen.dart';
import 'package:projeto1/shared/services/local_storage/listas_local_storage_service.dart';
import 'package:projeto1/shared/services/local_storage/local_store_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// MyApp é um widget sem estado que configura aspectos visuais e de localização da aplicação.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodosController(
        ListasLocalStorageService(
          LocalStorageService(),
        ),
      ),
      child: MaterialApp(
        title: 'Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.lightBlueAccent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.lightBlueAccent,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        home: const TodosScreen(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt', 'pt_PT')],
      ),
    );
  }
}
