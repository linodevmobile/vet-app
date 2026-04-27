import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/ds_colors.dart';

class ConsultationSectionCard extends StatelessWidget {
  const ConsultationSectionCard({
    required this.n,
    required this.title,
    required this.hint,
    required this.filled,
    required this.expanded,
    required this.onToggle,
    required this.child,
    super.key,
  });

  final String n;
  final String title;
  final String hint;
  final bool filled;
  final bool expanded;
  final VoidCallback onToggle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: DsColors.surface,
        border: Border.all(color: DsColors.line),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: filled ? DsColors.primary : DsColors.surfaceAlt,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: filled
                        ? const Icon(Icons.check, size: 14, color: Colors.white)
                        : Text(
                            n,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: DsColors.ink60,
                            ),
                          ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: DsColors.ink,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          hint,
                          style: const TextStyle(
                            fontSize: 12,
                            color: DsColors.ink60,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 180),
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: DsColors.ink60,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: child,
            ),
            crossFadeState: expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 180),
          ),
        ],
      ),
    );
  }
}
