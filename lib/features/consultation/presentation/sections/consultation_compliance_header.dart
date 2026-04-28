import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class ConsultationComplianceHeader extends StatelessWidget {
  const ConsultationComplianceHeader({
    required this.completed,
    required this.total,
    super.key,
  });

  final int completed;
  final int total;

  @override
  Widget build(BuildContext context) {
    final canSign = completed >= total;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'REQUISITO REGULATORIO',
                style: DsTypography.mono.copyWith(
                  fontSize: 10,
                  color: DsColors.ink40,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Historia clínica · Comvezcol',
                style: DsTypography.titleLg.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 2),
              Text(
                'Res. 8430 · Los 10 puntos son obligatorios.',
                style: DsTypography.bodyMd.copyWith(
                  fontSize: 11,
                  color: DsColors.ink60,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: DsSpacing.md),
        _ScoreCircle(
          completed: completed,
          total: total,
          canSign: canSign,
        ),
      ],
    );
  }
}

class _ScoreCircle extends StatelessWidget {
  const _ScoreCircle({
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
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: canSign ? DsColors.ok : DsColors.surface,
        border: Border.all(
          color: canSign ? DsColors.ok : DsColors.primary,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        '$completed/$total',
        style: DsTypography.mono.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: canSign ? Colors.white : DsColors.primary,
        ),
      ),
    );
  }
}
