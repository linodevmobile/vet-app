import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vet_app/design_system/atoms/ds_dropdown.dart';
import 'package:vet_app/design_system/atoms/ds_mini_input.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_form_controller.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/section_options.dart';
import 'package:vet_app/features/consultation/presentation/widgets/dehydration_slider.dart';
import 'package:vet_app/features/consultation/presentation/widgets/field_with_mic.dart';

class ExamBody extends ConsumerWidget {
  const ExamBody({
    required this.consultationId,
    required this.systemsCtrl,
    required this.systemsRecording,
    required this.systemsMicEnabled,
    required this.onSystemsMic,
    required this.onSystemsBlur,
    required this.tllc,
    required this.trcp,
    this.systemsProcessing = false,
    this.systemsRecordingElapsed,
    super.key,
  });

  final String consultationId;
  final TextEditingController systemsCtrl;
  final bool systemsRecording;
  final bool systemsMicEnabled;
  final bool systemsProcessing;
  final Duration? systemsRecordingElapsed;
  final VoidCallback onSystemsMic;
  final VoidCallback onSystemsBlur;
  final TextEditingController tllc;
  final TextEditingController trcp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(consultationFormControllerProvider(consultationId));
    final notifier = ref.read(
      consultationFormControllerProvider(consultationId).notifier,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DsDropdown<String>(
          label: 'Mucosas',
          hint: 'Seleccionar…',
          value: form.mucosa,
          options: SectionOptions.mucosa,
          onChanged: notifier.setMucosa,
        ),
        const SizedBox(height: 12),
        DehydrationSlider(
          value: form.dehydration,
          onChanged: notifier.setDehydration,
        ),
        const SizedBox(height: 12),
        DsDropdown<String>(
          label: 'Condición corporal (WSAVA)',
          hint: 'Seleccionar…',
          value: form.bcs,
          options: SectionOptions.bcs,
          onChanged: notifier.setBcs,
        ),
        const SizedBox(height: 12),
        DsDropdown<String>(
          label: 'Actitud con el propietario',
          hint: 'Seleccionar…',
          value: form.attitudeOwner,
          options: SectionOptions.attitude,
          onChanged: notifier.setAttitudeOwner,
        ),
        const SizedBox(height: 12),
        DsDropdown<String>(
          label: 'Actitud con el doctor',
          hint: 'Seleccionar…',
          value: form.attitudeVet,
          options: SectionOptions.attitude,
          onChanged: notifier.setAttitudeVet,
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
          value: form.pulse,
          options: SectionOptions.pulse,
          onChanged: notifier.setPulse,
        ),
      ],
    );
  }
}
