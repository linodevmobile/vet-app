import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_primary_button.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/presentation/sections/pause_reason_tile.dart';

Future<void> showPauseConsultationSheet(
  BuildContext context, {
  required String patientName,
  required int sectionsCompleted,
  required int sectionsTotal,
  required void Function(ConsultationPauseReason reason, String? note)
      onConfirm,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) => PauseConsultationSheet(
      patientName: patientName,
      sectionsCompleted: sectionsCompleted,
      sectionsTotal: sectionsTotal,
      onCancel: () => Navigator.of(sheetContext).pop(),
      onConfirm: (reason, note) {
        Navigator.of(sheetContext).pop();
        onConfirm(reason, note);
      },
    ),
  );
}

class PauseConsultationSheet extends StatefulWidget {
  const PauseConsultationSheet({
    required this.patientName,
    required this.sectionsCompleted,
    required this.sectionsTotal,
    required this.onCancel,
    required this.onConfirm,
    super.key,
  });

  final String patientName;
  final int sectionsCompleted;
  final int sectionsTotal;
  final VoidCallback onCancel;
  final void Function(ConsultationPauseReason reason, String? note) onConfirm;

  @override
  State<PauseConsultationSheet> createState() =>
      _PauseConsultationSheetState();
}

class _PauseConsultationSheetState extends State<PauseConsultationSheet> {
  ConsultationPauseReason _reason = ConsultationPauseReason.labs;
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _submit() {
    final raw = _noteController.text.trim();
    widget.onConfirm(_reason, raw.isEmpty ? null : raw);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
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
                    'PAUSAR CONSULTA',
                    style: DsTypography.kicker.copyWith(
                      fontSize: 10,
                      color: DsColors.warn,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Guardar progreso de ${widget.patientName}',
                    style: DsTypography.titleLg,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'La consulta queda abierta en tu dashboard. '
                    'Puedes retomarla cuando los resultados estén listos.',
                    style: DsTypography.bodySm.copyWith(
                      fontSize: 12,
                      color: DsColors.ink60,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _ProgressPreservedCard(
                    completed: widget.sectionsCompleted,
                    total: widget.sectionsTotal,
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'MOTIVO DE PAUSA',
                    style: DsTypography.kicker.copyWith(
                      fontSize: 11,
                      color: DsColors.ink40,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: ConsultationPauseReason.values
                        .map<Widget>(
                          (r) => PauseReasonTile(
                            reason: r,
                            selected: _reason == r,
                            onTap: () => setState(() => _reason = r),
                          ),
                        )
                        .expand<Widget>(
                          (w) => [w, const SizedBox(height: 6)],
                        )
                        .toList()
                      ..removeLast(),
                  ),
                  const SizedBox(height: 10),
                  DsTextInput(
                    controller: _noteController,
                    hint: _reason.notePlaceholder,
                    minLines: 2,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: widget.onCancel,
                          child: const Text('Cancelar'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DsPrimaryButton(
                          label: 'Pausar',
                          icon: const Icon(Icons.pause, size: 16),
                          onPressed: _submit,
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

class _ProgressPreservedCard extends StatelessWidget {
  const _ProgressPreservedCard({
    required this.completed,
    required this.total,
  });

  final int completed;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: DsColors.surfaceAlt,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: DsColors.surface,
              borderRadius: BorderRadius.circular(DsRadii.r2),
            ),
            alignment: Alignment.center,
            child: Text(
              '$completed/$total',
              style: DsTypography.mono.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: DsColors.ink,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Progreso guardado',
                  style: DsTypography.titleSm.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 1),
                Text(
                  'Las $completed secciones completadas permanecen intactas',
                  style: DsTypography.bodySm.copyWith(
                    fontSize: 10,
                    color: DsColors.ink40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
