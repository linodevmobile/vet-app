import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_icon_button.dart';
import 'package:vet_app/design_system/atoms/ds_pet_avatar.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

class ConsultationHeaderSection extends StatelessWidget {
  const ConsultationHeaderSection({
    required this.species,
    required this.patientName,
    required this.patientSubtitle,
    required this.completed,
    required this.total,
    required this.onBack,
    this.savedLabel,
    this.isUrgent = false,
    this.onOpenChecklist,
    super.key,
  });

  final Species species;
  final String patientName;
  final String patientSubtitle;
  final int completed;
  final int total;
  final VoidCallback onBack;
  final String? savedLabel;
  final bool isUrgent;
  final VoidCallback? onOpenChecklist;

  @override
  Widget build(BuildContext context) {
    final pct = total == 0 ? 0.0 : completed / total;
    final progressColor = pct >= 1 ? DsColors.ok : DsColors.primary;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: DsColors.surface,
        border: Border(bottom: BorderSide(color: DsColors.line)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          DsSpacing.lg,
          DsSpacing.md,
          DsSpacing.lg,
          10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                DsIconButton(
                  icon: Icons.arrow_back,
                  onTap: onBack,
                  size: 32,
                  iconSize: 14,
                ),
                const SizedBox(width: 10),
                DsPetAvatar(
                  species: species,
                  size: 32,
                  urgent: isUrgent,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _PatientBlock(
                    name: patientName,
                    subtitle: patientSubtitle,
                    savedLabel: savedLabel,
                  ),
                ),
                const SizedBox(width: DsSpacing.sm),
                _CompletedChip(
                  completed: completed,
                  total: total,
                  onTap: onOpenChecklist,
                ),
              ],
            ),
            const SizedBox(height: 10),
            _ProgressBar(pct: pct, color: progressColor),
          ],
        ),
      ),
    );
  }
}

class _PatientBlock extends StatelessWidget {
  const _PatientBlock({
    required this.name,
    required this.subtitle,
    this.savedLabel,
  });

  final String name;
  final String subtitle;
  final String? savedLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                name,
                style: DsTypography.titleSm,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                subtitle,
                style: DsTypography.bodySm.copyWith(
                  fontSize: 11,
                  color: DsColors.ink40,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if (savedLabel != null) ...[
          const SizedBox(height: 2),
          Text(
            savedLabel!,
            style: DsTypography.kicker.copyWith(
              fontSize: 10,
              color: DsColors.ok,
              letterSpacing: 0.6,
            ),
          ),
        ],
      ],
    );
  }
}

class _CompletedChip extends StatelessWidget {
  const _CompletedChip({
    required this.completed,
    required this.total,
    this.onTap,
  });

  final int completed;
  final int total;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DsColors.surface,
      borderRadius: BorderRadius.circular(DsRadii.pill),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DsRadii.pill),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DsRadii.pill),
            border: Border.all(color: DsColors.line),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$completed/$total',
                style: DsTypography.mono.copyWith(
                  fontSize: 11,
                  color: DsColors.ink80,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.keyboard_arrow_down,
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

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.pct, required this.color});

  final double pct;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Container(
        height: 3,
        color: DsColors.surfaceAlt,
        child: Align(
          alignment: Alignment.centerLeft,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: pct.clamp(0, 1)),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            builder: (_, value, __) => FractionallySizedBox(
              widthFactor: value,
              child: Container(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
