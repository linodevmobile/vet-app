import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vet_app/app/shared/utils/species_formatters.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';
import 'package:vet_app/features/patients/presentation/controllers/species_selection_controller.dart';
import 'package:vet_app/features/patients/presentation/sections/species_option_tile.dart';

class AddPatientSpeciesSelector extends ConsumerWidget {
  const AddPatientSpeciesSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(speciesSelectionControllerProvider);
    final notifier =
        ref.read(speciesSelectionControllerProvider.notifier);

    return Row(
      children: Species.values.map((s) {
        final tile = SpeciesOptionTile(
          species: s,
          label: SpeciesFormatters.label(s),
          selected: s == selected,
          onTap: () => notifier.select(s),
        );
        final isLast = s == Species.values.last;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : DsSpacing.sm),
            child: tile,
          ),
        );
      }).toList(),
    );
  }
}
