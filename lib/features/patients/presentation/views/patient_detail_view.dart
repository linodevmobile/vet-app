import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/app/shared/utils/patient_formatters.dart';
import 'package:vet_app/design_system/molecules/ds_error_view.dart';
import 'package:vet_app/design_system/molecules/ds_loading_view.dart';
import 'package:vet_app/design_system/organisms/ds_toast.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/presentation/start_patient_consultation.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/presentation/controllers/patient_detail_controller.dart';
import 'package:vet_app/features/patients/presentation/sections/patient_detail_actions_section.dart';
import 'package:vet_app/features/patients/presentation/sections/patient_detail_header_section.dart';
import 'package:vet_app/features/patients/presentation/sections/patient_detail_hero_section.dart';
import 'package:vet_app/features/patients/presentation/sections/patient_detail_vitals_strip_section.dart';

class PatientDetailView extends ConsumerWidget {
  const PatientDetailView({required this.patientId, super.key});

  final String patientId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(patientDetailControllerProvider(patientId));

    return Scaffold(
      backgroundColor: DsColors.bg,
      body: SafeArea(
        child: detail.when(
          loading: () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PatientDetailHeaderSection(onBack: () => _back(context)),
              const Expanded(child: Center(child: DsLoadingView())),
            ],
          ),
          error: (e, _) => DsErrorView(
            message: 'No se pudo cargar el paciente: $e',
            onRetry: () => ref.invalidate(
              patientDetailControllerProvider(patientId),
            ),
          ),
          data: (p) => _Body(patient: p),
        ),
      ),
    );
  }
}

void _back(BuildContext context) {
  if (context.canPop()) {
    context.pop();
  } else {
    context.go(AppRoutes.today);
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PatientDetailHeaderSection(onBack: () => _back(context)),
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
                PatientDetailHeroSection(
                  species: patient.species,
                  name: patient.name,
                  identityLine: PatientFormatters.detailIdentityLine(patient),
                  ownerLine: PatientFormatters.detailOwnerLine(patient),
                  urgent: patient.isAlert,
                ),
                const SizedBox(height: DsSpacing.md),
                PatientDetailVitalsStripSection(
                  vitals: PatientFormatters.detailVitals(patient),
                ),
                const SizedBox(height: DsSpacing.md),
                PatientDetailActionsSection(
                  onNewConsultation: () =>
                      startPatientConsultation(context, ref, patient),
                  onHospitalize: () => DsToast.show(
                    context,
                    message: 'Hospitalización próximamente',
                    variant: DsToastVariant.error,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
