import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/ds_colors.dart';
import 'package:vet_app/features/consultation/presentation/widgets/mic_btn.dart';

class FieldWithMic extends StatelessWidget {
  const FieldWithMic({
    required this.controller,
    required this.label,
    required this.isRecording,
    required this.onMicTap,
    this.minLines = 2,
    this.maxLines = 6,
    this.hint,
    this.micEnabled = true,
    this.onChanged,
    this.onEditingComplete,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final bool isRecording;
  final VoidCallback onMicTap;
  final int minLines;
  final int maxLines;
  final String? hint;
  final bool micEnabled;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    final borderColor = isRecording ? DsColors.urgent : DsColors.ink20;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: DsColors.ink80,
                ),
              ),
            ),
            MicBtn(
              isRecording: isRecording,
              enabled: micEnabled,
              onTap: onMicTap,
            ),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          style: const TextStyle(fontSize: 14, color: DsColors.ink),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: DsColors.ink40),
            filled: true,
            fillColor: DsColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isRecording ? DsColors.urgent : DsColors.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
