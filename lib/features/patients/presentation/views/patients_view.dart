import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/app/shared/utils/date_formatters.dart';
import 'package:vet_app/design_system/atoms/ds_icon_button.dart';
import 'package:vet_app/design_system/molecules/ds_screen_header.dart';
import 'package:vet_app/design_system/organisms/ds_async_value.dart';
import 'package:vet_app/design_system/organisms/ds_toast.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/presentation/controllers/create_consultation_controller.dart';
import 'package:vet_app/features/consultation/presentation/controllers/resume_consultation_controller.dart';
import 'package:vet_app/features/consultation/presentation/sections/resume_consultation_sheet.dart';
import 'package:vet_app/features/consultations/presentation/controllers/in_progress_consultations.dart';
import 'package:vet_app/features/consultations/presentation/controllers/paused_consultations.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/presentation/controllers/all_patients.dart';
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
    // Watch dispara la carga del provider en el primer build; el tap consume
    // luego con `ref.read(...).value` y cae a "crear nueva" si aún no resolvió.
    ref.watch(inProgressConsultationsProvider);

    void openRegister() => context.push(AppRoutes.newPatient);
    Future<void> refresh() =>
        ref.read(allPatientsProvider.notifier).refresh();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                DsSpacing.lg,
                DsSpacing.md,
                DsSpacing.lg,
                DsSpacing.md,
              ),
              child: DsScreenHeader(
                title: 'Nueva consulta',
                onBack: () => _pop(context),
                trailing: DsIconButton(
                  icon: Icons.add,
                  onTap: openRegister,
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: refresh,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(
                    DsSpacing.lg,
                    0,
                    DsSpacing.lg,
                    DsSpacing.xxl,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const PatientSearchInput(),
                      const SizedBox(height: DsSpacing.md),
                      const PatientFilterChips(),
                      const SizedBox(height: DsSpacing.lg),
                      DsAsyncValue<List<Patient>>(
                        value: results,
                        onRetry: refresh,
                        data: (list) => _buildResults(
                          context,
                          ref,
                          list,
                          query,
                          openRegister,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResults(
    BuildContext context,
    WidgetRef ref,
    List<Patient> list,
    String query,
    VoidCallback onCreate,
  ) {
    if (list.isEmpty) {
      return PatientEmptyState(query: query, onCreate: onCreate);
    }
    final tiles = list
        .map(
          (p) => PatientResultTile(
            patient: p,
            lastVisitLabel: DateFormatters.relativeAgo(p.lastVisit),
            onTap: () => _onPatientTap(context, ref, p),
          ),
        )
        .toList();
    return PatientResultsSection(tiles: tiles);
  }

  // Tres caminos según estado previo del paciente:
  //  - paused → sheet con motivo/nota (resume vía controller).
  //  - in_progress huérfana → push directo a la existente (sin POST nuevo,
  //    sin sheet: no hay info de pausa que mostrar).
  //  - nada → POST de creación + push.
  // La navegación post-resume del branch paused la maneja el listener en
  // HomeView (vivo en el IndexedStack).
  Future<void> _onPatientTap(
    BuildContext context,
    WidgetRef ref,
    Patient p,
  ) async {
    final paused = (ref.read(pausedConsultationsProvider).value ?? const [])
        .where((pc) => pc.patient.id == p.id)
        .firstOrNull;

    if (paused != null) {
      // Modal no bloqueante — la confirmación dispara el resume controller.
      unawaited(
        showResumeConsultationSheet(
          context,
          patientName: paused.patient.name,
          reason: paused.reason,
          note: paused.note,
          pausedAt: paused.pausedAt,
          sectionsCompleted: paused.sectionsCompleted,
          sectionsTotal: paused.sectionsTotal,
          onConfirm: () => ref
              .read(resumeConsultationControllerProvider.notifier)
              .resume(paused.id),
        ),
      );
      return;
    }

    // Si hay >1 in_progress para el mismo paciente (residuos de errores
    // previos), tomamos la más reciente para que al menos arranque desde
    // el último intento del vet.
    final inProgress =
        (ref.read(inProgressConsultationsProvider).value ?? const [])
            .where((c) => c.patientId == p.id)
            .toList()
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    if (inProgress.isNotEmpty) {
      unawaited(
        context.push(
          AppRoutes.consultationNew,
          extra: (patient: p, consultationId: inProgress.first.id),
        ),
      );
      return;
    }

    // Crear la consulta vacía antes de navegar — el endpoint nuevo separa
    // creación de procesamiento de audio. La View consume el id desde
    // activeConsultationProvider que setea el create controller al éxito.
    await ref
        .read(createConsultationControllerProvider.notifier)
        .create(patientId: p.id);
    if (!context.mounted) return;
    final state = ref.read(createConsultationControllerProvider);
    state.maybeWhen(
      data: (id) {
        if (id == null) return;
        context.push(
          AppRoutes.consultationNew,
          extra: (patient: p, consultationId: id),
        );
      },
      error: (e, _) => DsToast.show(
        context,
        message: 'No se pudo crear la consulta: $e',
        variant: DsToastVariant.error,
      ),
      orElse: () {},
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
