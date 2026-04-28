import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_dashed_border.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/presentation/widgets/field_with_mic.dart';

class SignatureBody extends StatelessWidget {
  const SignatureBody({
    required this.controller,
    required this.doctorName,
    required this.doctorRegistry,
    required this.isRecording,
    required this.onMicTap,
    this.micEnabled = true,
    this.isProcessing = false,
    this.recordingElapsed,
    this.onSign,
    this.onChanged,
    this.onEditingComplete,
    super.key,
  });

  final TextEditingController controller;
  final String doctorName;
  final String doctorRegistry;
  final bool isRecording;
  final VoidCallback onMicTap;
  final bool micEnabled;
  final bool isProcessing;
  final Duration? recordingElapsed;
  final VoidCallback? onSign;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FieldWithMic(
          controller: controller,
          label: 'Observaciones e indicaciones',
          hint: 'Observaciones generales, indicaciones al propietario…',
          isRecording: isRecording,
          isProcessing: isProcessing,
          recordingElapsed: recordingElapsed,
          micEnabled: micEnabled,
          onMicTap: onMicTap,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
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
