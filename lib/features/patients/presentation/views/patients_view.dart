import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/app/shared/utils/date_formatters.dart';
import 'package:vet_app/design_system/atoms/ds_icon_button.dart';
import 'package:vet_app/design_system/molecules/ds_screen_header.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/presentation/controllers/filtered_patients.dart';
import 'package:vet_app/features/patients/presentation/controllers/patient_search_query.dart';
import 'package:vet_app/features/patients/presentation/sections/patient_empty_state.dart';
import 'package:vet_app/features/patients/presentation/sections/patient_filter_chips.dart';
import 'package:vet_app/features/patients/presentation/sections/patient_result_tile.dart';
import 'package:vet_app/features/patients/presentation/sections/patient_results_section.dart';
import 'package:vet_app/features/patients/presentation/sections/patient_search_input.dart';

class PatientsView extends ConsumerWidget {
  const PatientsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(filteredPatientsProvider);
    final query = ref.watch(patientSearchQueryProvider);

    void openRegister() {
      // TODO(patients): pantalla de registro de paciente nuevo.
    }

    final tiles = results
        .map(
          (p) => PatientResultTile(
            patient: p,
            lastVisitLabel: DateFormatters.relativeAgo(p.lastVisit),
            onTap: () {
              // TODO(patients): abrir ficha del paciente.
            },
          ),
        )
        .toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            DsSpacing.lg,
            DsSpacing.md,
            DsSpacing.lg,
            DsSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DsScreenHeader(
                title: 'Nueva consulta',
                onBack: () => _pop(context),
                trailing: DsIconButton(
                  icon: Icons.add,
                  onTap: openRegister,
                ),
              ),
              const SizedBox(height: DsSpacing.lg),
              const PatientSearchInput(),
              const SizedBox(height: DsSpacing.md),
              const PatientFilterChips(),
              const SizedBox(height: DsSpacing.lg),
              if (tiles.isEmpty && query.isNotEmpty)
                PatientEmptyState(query: query, onCreate: openRegister)
              else
                PatientResultsSection(tiles: tiles),
            ],
          ),
        ),
      ),
    );
  }

  void _pop(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.today);
    }
  }
}
