import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class IdentificationBody extends StatelessWidget {
  const IdentificationBody({
    required this.summary,
    super.key,
  });

  /// Línea preformateada con datos del paciente. Ej: "Thor · Golden Retriever
  /// · M · 4a · 28.4 kg". El formateo lo hace la View desde Patient.
  final String summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: DsColors.primarySoft,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check, size: 16, color: DsColors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Prellenado desde ficha. ',
                        style: DsTypography.bodyMd.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: DsColors.primary,
                        ),
                      ),
                      TextSpan(
                        text: 'Sincronizado con el registro permanente.',
                        style: DsTypography.bodyMd.copyWith(
                          fontSize: 12,
                          color: DsColors.ink80,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        if (summary.isNotEmpty)
          Text(
            summary,
            style: DsTypography.bodyMd.copyWith(
              fontSize: 14,
              color: DsColors.ink80,
            ),
          ),
      ],
    );
  }
}
