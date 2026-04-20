import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/domain/entities/patient_filter.dart';
import 'package:vet_app/features/patients/presentation/controllers/patient_filter_controller.dart';

class PatientFilterChips extends ConsumerWidget {
  const PatientFilterChips({super.key});

  static const double _height = 32;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(patientFilterControllerProvider);
    const values = PatientFilter.values;

    return SizedBox(
      height: _height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (context, i) {
          final filter = values[i];
          return _FilterChipButton(
            label: filter.label,
            isActive: filter == selected,
            onTap: () => ref
                .read(patientFilterControllerProvider.notifier)
                .select(filter),
          );
        },
      ),
    );
  }
}

class _FilterChipButton extends StatelessWidget {
  const _FilterChipButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive ? DsColors.ink : DsColors.surface,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: isActive ? DsColors.ink : DsColors.line,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1,
              color: isActive ? Colors.white : DsColors.ink80,
            ),
          ),
        ),
      ),
    );
  }
}
