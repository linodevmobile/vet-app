enum ConsultationType {
  routine(label: 'Rutina'),
  surgery(label: 'Cirugía'),
  emergency(label: 'Urgencia');

  const ConsultationType({required this.label});

  final String label;
}
