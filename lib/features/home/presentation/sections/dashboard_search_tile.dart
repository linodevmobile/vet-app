import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class DashboardSearchTile extends StatelessWidget {
  const DashboardSearchTile({
    required this.suggestions,
    required this.onTap,
    super.key,
  });

  final List<String> suggestions;
  final VoidCallback onTap;

  String get _subtitle => [...suggestions, '+ nuevo'].join(' · ');

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DsColors.ink,
      borderRadius: BorderRadius.circular(DsRadii.r3),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DsRadii.r3),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DsSpacing.lg,
            vertical: 14,
          ),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(DsRadii.r2),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.search, size: 18, color: Colors.white),
              ),
              const SizedBox(width: DsSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Buscar paciente o iniciar consulta',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.55),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 16,
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
