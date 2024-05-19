/// Extensão para a classe DateTime que adiciona um método de formatação de data.

extension DateExtension on DateTime {
  String get formatDate {
    final String formattedDay = day.toString().padLeft(2, '0');
    final String formattedMonth = month.toString().padLeft(2, '0');
    final String formattedYear = year.toString();

    return '$formattedDay/$formattedMonth/$formattedYear';
  }
}
