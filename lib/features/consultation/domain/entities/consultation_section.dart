enum ConsultationSectionGroup {
  registro(label: 'Registro'),
  subjetivo(label: 'Subjetivo'),
  objetivo(label: 'Objetivo'),
  assessment(label: 'Assessment'),
  plan(label: 'Plan'),
  cierre(label: 'Cierre');

  const ConsultationSectionGroup({required this.label});

  final String label;
}

enum ConsultationSection {
  identification(
    n: '01',
    title: 'Identificación',
    hint: 'Paciente y propietario',
    group: ConsultationSectionGroup.registro,
    deferrable: false,
  ),
  anamnesis(
    n: '02',
    title: 'Anamnesis',
    hint: 'Historia clínica actual',
    group: ConsultationSectionGroup.subjetivo,
    deferrable: false,
  ),
  exam(
    n: '03',
    title: 'Examen físico',
    hint: 'Constantes + hallazgos',
    group: ConsultationSectionGroup.objetivo,
    deferrable: false,
  ),
  problems(
    n: '04',
    title: 'Lista de problemas',
    hint: 'Hallazgos clínicos detectados',
    group: ConsultationSectionGroup.objetivo,
    deferrable: false,
  ),
  differential(
    n: '05',
    title: 'Abordaje diagnóstico',
    hint: 'Diferenciales y razonamiento',
    group: ConsultationSectionGroup.assessment,
    deferrable: true,
  ),
  labs(
    n: '06',
    title: 'Exámenes complementarios',
    hint: 'Laboratorio, imagen',
    group: ConsultationSectionGroup.assessment,
    deferrable: true,
  ),
  diagnosis(
    n: '07',
    title: 'Diagnóstico clínico',
    hint: 'Presuntivo y definitivo',
    group: ConsultationSectionGroup.assessment,
    deferrable: true,
  ),
  plan(
    n: '08',
    title: 'Plan terapéutico',
    hint: 'Medicación y posología',
    group: ConsultationSectionGroup.plan,
    deferrable: true,
  ),
  prognosis(
    n: '09',
    title: 'Pronóstico y evolución',
    hint: 'Expectativa clínica',
    group: ConsultationSectionGroup.plan,
    deferrable: true,
  ),
  signature(
    n: '10',
    title: 'Observaciones y firma',
    hint: 'Firma hológrafa del profesional',
    group: ConsultationSectionGroup.cierre,
    deferrable: true,
  );

  const ConsultationSection({
    required this.n,
    required this.title,
    required this.hint,
    required this.group,
    required this.deferrable,
  });

  final String n;
  final String title;
  final String hint;
  final ConsultationSectionGroup group;
  final bool deferrable;
}

extension ConsultationSectionGroupX on ConsultationSectionGroup {
  List<ConsultationSection> get sections =>
      ConsultationSection.values.where((s) => s.group == this).toList();
}
