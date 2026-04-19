import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/app/shared/utils/date_formatters.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/appointments/presentation/controllers/today_appointments.dart';
import 'package:vet_app/features/home/presentation/controllers/dashboard_header_controller.dart';
import 'package:vet_app/features/home/presentation/controllers/recent_patient_names.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_agenda_section.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_header_section.dart';
import 'package:vet_app/features/home/presentation/sections/dashboard_search_tile.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final header = ref.watch(dashboardHeaderProvider);
    final suggestions = ref.watch(recentPatientNamesProvider);
    final appointments = ref.watch(todayAppointmentsProvider);

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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DsSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DashboardHeaderSection(
                dateLabel: header.dateLabel,
                greeting: header.greeting,
                initials: header.initials,
              ),
              const SizedBox(height: DsSpacing.xxl),
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
            ],
          ),
        ),
      ),
    );
  }
}
