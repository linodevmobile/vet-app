import 'package:intl/intl.dart';

abstract final class DateFormatters {
  static const _defaultLocale = 'es';

  static String format(
    String pattern,
    DateTime date, {
    String locale = _defaultLocale,
  }) =>
      DateFormat(pattern, locale).format(date);
}
