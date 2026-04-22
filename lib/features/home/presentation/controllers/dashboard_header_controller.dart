import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/app/shared/utils/date_formatters.dart';
import 'package:vet_app/app/shared/utils/string_formatters.dart';
import 'package:vet_app/app/shared/utils/veterinarian_formatters.dart';
import 'package:vet_app/features/auth/presentation/controllers/current_user.dart';

part 'dashboard_header_controller.g.dart';

typedef DashboardHeader = ({
  String dateLabel,
  String greeting,
  String initials,
});

// Placeholder mientras `currentUser` resuelve; evita que el dashboard se renderice vacío.
const _placeholderSalutation = 'Doctor/a';
const _placeholderInitials = '··';

@riverpod
DashboardHeader dashboardHeader(Ref ref) {
  final user = ref.watch(currentUserProvider).value;
  final now = DateTime.now();
  final salute = _saluteForHour(now.hour);
  final rawDate = DateFormatters.format('EEEE · d MMM', now);

  final salutation = user == null
      ? _placeholderSalutation
      : VeterinarianFormatters.salutation(user);
  final initials = user == null
      ? _placeholderInitials
      : StringFormatters.initials(user.fullName);

  return (
    dateLabel: StringFormatters.capitalize(rawDate).toUpperCase(),
    greeting: '$salute, $salutation',
    initials: initials,
  );
}

String _saluteForHour(int hour) {
  if (hour < 12) return 'Buenos días';
  if (hour < 19) return 'Buenas tardes';
  return 'Buenas noches';
}
