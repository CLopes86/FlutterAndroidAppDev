// lib/themes/app_theme.dart
import 'package:flutter/material.dart';

/// Classe AppTheme responsável por fornecer temas personalizados para o aplicativo.
class AppTheme {
  /// Retorna o tema claro para o aplicativo.
  static ThemeData get lightTheme {
    return ThemeData(
      // Define o esquema de cores para o tema claro.
      colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 96, 139,
            100), // Cor principal usada na AppBar e em outros elementos de destaque.
        onPrimary: Colors.white, // Cor do texto e ícones sobre a cor primária.
        secondary: Colors
            .amber, // Cor secundária usada para elementos de destaque menos predominantes.
        background:
            Colors.white, // Cor de fundo da maioria das áreas do aplicativo.
        onBackground: Colors.blueGrey, // Cor do texto sobre o fundo branco.
      ),

      // Configurações do tema da AppBar.
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey[900], // Cor de fundo da AppBar.
        titleTextStyle: const TextStyle(
          // Estilo de texto para o título da AppBar.
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      // Define o tema de texto para o aplicativo.
      textTheme: TextTheme(
        titleLarge: TextStyle(
          // Estilo para títulos grandes no aplicativo.
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey[900],
        ),
        bodyLarge: TextStyle(
          // Estilo para o corpo do texto grande.
          fontSize: 16,
          color: Colors.blueGrey[900],
        ),
      ),

      // Tema para botões elevados.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Colors.blueGrey[700]), // Cor de fundo dos botões elevados.
          foregroundColor: MaterialStateProperty.all(
              Colors.white), // Cor do texto e ícones nos botões.
        ),
      ),
    );
  }

  /// Retorna o tema escuro para o aplicativo.
  static ThemeData get darkTheme {
    return ThemeData(
      // Define o esquema de cores para o tema escuro.
      colorScheme: const ColorScheme.dark(
        primary: Colors
            .grey, // Cor principal usada na AppBar e em outros elementos de destaque.
        onPrimary: Colors.white, // Cor do texto e ícones sobre a cor primária.
        secondary: Colors
            .red, // Cor secundária usada para elementos de destaque menos predominantes.
        background:
            Colors.black, // Cor de fundo da maioria das áreas do aplicativo.
        onBackground: Colors.white, // Cor do texto sobre o fundo preto.
      ),

      // Configurações do tema da AppBar.
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[850], // Cor de fundo da AppBar.
        titleTextStyle: const TextStyle(
          // Estilo de texto para o título da AppBar.
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      // Define o tema de texto para o aplicativo.
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          // Estilo para títulos grandes no aplicativo.
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          // Estilo para o corpo do texto grande.
          fontSize: 16,
          color: Colors.white,
        ),
      ),

      // Tema para botões elevados.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Colors.grey[850]), // Cor de fundo dos botões elevados.
          foregroundColor: MaterialStateProperty.all(
              Colors.white), // Cor do texto e ícones nos botões.
        ),
      ),
    );
  }
}
