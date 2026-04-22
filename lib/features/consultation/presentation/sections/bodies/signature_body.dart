import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_dashed_border.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class SignatureBody extends StatelessWidget {
  const SignatureBody({
    required this.controller,
    required this.doctorName,
    required this.doctorRegistry,
    this.onSign,
    super.key,
  });

  final TextEditingController controller;
  final String doctorName;
  final String doctorRegistry;
  final VoidCallback? onSign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsTextInput(
          controller: controller,
          hint: 'Observaciones generales, indicaciones al propietario…',
          minLines: 2,
          maxLines: null,
          keyboardType: TextInputType.multiline,
        ),
        const SizedBox(height: 10),
        _SignatureCard(
          doctorName: doctorName,
          doctorRegistry: doctorRegistry,
          onSign: onSign,
        ),
      ],
    );
  }
}

class _SignatureCard extends StatelessWidget {
  const _SignatureCard({
    required this.doctorName,
    required this.doctorRegistry,
    this.onSign,
  });

  final String doctorName;
  final String doctorRegistry;
  final VoidCallback? onSign;

  @override
  Widget build(BuildContext context) {
    return DsDashedBorder(
      radius: 10,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: DsColors.surfaceAlt,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: DsColors.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: DsColors.line),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.edit_outlined,
                size: 18,
                color: DsColors.ink60,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    doctorName,
                    style: DsTypography.titleSm.copyWith(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    doctorRegistry,
                    style: DsTypography.mono.copyWith(
                      fontSize: 10,
                      color: DsColors.ink40,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: DsSpacing.sm),
            OutlinedButton(
              onPressed: onSign,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                minimumSize: const Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                textStyle: DsTypography.button.copyWith(fontSize: 12),
              ),
              child: const Text('Firmar'),
            ),
          ],
        ),
      ),
    );
  }
}
