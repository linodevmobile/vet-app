import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/app/shared/utils/date_formatters.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/appointments/presentation/controllers/today_appointments.dart';
import 'package:vet_app/features/consultations/presentation/controllers/recent_consultations.dart';
import 'package:vet_app/features/home/presentation/controllers/dashboard_header_controller.dart';
import 'package:vet_app/features/home/presentation/controllers/recent_patient_names.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_agenda_section.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_header_section.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_hospitalization_section.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_records_section.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_search_tile.dart';
import 'package:vet_app/features/hospitalization/presentation/controllers/active_hospitalizations.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final header = ref.watch(dashboardHeaderProvider);
    final suggestions = ref.watch(recentPatientNamesProvider);
    final appointments = ref.watch(todayAppointmentsProvider);
    final hospitalized = ref.watch(activeHospitalizationsProvider);
    final records = ref.watch(recentConsultationsProvider);

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
            onTap: () {
              // TODO(consultations): abrir detalle del registro.
            },
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
