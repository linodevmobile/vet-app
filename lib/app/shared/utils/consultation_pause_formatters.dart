import 'package:vet_app/features/consultation/domain/consultation_constants.dart';

abstract final class ConsultationPauseFormatters {
  static String waitingLabel(DateTime pausedAt, {DateTime? now}) {
    final base = now ?? DateTime.now();
    final elapsed = base.difference(pausedAt);
    if (elapsed.isNegative) return '0m';

    final totalMinutes = elapsed.inMinutes;
    if (totalMinutes < 60) return '${totalMinutes}m';

    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;
    return '${hours}h ${minutes}m';
  }

  static bool isStale(DateTime pausedAt, {DateTime? now}) {
    final base = now ?? DateTime.now();
    return base.difference(pausedAt) >= ConsultationConstants.pauseStaleThreshold;
  }
}
