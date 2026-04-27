import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vet_app/design_system/atoms/ds_dropdown.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_form_controller.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/section_options.dart';

class FoodBody extends ConsumerWidget {
  const FoodBody({required this.consultationId, super.key});

  final String consultationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      consultationFormControllerProvider(consultationId).select((s) => s.food),
    );
    return DsDropdown<String>(
      label: 'Régimen alimentario',
      hint: 'Seleccionar…',
      value: value,
      options: SectionOptions.food,
      onChanged: ref
          .read(consultationFormControllerProvider(consultationId).notifier)
          .setFood,
    );
  }
}
