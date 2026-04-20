enum PatientFilter {
  all(label: 'Todos'),
  todayAgenda(label: 'Hoy en agenda'),
  hospitalized(label: 'Hospitalizados'),
  favorites(label: 'Favoritos'),
  recent(label: 'Recientes');

  const PatientFilter({required this.label});

  final String label;
}
