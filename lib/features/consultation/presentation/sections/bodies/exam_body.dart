import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_dropdown.dart';
import 'package:vet_app/design_system/atoms/ds_mini_input.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/section_options.dart';
import 'package:vet_app/features/consultation/presentation/widgets/dehydration_slider.dart';
import 'package:vet_app/features/consultation/presentation/widgets/field_with_mic.dart';

class ExamBody extends StatelessWidget {
  const ExamBody({
    required this.mucosa,
    required this.onMucosaChanged,
    required this.dehydration,
    required this.onDehydrationChanged,
    required this.bcs,
    required this.onBcsChanged,
    required this.attitudeOwner,
    required this.onAttitudeOwnerChanged,
    required this.attitudeVet,
    required this.onAttitudeVetChanged,
    required this.systemsCtrl,
    required this.systemsRecording,
    required this.systemsMicEnabled,
    required this.onSystemsMic,
    required this.onSystemsBlur,
    required this.tllc,
    required this.trcp,
    required this.pulse,
    required this.onPulseChanged,
    this.systemsProcessing = false,
    this.systemsRecordingElapsed,
    super.key,
  });

  final String? mucosa;
  final ValueChanged<String> onMucosaChanged;
  final double dehydration;
  final ValueChanged<double> onDehydrationChanged;
  final String? bcs;
  final ValueChanged<String> onBcsChanged;
  final String? attitudeOwner;
  final ValueChanged<String> onAttitudeOwnerChanged;
  final String? attitudeVet;
  final ValueChanged<String> onAttitudeVetChanged;
  final TextEditingController systemsCtrl;
  final bool systemsRecording;
  final bool systemsMicEnabled;
  final bool systemsProcessing;
  final Duration? systemsRecordingElapsed;
  final VoidCallback onSystemsMic;
  final VoidCallback onSystemsBlur;
  final TextEditingController tllc;
  final TextEditingController trcp;
  final String? pulse;
  final ValueChanged<String> onPulseChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsDropdown<String>(
          label: 'Mucosas',
          hint: 'Seleccionar…',
          value: mucosa,
          options: SectionOptions.mucosa,
          onChanged: onMucosaChanged,
        ),
        const SizedBox(height: 12),
        DehydrationSlider(
          value: dehydration,
          onChanged: onDehydrationChanged,
        ),
        const SizedBox(height: 12),
        DsDropdown<String>(
          label: 'Condición corporal (WSAVA)',
          hint: 'Seleccionar…',
          value: bcs,
          options: SectionOptions.bcs,
          onChanged: onBcsChanged,
        ),
        const SizedBox(height: 12),
        DsDropdown<String>(
          label: 'Actitud con el propietario',
          hint: 'Seleccionar…',
          value: attitudeOwner,
          options: SectionOptions.attitude,
          onChanged: onAttitudeOwnerChanged,
        ),
        const SizedBox(height: 12),
        DsDropdown<String>(
          label: 'Actitud con el doctor',
          hint: 'Seleccionar…',
          value: attitudeVet,
          options: SectionOptions.attitude,
          onChanged: onAttitudeVetChanged,
        ),
        const SizedBox(height: 12),
        FieldWithMic(
          controller: systemsCtrl,
          label: 'Sistemas afectados',
          isRecording: systemsRecording,
          isProcessing: systemsProcessing,
          recordingElapsed: systemsRecordingElapsed,
          micEnabled: systemsMicEnabled,
          onMicTap: onSystemsMic,
          onEditingComplete: onSystemsBlur,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DsMiniInput(controller: tllc, label: 'TLLC', unit: 's'),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DsMiniInput(controller: trcp, label: 'TRCP', unit: 's'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        DsDropdown<String>(
          label: 'Pulso',
          hint: 'Seleccionar…',
          value: pulse,
          options: SectionOptions.pulse,
          onChanged: onPulseChanged,
        ),
      ],
    );
  }
}
