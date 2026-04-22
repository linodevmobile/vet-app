import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_primary_button.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class ConsultationSignBar extends StatelessWidget {
  const ConsultationSignBar({
    required this.completed,
    required this.total,
    required this.onOpenCompliance,
    required this.onSign,
    super.key,
  });

  final int completed;
  final int total;
  final VoidCallback onOpenCompliance;
  final VoidCallback onSign;

  @override
  Widget build(BuildContext context) {
    final canSign = completed >= total;
    final pending = total - completed;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            DsColors.bg.withValues(alpha: 0),
            DsColors.bg,
          ],
          stops: const [0, 0.3],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          DsSpacing.lg,
          DsSpacing.sm,
          DsSpacing.lg,
          DsSpacing.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ComplianceCard(
              completed: completed,
              total: total,
              pending: pending,
              canSign: canSign,
              onTap: onOpenCompliance,
            ),
            const SizedBox(height: DsSpacing.sm),
            DsPrimaryButton(
              label: canSign
                  ? 'Firmar y cerrar historia'
                  : 'Completa las 10 secciones para firmar',
              onPressed: canSign ? onSign : null,
              icon: Icon(
                canSign ? Icons.check : Icons.info_outline,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ComplianceCard extends StatelessWidget {
  const _ComplianceCard({
    required this.completed,
    required this.total,
    required this.pending,
    required this.canSign,
    required this.onTap,
  });

  final int completed;
  final int total;
  final int pending;
  final bool canSign;
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
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DsRadii.r3),
            border: Border.all(color: DsColors.line),
          ),
          child: Row(
            children: [
              _CountBadge(
                completed: completed,
                total: total,
                canSign: canSign,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      canSign
                          ? 'Historia completa · lista para firmar'
                          : 'Faltan $pending secciones obligatorias',
                      style: DsTypography.bodyMd.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'EXIGIDO POR COMVEZCOL · RES. 8430',
                      style: DsTypography.mono.copyWith(
                        fontSize: 10,
                        color: DsColors.ink40,
                        letterSpacing: 0.6,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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

class _CountBadge extends StatelessWidget {
  const _CountBadge({
    required this.completed,
    required this.total,
    required this.canSign,
  });

  final int completed;
  final int total;
  final bool canSign;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: canSign ? DsColors.ok : DsColors.surfaceAlt,
        borderRadius: BorderRadius.circular(DsRadii.r2),
      ),
      alignment: Alignment.center,
      child: Text(
        '$completed/$total',
        style: DsTypography.mono.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: canSign ? Colors.white : DsColors.ink80,
        ),
      ),
    );
  }
}
