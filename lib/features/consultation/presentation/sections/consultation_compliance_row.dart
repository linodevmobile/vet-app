import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

class ConsultationComplianceRow extends StatelessWidget {
  const ConsultationComplianceRow({
    required this.section,
    required this.completed,
    required this.onTap,
    super.key,
  });

  final ConsultationSection section;
  final bool completed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DsColors.surface,
      borderRadius: BorderRadius.circular(DsRadii.r3),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DsRadii.r3),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DsRadii.r3),
            border: Border.all(color: DsColors.line),
          ),
          child: Row(
            children: [
              _RowBadge(n: section.n, completed: completed),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      section.title,
                      style: DsTypography.bodyMd.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      completed ? 'COMPLETO' : 'PENDIENTE',
                      style: DsTypography.mono.copyWith(
                        fontSize: 10,
                        color: DsColors.ink40,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                size: 14,
                color: DsColors.ink40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RowBadge extends StatelessWidget {
  const _RowBadge({required this.n, required this.completed});

  final String n;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: completed ? DsColors.ok : DsColors.surfaceAlt,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: completed
          ? const Icon(Icons.check, size: 14, color: Colors.white)
          : Text(
              n,
              style: DsTypography.mono.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: DsColors.ink40,
              ),
            ),
    );
  }
}
