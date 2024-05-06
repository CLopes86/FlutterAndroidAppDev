extension DateExtension on DateTime {
  String get formatDate {
    final String formattedday = day.toString().padLeft(2, '0');
    final String fornattedMonth = month.toString().padLeft(2, '0');
    final String formattedYear = year.toString();

    return '$formattedday/$fornattedMonth/$formattedYear';
  }
}
