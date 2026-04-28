import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vet_app/design_system/atoms/ds_dropdown.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_form_controller.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/section_options.dart';

class TreatmentBody extends ConsumerWidget {
  const TreatmentBody({required this.consultationId, super.key});

  final String consultationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      consultationFormControllerProvider(
        consultationId,
      ).select((s) => s.treatment),
    );
    return DsDropdown<String>(
      label: 'Modalidad',
      hint: 'Seleccionar…',
      value: value,
      options: SectionOptions.treatment,
      onChanged: ref
          .read(consultationFormControllerProvider(consultationId).notifier)
          .setTreatment,
    );
  }
}
