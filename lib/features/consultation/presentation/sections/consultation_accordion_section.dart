import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';

class ConsultationAccordionSection extends StatelessWidget {
  const ConsultationAccordionSection({
    required this.section,
    required this.filled,
    required this.collapsed,
    required this.active,
    required this.onToggle,
    required this.onFocus,
    this.child,
    super.key,
  });

  final ConsultationSection section;
  final bool filled;
  final bool collapsed;
  final bool active;
  final VoidCallback onToggle;
  final VoidCallback onFocus;
  final Widget? child;

  void _handleTap() {
    onFocus();
    onToggle();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        color: DsColors.surface,
        borderRadius: BorderRadius.circular(DsRadii.r3),
        border: Border.all(
          color: active ? DsColors.ink : DsColors.line,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(DsRadii.r3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: _handleTap,
              borderRadius: BorderRadius.circular(DsRadii.r3),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    _Badge(n: section.n, filled: filled),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            section.title,
                            style: DsTypography.titleSm.copyWith(
                              fontSize: 13,
                              letterSpacing: -0.1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            section.hint,
                            style: DsTypography.bodySm.copyWith(
                              fontSize: 11,
                              color: DsColors.ink40,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    if (!filled) ...[
                      const _PendingChip(),
                      const SizedBox(width: DsSpacing.sm),
                    ],
                    Icon(
                      collapsed
                          ? Icons.chevron_right
                          : Icons.keyboard_arrow_down,
                      size: 14,
                      color: DsColors.ink40,
                    ),
                  ],
                ),
              ),
            ),
            if (!collapsed && child != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: child,
              ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.n, required this.filled});

  final String n;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: filled ? DsColors.primary : DsColors.surfaceAlt,
        borderRadius: BorderRadius.circular(DsRadii.r2),
      ),
      alignment: Alignment.center,
      child: filled
          ? const Icon(Icons.check, size: 14, color: Colors.white)
          : Text(
              n,
              style: DsTypography.mono.copyWith(
                fontSize: 11,
                color: DsColors.ink60,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
              ),
            ),
    );
  }
}

class _PendingChip extends StatelessWidget {
  const _PendingChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DsRadii.r1),
        border: Border.all(color: DsColors.line),
      ),
      child: Text(
        'Pendiente',
        style: DsTypography.caption.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: DsColors.ink60,
        ),
      ),
    );
  }
}
