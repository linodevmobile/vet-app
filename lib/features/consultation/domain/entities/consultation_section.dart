enum ConsultationSection {
  reason(
    n: '01',
    title: 'Motivo de consulta',
    hint: 'Razón principal de la visita',
  ),
  anamnesis(
    n: '02',
    title: 'Anamnesis',
    hint: 'Historia y antecedentes',
  ),
  identification(
    n: '03',
    title: 'Identificación',
    hint: 'Paciente y propietario',
  ),
  food(
    n: '04',
    title: 'Tipo de alimento',
    hint: 'Régimen alimentario actual',
  ),
  vitals(
    n: '05',
    title: 'Signos vitales',
    hint: 'Temp · FC · FR · Peso',
  ),
  exam(
    n: '06',
    title: 'Examen físico',
    hint: 'Hallazgos estructurados',
  ),
  problems(
    n: '07',
    title: 'Lista de problemas',
    hint: 'Hallazgos clínicos',
  ),
  labs(
    n: '08',
    title: 'Exámenes complementarios',
    hint: 'Laboratorio, imagen',
  ),
  diagnosis(
    n: '09',
    title: 'Diagnóstico clínico',
    hint: 'Presuntivo y definitivo',
  ),
  recipe(
    n: '10',
    title: 'Receta',
    hint: 'Medicación y posología',
  ),
  treatment(
    n: '11',
    title: 'Tratamiento',
    hint: 'Modalidad de manejo',
  ),
  prognosis(
    n: '12',
    title: 'Pronóstico y evolución',
    hint: 'Expectativa clínica',
  ),
  signature(
    n: '13',
    title: 'Observaciones y firma',
    hint: 'Firma del profesional',
  );

  const ConsultationSection({
    required this.n,
    required this.title,
    required this.hint,
  });

  final String n;
  final String title;
  final String hint;
}
