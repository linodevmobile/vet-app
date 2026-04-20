import 'package:intl/intl.dart';

abstract final class DateFormatters {
  static const _defaultLocale = 'es';

  static String format(
    String pattern,
    DateTime date, {
    String locale = _defaultLocale,
  }) =>
      DateFormat(pattern, locale).format(date);

  static String relativeShort(DateTime date, {DateTime? now}) {
    final base = now ?? DateTime.now();
    final today = DateTime(base.year, base.month, base.day);
    final target = DateTime(date.year, date.month, date.day);
    final diffDays = today.difference(target).inDays;

    if (diffDays == 0) return 'Hoy ${format('HH:mm', date)}';
    if (diffDays == 1) return 'Ayer ${format('HH:mm', date)}';
    return format('d MMM', date);
  }

  static String relativeAgo(DateTime date, {DateTime? now}) {
    final base = now ?? DateTime.now();
    final today = DateTime(base.year, base.month, base.day);
    final target = DateTime(date.year, date.month, date.day);
    final diffDays = today.difference(target).inDays;

    if (diffDays <= 0) return 'Hoy';
    if (diffDays == 1) return 'Ayer';
    if (diffDays < 7) return 'Hace $diffDays días';
    if (diffDays < 30) {
      final weeks = diffDays ~/ 7;
      return weeks == 1 ? 'Hace 1 semana' : 'Hace $weeks semanas';
    }
    if (diffDays < 365) {
      final months = diffDays ~/ 30;
      return months == 1 ? 'Hace 1 mes' : 'Hace $months meses';
    }
    final years = diffDays ~/ 365;
    return years == 1 ? 'Hace 1 año' : 'Hace $years años';
  }
}
