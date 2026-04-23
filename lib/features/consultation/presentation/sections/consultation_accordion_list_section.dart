import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/default_text_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/exam_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/identification_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/labs_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/signature_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/consultation_accordion_section.dart';

typedef ExamControllers = ({
  TextEditingController temperature,
  TextEditingController heartRate,
  TextEditingController respRate,
  TextEditingController weight,
});

typedef DoctorHeader = ({String name, String registry});

class ConsultationAccordionListSection extends StatelessWidget {
  const ConsultationAccordionListSection({
    required this.values,
    required this.exam,
    required this.doctor,
    required this.active,
    required this.collapsed,
    required this.isFilled,
    required this.onToggle,
    required this.onFocus,
    super.key,
  });

  final Map<ConsultationSection, TextEditingController> values;
  final ExamControllers exam;
  final DoctorHeader doctor;
  final ConsultationSection active;
  final Set<ConsultationSection> collapsed;
  final bool Function(ConsultationSection) isFilled;
  final void Function(ConsultationSection) onToggle;
  final void Function(ConsultationSection) onFocus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: ConsultationSectionGroup.values
          .expand((group) => [
                _GroupHeader(label: group.label),
                ..._accordionsOf(group),
              ])
          .toList(),
    );
  }

  List<Widget> _accordionsOf(ConsultationSectionGroup group) {
    return group.sections
        .map(_accordionFor)
        .expand((widget) => [const SizedBox(height: DsSpacing.sm), widget])
        .skip(1)
        .toList();
  }

  Widget _accordionFor(ConsultationSection section) {
    return ConsultationAccordionSection(
      section: section,
      filled: isFilled(section),
      collapsed: collapsed.contains(section),
      active: active == section,
      onToggle: () => onToggle(section),
      onFocus: () => onFocus(section),
      child: _bodyFor(section),
    );
  }

  Widget? _bodyFor(ConsultationSection section) {
    final controller = values[section];
    if (controller == null) return null;
    return switch (section) {
      ConsultationSection.identification =>
        IdentificationBody(controller: controller),
      ConsultationSection.exam => ExamBody(
          temperature: exam.temperature,
          heartRate: exam.heartRate,
          respRate: exam.respRate,
          weight: exam.weight,
          notes: controller,
        ),
      ConsultationSection.labs => LabsBody(controller: controller),
      ConsultationSection.signature => SignatureBody(
          controller: controller,
          doctorName: doctor.name,
          doctorRegistry: doctor.registry,
        ),
      _ => DefaultTextBody(section: section, controller: controller),
    };
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 2),
      child: Text(
        label.toUpperCase(),
        style: DsTypography.kicker.copyWith(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          color: DsColors.ink40,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
