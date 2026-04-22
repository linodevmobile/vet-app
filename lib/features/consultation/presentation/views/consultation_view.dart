import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/design_system/molecules/ds_field_label.dart';
import 'package:vet_app/design_system/organisms/ds_toast.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/auth/presentation/controllers/current_user.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/default_text_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/exam_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/identification_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/labs_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/signature_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/consultation_accordion_section.dart';
import 'package:vet_app/features/consultation/presentation/sections/consultation_ai_bar.dart';
import 'package:vet_app/features/consultation/presentation/sections/consultation_compliance_sheet.dart';
import 'package:vet_app/features/consultation/presentation/sections/consultation_header_section.dart';
import 'package:vet_app/features/consultation/presentation/sections/consultation_sign_bar.dart';
import 'package:vet_app/features/consultation/presentation/sections/pause_consultation_sheet.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';

class ConsultationView extends ConsumerStatefulWidget {
  const ConsultationView({required this.patient, super.key});

  final Patient patient;

  @override
  ConsumerState<ConsultationView> createState() => _ConsultationViewState();
}

class _ConsultationViewState extends ConsumerState<ConsultationView> {
  static const List<ConsultationSection> _simpleTextSections = [
    ConsultationSection.anamnesis,
    ConsultationSection.problems,
    ConsultationSection.differential,
    ConsultationSection.diagnosis,
    ConsultationSection.plan,
    ConsultationSection.prognosis,
  ];

  final Set<ConsultationSection> _collapsed = {};
  final TextEditingController _motivoCtrl = TextEditingController();
  final TextEditingController _tempCtrl = TextEditingController();
  final TextEditingController _heartRateCtrl = TextEditingController();
  final TextEditingController _respRateCtrl = TextEditingController();
  final TextEditingController _weightCtrl = TextEditingController();
  final Map<ConsultationSection, TextEditingController> _values = {};
  ConsultationSection _active = ConsultationSection.anamnesis;
  bool _recording = false;

  @override
  void initState() {
    super.initState();
    final sectionsWithBody = [
      ConsultationSection.identification,
      ConsultationSection.exam,
      ConsultationSection.labs,
      ConsultationSection.signature,
      ..._simpleTextSections,
    ];
    for (final section in sectionsWithBody) {
      _values[section] = _makeController(section);
    }
  }

  TextEditingController _makeController(ConsultationSection section) {
    final initialText = switch (section) {
      ConsultationSection.identification => _prefillIdentification(),
      _ => '',
    };
    return TextEditingController(text: initialText)
      ..addListener(_onValueChanged);
  }

  String _prefillIdentification() {
    final p = widget.patient;
    return '${p.name} · ${p.breed} · ${p.ageYears} años · ${p.ownerName}';
  }

  @override
  void dispose() {
    _motivoCtrl.dispose();
    _tempCtrl.dispose();
    _heartRateCtrl.dispose();
    _respRateCtrl.dispose();
    _weightCtrl.dispose();
    for (final controller in _values.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onValueChanged() {
    if (mounted) setState(() {});
  }

  bool _isFilled(ConsultationSection section) =>
      _values[section]?.text.trim().isNotEmpty ?? false;

  int get _completedCount =>
      ConsultationSection.values.where(_isFilled).length;

  void _toggle(ConsultationSection s) {
    setState(() {
      if (!_collapsed.remove(s)) _collapsed.add(s);
    });
  }

  void _setActive(ConsultationSection s) {
    if (_active == s) return;
    setState(() => _active = s);
  }

  void _toggleRecording() {
    setState(() => _recording = !_recording);
  }

  Future<void> _openCompliance() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ConsultationComplianceSheet(
        sections: ConsultationSection.values,
        isFilled: _isFilled,
        onJump: _jumpToSection,
      ),
    );
  }

  void _jumpToSection(ConsultationSection section) {
    Navigator.of(context).pop();
    setState(() {
      _collapsed.remove(section);
      _active = section;
    });
  }

  Future<void> _openPauseSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => PauseConsultationSheet(
        patientName: widget.patient.name,
        sectionsCompleted: _completedCount,
        sectionsTotal: ConsultationSection.values.length,
        onCancel: () => Navigator.of(sheetContext).pop(),
        onConfirm: (reason, note) =>
            _confirmPause(sheetContext, reason, note),
      ),
    );
  }

  void _confirmPause(
    BuildContext sheetContext,
    ConsultationPauseReason reason,
    String? note,
  ) {
    Navigator.of(sheetContext).pop();
    DsToast.show(
      context,
      message: 'Consulta pausada · ${reason.label}',
      variant: DsToastVariant.success,
    );
    context.go(AppRoutes.today);
  }

  void _onSign() {
    context.go(AppRoutes.today);
  }

  void _back() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.patients);
    }
  }

  @override
  Widget build(BuildContext context) {
    final subtitle =
        '${widget.patient.breed} · ${widget.patient.ageYears} años';
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: DsColors.bg,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                ConsultationHeaderSection(
                  species: widget.patient.species,
                  patientName: widget.patient.name,
                  patientSubtitle: subtitle,
                  completed: _completedCount,
                  total: ConsultationSection.values.length,
                  onBack: _back,
                  onOpenChecklist: _openCompliance,
                  onPause: _openPauseSheet,
                  isUrgent: widget.patient.isAlert,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(
                      DsSpacing.lg,
                      DsSpacing.md,
                      DsSpacing.lg,
                      220,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DsFieldLabel(
                          label: 'Motivo de consulta',
                          child: DsTextInput(
                            controller: _motivoCtrl,
                            hint: 'Motivo principal de la consulta',
                          ),
                        ),
                        const SizedBox(height: DsSpacing.lg),
                        ..._buildAccordionList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (!keyboardOpen)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DsSpacing.lg,
                      ),
                      child: ConsultationAiBar(
                        recording: _recording,
                        sectionLabel: _active.title,
                        onToggle: _toggleRecording,
                      ),
                    ),
                    const SizedBox(height: DsSpacing.md),
                    ConsultationSignBar(
                      completed: _completedCount,
                      total: ConsultationSection.values.length,
                      onOpenCompliance: _openCompliance,
                      onSign: _onSign,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAccordionList() {
    return ConsultationSectionGroup.values
        .expand((group) => [
              _GroupHeader(label: group.label),
              ..._accordionsOf(group),
            ])
        .toList();
  }

  List<Widget> _accordionsOf(ConsultationSectionGroup group) {
    return group.sections
        .map(_accordionFor)
        .expand((widget) => [const SizedBox(height: DsSpacing.sm), widget])
        .skip(1)
        .toList();
  }

  Widget _accordionFor(ConsultationSection section) {
    return ConsultationAccordionSection(
      section: section,
      filled: _isFilled(section),
      collapsed: _collapsed.contains(section),
      active: _active == section,
      onToggle: () => _toggle(section),
      onFocus: () => _setActive(section),
      child: _bodyFor(section),
    );
  }

  Widget? _bodyFor(ConsultationSection section) {
    final controller = _values[section];
    if (controller == null) return null;
    return switch (section) {
      ConsultationSection.identification =>
        IdentificationBody(controller: controller),
      ConsultationSection.exam => ExamBody(
          temperature: _tempCtrl,
          heartRate: _heartRateCtrl,
          respRate: _respRateCtrl,
          weight: _weightCtrl,
          notes: controller,
        ),
      ConsultationSection.labs => LabsBody(controller: controller),
      ConsultationSection.signature => _signatureBody(controller),
      _ => DefaultTextBody(section: section, controller: controller),
    };
  }

  Widget _signatureBody(TextEditingController controller) {
    final user = ref.watch(currentUserProvider);
    return SignatureBody(
      controller: controller,
      doctorName: user.salutation,
      doctorRegistry: user.registry,
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 2),
      child: Text(
        label.toUpperCase(),
        style: DsTypography.kicker.copyWith(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          color: DsColors.ink40,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
