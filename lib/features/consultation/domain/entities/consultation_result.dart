enum ConsultationResult {
  discharge(wireValue: 'discharge', label: 'Alta'),
  hospitalization(wireValue: 'hospitalization', label: 'Hospitalización'),
  deceased(wireValue: 'deceased', label: 'Fallecido'),
  referred(wireValue: 'referred', label: 'Derivado');

  const ConsultationResult({required this.wireValue, required this.label});

  final String wireValue;
  final String label;

  static ConsultationResult fromWire(String value) {
    return ConsultationResult.values.firstWhere(
      (r) => r.wireValue == value,
      orElse: () =>
          throw ArgumentError('Unknown consultation result: $value'),
    );
  }
}
