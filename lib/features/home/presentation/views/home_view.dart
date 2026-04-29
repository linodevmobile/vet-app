import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/app/shared/utils/consultation_pause_formatters.dart';
import 'package:vet_app/app/shared/utils/date_formatters.dart';
import 'package:vet_app/design_system/organisms/ds_toast.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/appointments/presentation/controllers/today_appointments.dart';
import 'package:vet_app/features/consultation/presentation/controllers/resume_consultation_controller.dart';
import 'package:vet_app/features/consultation/presentation/sections/resume_consultation_sheet.dart';
import 'package:vet_app/features/consultations/presentation/controllers/paused_consultations.dart';
import 'package:vet_app/features/consultations/presentation/controllers/recent_consultations.dart';
import 'package:vet_app/features/home/presentation/controllers/dashboard_header_controller.dart';
import 'package:vet_app/features/home/presentation/controllers/recent_patient_names.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_agenda_section.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_header_section.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_hospitalization_section.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_in_progress_section.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_records_section.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_search_tile.dart';
import 'package:vet_app/features/hospitalization/presentation/controllers/active_hospitalizations.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<String?>>(
      resumeConsultationControllerProvider,
      (prev, next) {
        next.whenOrNull(
          error: (e, _) => DsToast.show(
            context,
            message: 'No se pudo reanudar: $e',
            variant: DsToastVariant.error,
          ),
          data: (id) {
            // El AsyncData(null) del build() inicial no dispara acá por el guard.
            if (prev is AsyncLoading && id != null) {
              ref.invalidate(pausedConsultationsProvider);
              context.push(AppRoutes.consultationById(id));
            }
          },
        );
      },
    );

    final header = ref.watch(dashboardHeaderProvider);
    final suggestions = ref.watch(recentPatientNamesProvider);
    final appointments =
        ref.watch(todayAppointmentsProvider).value ?? const [];
    final hospitalized = ref.watch(activeHospitalizationsProvider);
    final paused = ref.watch(pausedConsultationsProvider).value ?? const [];
    final records = ref.watch(recentConsultationsProvider).value ?? const [];

    final agendaRows = appointments
        .map(
          (a) => AppointmentRow(
            time: DateFormatters.format('HH:mm', a.scheduledAt),
            appointment: a,
            onTap: () {
              // TODO(consultation): navegar al flujo de consulta del paciente.
            },
          ),
        )
        .toList();

    final recordRows = records
        .take(4)
        .map(
          (r) => RecordRow(
            record: r,
            whenLabel: DateFormatters.relativeShort(r.performedAt),
            onTap: () => context.push(AppRoutes.patientById(r.patient.id)),
          ),
        )
        .toList();

    final pausedRows = paused
        .map(
          (p) => PausedRow(
            species: p.patient.species,
            patientName: p.patient.name,
            waitingLabel: ConsultationPauseFormatters.waitingLabel(p.pausedAt),
            status: p.note == null
                ? p.reason.label
                : '${p.reason.label} — ${p.note}',
            sectionsCompleted: p.sectionsCompleted,
            sectionsTotal: p.sectionsTotal,
            isStale: ConsultationPauseFormatters.isStale(p.pausedAt),
            onTap: () => showResumeConsultationSheet(
              context,
              patientName: p.patient.name,
              reason: p.reason,
              note: p.note,
              pausedAt: p.pausedAt,
              sectionsCompleted: p.sectionsCompleted,
              sectionsTotal: p.sectionsTotal,
              onConfirm: () => ref
                  .read(resumeConsultationControllerProvider.notifier)
                  .resume(p.id),
            ),
          ),
        )
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                DsSpacing.lg,
                DsSpacing.lg,
                DsSpacing.lg,
                DsSpacing.md,
              ),
              child: DashboardHeaderSection(
                dateLabel: header.dateLabel,
                greeting: header.greeting,
                initials: header.initials,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  DsSpacing.lg,
                  DsSpacing.md,
                  DsSpacing.lg,
                  DsSpacing.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DashboardSearchTile(
                      suggestions: suggestions,
                      onTap: () => context.go(AppRoutes.patients),
                    ),
                    const SizedBox(height: DsSpacing.xl),
                    DashboardAgendaSection(
                      rows: agendaRows,
                      onSeeAll: () {
                        // TODO(agenda): pantalla de agenda completa.
                      },
                    ),
                    const SizedBox(height: DsSpacing.xl),
                    DashboardHospitalizationSection(
                      patients: hospitalized,
                      onPatientTap: (_) {
                        // TODO(hospitalization): abrir ficha del paciente hospitalizado.
                      },
                    ),
                    if (pausedRows.isNotEmpty) ...[
                      const SizedBox(height: DsSpacing.xl),
                      DashboardInProgressSection(rows: pausedRows),
                    ],
                    const SizedBox(height: DsSpacing.xl),
                    DashboardRecordsSection(rows: recordRows),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
