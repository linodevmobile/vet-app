enum ConsultationPauseReason {
  labs(
    wireValue: 'labs',
    label: 'Esperando laboratorios',
    hint: 'Hemograma, química, coprológico',
    notePlaceholder: 'Qué lab esperas?',
  ),
  imaging(
    wireValue: 'imaging',
    label: 'Esperando imagen',
    hint: 'Rx, ecografía, TAC',
    notePlaceholder: 'Qué estudio?',
  ),
  procedure(
    wireValue: 'procedure',
    label: 'Procedimiento en curso',
    hint: 'Sedación, curación, muestra',
    notePlaceholder: 'Qué procedimiento?',
  ),
  owner(
    wireValue: 'owner',
    label: 'Dueño ausente',
    hint: 'Salió a buscar algo, regresa luego',
    notePlaceholder: 'Qué fue a buscar?',
  ),
  other(
    wireValue: 'other',
    label: 'Otro motivo',
    hint: 'Describir abajo',
    notePlaceholder: 'Describe el motivo...',
  );

  const ConsultationPauseReason({
    required this.wireValue,
    required this.label,
    required this.hint,
    required this.notePlaceholder,
  });

  final String wireValue;
  final String label;
  final String hint;
  final String notePlaceholder;

  static ConsultationPauseReason fromWire(String value) {
    return ConsultationPauseReason.values.firstWhere(
      (r) => r.wireValue == value,
      orElse: () =>
          throw ArgumentError('Unknown consultation pause reason: $value'),
    );
  }
}
