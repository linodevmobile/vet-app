enum ConsultationStatus {
  inProgress(wireValue: 'in_progress', label: 'En progreso'),
  paused(wireValue: 'paused', label: 'Pendiente de resultados'),
  signed(wireValue: 'signed', label: 'Firmada');

  const ConsultationStatus({required this.wireValue, required this.label});

  final String wireValue;
  final String label;

  static ConsultationStatus fromWire(String value) {
    return ConsultationStatus.values.firstWhere(
      (s) => s.wireValue == value,
      orElse: () => throw ArgumentError('Unknown consultation status: $value'),
    );
  }
}
