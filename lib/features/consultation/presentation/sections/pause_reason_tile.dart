import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';

class PauseReasonTile extends StatelessWidget {
  const PauseReasonTile({
    required this.reason,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final ConsultationPauseReason reason;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bg = selected ? DsColors.ink : DsColors.surface;
    final border = selected ? DsColors.ink : DsColors.line;
    final labelColor = selected ? Colors.white : DsColors.ink;
    final hintColor =
        selected ? Colors.white.withValues(alpha: 0.65) : DsColors.ink40;
    final radioBorder = selected ? Colors.white : DsColors.line;

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: border),
          ),
          child: Row(
            children: [
              _RadioDot(selected: selected, borderColor: radioBorder),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      reason.label,
                      style: DsTypography.titleSm.copyWith(
                        fontSize: 13,
                        color: labelColor,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      reason.hint,
                      style: DsTypography.bodySm.copyWith(
                        fontSize: 11,
                        color: hintColor,
                      ),
                    ),
                  ],
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
