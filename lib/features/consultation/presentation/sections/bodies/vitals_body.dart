import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_mini_input.dart';

class VitalsBody extends StatelessWidget {
  const VitalsBody({
    required this.temp,
    required this.fc,
    required this.fr,
    required this.weight,
    super.key,
  });

  final TextEditingController temp;
  final TextEditingController fc;
  final TextEditingController fr;
  final TextEditingController weight;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DsMiniInput(controller: temp, label: 'Temp', unit: '°C'),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DsMiniInput(controller: fc, label: 'FC', unit: 'ppm'),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DsMiniInput(controller: fr, label: 'FR', unit: 'rpm'),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DsMiniInput(controller: weight, label: 'Peso', unit: 'kg'),
        ),
      ],
    );
  }
}
