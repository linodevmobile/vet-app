import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_dashed_border.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class LabsBody extends StatelessWidget {
  const LabsBody({
    required this.controller,
    this.onAttach,
    super.key,
  });

  final TextEditingController controller;
  final VoidCallback? onAttach;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsTextInput(
          controller: controller,
          hint: 'Exámenes solicitados y resultados…',
          minLines: 2,
          maxLines: null,
          keyboardType: TextInputType.multiline,
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
