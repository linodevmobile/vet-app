import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/domain/entities/sex.dart';
import 'package:vet_app/features/patients/presentation/controllers/sex_selection_controller.dart';

class AddPatientSexSelector extends ConsumerWidget {
  const AddPatientSexSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(sexSelectionControllerProvider);
    final notifier = ref.read(sexSelectionControllerProvider.notifier);

    return Row(
      children: Sex.values.map((s) {
        final isSelected = s == selected;
        final isLast = s == Sex.values.last;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : DsSpacing.sm),
            child: _SexChip(
              sex: s,
              selected: isSelected,
              onTap: () => notifier.select(s),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SexChip extends StatelessWidget {
  const _SexChip({
    required this.sex,
    required this.selected,
    required this.onTap,
  });

  final Sex sex;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = selected ? DsColors.ink : DsColors.surface;
    final fg = selected ? Colors.white : DsColors.ink;
    final border = selected ? DsColors.ink : DsColors.line;
    final icon = sex == Sex.male ? Icons.male : Icons.female;

    return InkWell(
      borderRadius: BorderRadius.circular(DsRadii.r2),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DsSpacing.sm,
          vertical: DsSpacing.md,
        ),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(DsRadii.r2),
          border: Border.all(color: border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: fg, size: 20),
            const SizedBox(width: DsSpacing.sm),
            Text(sex.label, style: DsTypography.titleSm.copyWith(color: fg)),
          ],
        ),
      ),
    );
  }
}
