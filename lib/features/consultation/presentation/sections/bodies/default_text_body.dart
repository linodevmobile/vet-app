import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

class DefaultTextBody extends StatelessWidget {
  const DefaultTextBody({
    required this.section,
    required this.controller,
    super.key,
  });

  final ConsultationSection section;
  final TextEditingController controller;

  static const Map<ConsultationSection, String> _placeholders = {
    ConsultationSection.anamnesis:
        'Historia clínica actual, antecedentes, sintomatología…',
    ConsultationSection.problems:
        'Enumera los problemas detectados (uno por línea)…',
    ConsultationSection.differential:
        'Razonamiento clínico, diagnósticos diferenciales…',
    ConsultationSection.diagnosis:
        'Diagnóstico presuntivo y definitivo…',
    ConsultationSection.plan:
        'Tratamiento, medicación, posología…',
    ConsultationSection.prognosis:
        'Pronóstico esperado y evolución clínica observada…',
  };

  @override
  Widget build(BuildContext context) {
    return DsTextInput(
      controller: controller,
      hint: _placeholders[section],
      minLines: 4,
      maxLines: null,
      keyboardType: TextInputType.multiline,
    );
  }
}
