import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/design_system/organisms/ds_toast.dart';
import 'package:vet_app/features/consultation/presentation/controllers/create_consultation_controller.dart';
import 'package:vet_app/features/consultation/presentation/controllers/resume_consultation_controller.dart';
import 'package:vet_app/features/consultation/presentation/sections/resume_consultation_sheet.dart';
import 'package:vet_app/features/consultations/presentation/controllers/in_progress_consultations.dart';
import 'package:vet_app/features/consultations/presentation/controllers/paused_consultations.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';

/// Punto de entrada único para "iniciar/continuar consulta" desde cualquier
/// vista que tenga el paciente. Tres caminos según estado previo:
///  - paused → resume sheet (reanuda y navega vía listener en HomeView).
///  - in_progress huérfana → push directo a la existente.
///  - nada → POST de creación + push.
Future<void> startPatientConsultation(
  BuildContext context,
  WidgetRef ref,
  Patient patient,
) async {
  final paused = (ref.read(pausedConsultationsProvider).value ?? const [])
      .where((pc) => pc.patient.id == patient.id)
      .firstOrNull;

  if (paused != null) {
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

  // Si quedaron varias in_progress por errores previos, tomamos la más
  // reciente para arrancar al menos desde el último intento.
  final inProgress =
      (ref.read(inProgressConsultationsProvider).value ?? const [])
          .where((c) => c.patientId == patient.id)
          .toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

  if (inProgress.isNotEmpty) {
    unawaited(
      context.push(
        AppRoutes.consultationNew,
        extra: (patient: patient, consultationId: inProgress.first.id),
      ),
    );
    return;
  }

  await ref
      .read(createConsultationControllerProvider.notifier)
      .create(patientId: patient.id);
  if (!context.mounted) return;
  final state = ref.read(createConsultationControllerProvider);
  state.maybeWhen(
    data: (id) {
      if (id == null) return;
      context.push(
        AppRoutes.consultationNew,
        extra: (patient: patient, consultationId: id),
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
