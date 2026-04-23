import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_primary_button.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_result.dart';

class SignConsultationSheet extends StatefulWidget {
  const SignConsultationSheet({
    required this.patientName,
    required this.initialSummary,
    required this.onCancel,
    required this.onConfirm,
    super.key,
  });

  final String patientName;
  final String initialSummary;
  final VoidCallback onCancel;
  final void Function(
    ConsultationResult result,
    String? summary,
    String? primaryDiagnosis,
  ) onConfirm;

  @override
  State<SignConsultationSheet> createState() => _SignConsultationSheetState();
}

class _SignConsultationSheetState extends State<SignConsultationSheet> {
  ConsultationResult _result = ConsultationResult.discharge;
  late final TextEditingController _summaryController =
      TextEditingController(text: widget.initialSummary);
  final TextEditingController _diagnosisController = TextEditingController();

  @override
  void dispose() {
    _summaryController.dispose();
    _diagnosisController.dispose();
    super.dispose();
  }

  void _submit() {
    final summary = _summaryController.text.trim();
    final diagnosis = _diagnosisController.text.trim();
    widget.onConfirm(
      _result,
      summary.isEmpty ? null : summary,
      diagnosis.isEmpty ? null : diagnosis,
    );
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
                    'FIRMAR Y CERRAR',
                    style: DsTypography.kicker.copyWith(
                      fontSize: 10,
                      color: DsColors.ok,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Cerrar historia de ${widget.patientName}',
                    style: DsTypography.titleLg,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Al firmar la consulta queda inmutable. '
                    'No podrás editar secciones después.',
                    style: DsTypography.bodySm.copyWith(
                      fontSize: 12,
                      color: DsColors.ink60,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'RESULTADO DE CONSULTA',
                    style: DsTypography.kicker.copyWith(
                      fontSize: 11,
                      color: DsColors.ink40,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: ConsultationResult.values
                        .map<Widget>(
                          (r) => _ResultTile(
                            result: r,
                            selected: _result == r,
                            onTap: () => setState(() => _result = r),
                          ),
                        )
                        .expand<Widget>(
                          (w) => [w, const SizedBox(height: 6)],
                        )
                        .toList()
                      ..removeLast(),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'RESUMEN CLÍNICO',
                    style: DsTypography.kicker.copyWith(
                      fontSize: 11,
                      color: DsColors.ink40,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 6),
                  DsTextInput(
                    controller: _summaryController,
                    hint: 'Resumen clínico (opcional)',
                    minLines: 3,
                    maxLines: 6,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'DIAGNÓSTICO PRINCIPAL',
                    style: DsTypography.kicker.copyWith(
                      fontSize: 11,
                      color: DsColors.ink40,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 6),
                  DsTextInput(
                    controller: _diagnosisController,
                    hint: 'Diagnóstico principal (opcional)',
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
                          label: 'Firmar',
                          icon: const Icon(Icons.check, size: 16),
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

class _ResultTile extends StatelessWidget {
  const _ResultTile({
    required this.result,
    required this.selected,
    required this.onTap,
  });

  final ConsultationResult result;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = selected ? DsColors.ink : DsColors.surface;
    final border = selected ? DsColors.ink : DsColors.line;
    final labelColor = selected ? Colors.white : DsColors.ink;
    final radioBorder = selected ? Colors.white : DsColors.line;

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: border),
          ),
          child: Row(
            children: [
              _RadioDot(selected: selected, borderColor: radioBorder),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  result.label,
                  style: DsTypography.titleSm.copyWith(
                    fontSize: 13,
                    color: labelColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  const _RadioDot({required this.selected, required this.borderColor});

  final bool selected;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 1.5),
      ),
      alignment: Alignment.center,
      child: selected
          ? Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
