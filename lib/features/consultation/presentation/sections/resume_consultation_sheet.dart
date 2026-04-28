import 'package:flutter/material.dart';
import 'package:vet_app/app/shared/utils/consultation_pause_formatters.dart';
import 'package:vet_app/design_system/atoms/ds_primary_button.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';

Future<void> showResumeConsultationSheet(
  BuildContext context, {
  required String patientName,
  required ConsultationPauseReason reason,
  required DateTime pausedAt,
  required int sectionsCompleted,
  required int sectionsTotal,
  required VoidCallback onConfirm,
  String? note,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) => ResumeConsultationSheet(
      patientName: patientName,
      reason: reason,
      note: note,
      pausedAt: pausedAt,
      sectionsCompleted: sectionsCompleted,
      sectionsTotal: sectionsTotal,
      onCancel: () => Navigator.of(sheetContext).pop(),
      onConfirm: () {
        Navigator.of(sheetContext).pop();
        onConfirm();
      },
    ),
  );
}

class ResumeConsultationSheet extends StatelessWidget {
  const ResumeConsultationSheet({
    required this.patientName,
    required this.reason,
    required this.pausedAt,
    required this.sectionsCompleted,
    required this.sectionsTotal,
    required this.onCancel,
    required this.onConfirm,
    this.note,
    super.key,
  });

  final String patientName;
  final ConsultationPauseReason reason;
  final String? note;
  final DateTime pausedAt;
  final int sectionsCompleted;
  final int sectionsTotal;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    final waitingLabel = ConsultationPauseFormatters.waitingLabel(pausedAt);

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      decoration: const BoxDecoration(
        color: DsColors.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DsRadii.r4),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _DragHandle(),
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 20 + bottomInset),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'REANUDAR CONSULTA',
                    style: DsTypography.kicker.copyWith(
                      fontSize: 10,
                      color: DsColors.primaryInk,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Continuar consulta de $patientName',
                    style: DsTypography.titleLg,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Al reanudar la consulta vuelve a estado "en progreso". '
                    'Las secciones grabadas se mantienen.',
                    style: DsTypography.bodySm.copyWith(
                      fontSize: 12,
                      color: DsColors.ink60,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _InfoCard(
                    reasonLabel: reason.label,
                    note: note,
                    waitingLabel: waitingLabel,
                    sectionsCompleted: sectionsCompleted,
                    sectionsTotal: sectionsTotal,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: onCancel,
                          child: const Text('Cancelar'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DsPrimaryButton(
                          label: 'Reanudar',
                          icon: const Icon(Icons.play_arrow, size: 16),
                          onPressed: onConfirm,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      margin: const EdgeInsets.only(top: 8, bottom: 14),
      decoration: BoxDecoration(
        color: DsColors.ink20,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.reasonLabel,
    required this.note,
    required this.waitingLabel,
    required this.sectionsCompleted,
    required this.sectionsTotal,
  });

  final String reasonLabel;
  final String? note;
  final String waitingLabel;
  final int sectionsCompleted;
  final int sectionsTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: DsColors.surfaceAlt,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _Row(label: 'Motivo', value: reasonLabel),
          if (note != null && note!.isNotEmpty) ...[
            const SizedBox(height: 6),
            _Row(label: 'Nota', value: note!),
          ],
          const SizedBox(height: 6),
          _Row(label: 'Esperando', value: waitingLabel),
          const SizedBox(height: 6),
          _Row(
            label: 'Progreso',
            value: '$sectionsCompleted/$sectionsTotal secciones',
          ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 72,
          child: Text(
            label.toUpperCase(),
            style: DsTypography.kicker.copyWith(
              fontSize: 10,
              color: DsColors.ink40,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: DsTypography.bodySm.copyWith(
              fontSize: 12,
              color: DsColors.ink,
            ),
          ),
        ),
      ],
    );
  }
}
