import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class IdentificationBody extends StatelessWidget {
  const IdentificationBody({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _PrefillBanner(),
        const SizedBox(height: 10),
        DsTextInput(
          controller: controller,
          minLines: 2,
          maxLines: null,
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }
}

class _PrefillBanner extends StatelessWidget {
  const _PrefillBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: DsColors.primarySoft,
        borderRadius: BorderRadius.circular(DsRadii.r2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(Icons.check, size: 14, color: DsColors.primary),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text.rich(
              TextSpan(
                style: DsTypography.bodyMd.copyWith(
                  fontSize: 12,
                  color: DsColors.primaryInk,
                ),
                children: const [
                  TextSpan(
                    text: 'Prellenado desde ficha. ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: 'Datos sincronizados con el registro permanente '
                        'del paciente.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
