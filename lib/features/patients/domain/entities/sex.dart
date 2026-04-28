enum Sex {
  male(label: 'Macho'),
  female(label: 'Hembra');

  const Sex({required this.label});

  final String label;
}
