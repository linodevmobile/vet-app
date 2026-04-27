import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_dashed_border.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/presentation/widgets/field_with_mic.dart';

class LabsBody extends StatelessWidget {
  const LabsBody({
    required this.controller,
    required this.isRecording,
    required this.onMicTap,
    this.micEnabled = true,
    this.onAttach,
    this.onChanged,
    this.onEditingComplete,
    super.key,
  });

  final TextEditingController controller;
  final bool isRecording;
  final VoidCallback onMicTap;
  final bool micEnabled;
  final VoidCallback? onAttach;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FieldWithMic(
          controller: controller,
          label: 'Exámenes solicitados / resultados',
          hint: 'Laboratorio, imagen…',
          isRecording: isRecording,
          micEnabled: micEnabled,
          onMicTap: onMicTap,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
        ),
        const SizedBox(height: DsSpacing.sm),
        _AttachButton(onTap: onAttach),
      ],
    );
  }
}

class _AttachButton extends StatelessWidget {
  const _AttachButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(DsRadii.r2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DsRadii.r2),
        child: DsDashedBorder(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add, size: 12, color: DsColors.ink60),
                const SizedBox(width: 6),
                Text(
                  'Adjuntar resultado (PDF, imagen)',
                  style: DsTypography.bodyMd.copyWith(
                    fontSize: 12,
                    color: DsColors.ink60,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
