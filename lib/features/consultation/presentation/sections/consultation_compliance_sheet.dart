import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/presentation/sections/consultation_compliance_header.dart';
import 'package:vet_app/features/consultation/presentation/sections/consultation_compliance_row.dart';

Future<void> showConsultationComplianceSheet(
  BuildContext context, {
  required List<ConsultationSection> sections,
  required bool Function(ConsultationSection) isFilled,
  required ValueChanged<ConsultationSection> onJump,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) => ConsultationComplianceSheet(
      sections: sections,
      isFilled: isFilled,
      onJump: (section) {
        Navigator.of(sheetContext).pop();
        onJump(section);
      },
    ),
  );
}

class ConsultationComplianceSheet extends StatelessWidget {
  const ConsultationComplianceSheet({
    required this.sections,
    required this.isFilled,
    required this.onJump,
    super.key,
  });

  final List<ConsultationSection> sections;
  final bool Function(ConsultationSection) isFilled;
  final ValueChanged<ConsultationSection> onJump;

  @override
  Widget build(BuildContext context) {
    final completed = sections.where(isFilled).length;
    final total = sections.length;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.82,
      ),
      decoration: const BoxDecoration(
        color: DsColors.bg,
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
              padding: const EdgeInsets.fromLTRB(
                DsSpacing.lg,
                0,
                DsSpacing.lg,
                DsSpacing.xxl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ConsultationComplianceHeader(
                    completed: completed,
                    total: total,
                  ),
                  const SizedBox(height: DsSpacing.md),
                  ..._rows(),
                  const SizedBox(height: DsSpacing.md),
                  const _AiTip(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _rows() {
    return sections
        .map(
          (section) => ConsultationComplianceRow(
            section: section,
            completed: isFilled(section),
            onTap: () => onJump(section),
          ),
        )
        .expand<Widget>((row) => [row, const SizedBox(height: 4)])
        .toList()
      ..removeLast();
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

class _AiTip extends StatelessWidget {
  const _AiTip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: DsColors.aiSoft,
        borderRadius: BorderRadius.circular(DsRadii.r3),
        border: Border.all(color: DsColors.ai.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.auto_awesome, size: 16, color: DsColors.ai),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Puedes dictar cualquier sección con el micrófono. La IA '
              'reconoce el contexto y completa solo el campo activo. Nada '
              'se firma hasta que los 10 estén verificados.',
              style: DsTypography.bodyMd.copyWith(
                fontSize: 11,
                color: DsColors.ink80,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
