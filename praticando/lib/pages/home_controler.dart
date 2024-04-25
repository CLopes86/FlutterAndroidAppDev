import 'package:flutter/material.dart';
import '../models/time.dart'; // Importa model Time

class HomeController extends ChangeNotifier {
  /// Lista completa de equipas da Primeira Liga (2023/2024)
  final List<Time> times = [
    Time(
      nome: "Sporting Clube de Portugal",
      logo: "assets/images/sporting.jpg",
      pontos: 77,
      treinador: "Rúben Amorim",
    ),
    Time(
      nome: "Sport Lisboa e Benfica",
      logo: "assets/images/Benfica-Logo.png",
      pontos: 67,
      treinador: "Roger Schmidt",
    ),
    Time(
      nome: "Futebol Clube do Porto",
      logo: "assets/images/FCporto.png",
      pontos: 58,
      treinador: "Sérgio Conceição",
    ),
    Time(
      nome: "Sporting Clube de Braga",
      logo: "assets/images/braga.png",
      pontos: 56,
      treinador: "Artur Jorge",
    ),
    Time(
      nome: "Vitória Sport Clube",
      logo: "assets/images/vitoria.png",
      pontos: 53,
      treinador: "Moreno",
    ),
    Time(
      nome: "Moreirense Futebol Clube",
      logo: "assets/images/moreirense.png",
      pontos: 42,
      treinador: "Paulo Alves",
    ),
    Time(
      nome: "Futebol Clube de Arouca",
      logo: "assets/images/arouca.png",
      pontos: 37,
      treinador: "Armando Evangelista",
    ),
    Time(
      nome: "Futebol Clube de Famalicão",
      logo: "assets/images/famalicao.png",
      pontos: 31,
      treinador: "João Pedro Sousa",
    ),
    Time(
      nome: "Casa Pia Atlético Clube",
      logo: "assets/images/casapia.png",
      pontos: 30,
      treinador: "Filipe Martins",
    ),
    Time(
      nome: "Sporting Clube Farense",
      logo: "assets/images/farense.png",
      pontos: 19,
      treinador: "Cesaltino Lopes",
    ),
  ];

  // Notificar ouvintes sobre a atualização da lista
  notifyListeners();
}
