import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/app/shared/utils/veterinarian_formatters.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/design_system/molecules/ds_field_label.dart';
import 'package:vet_app/design_system/molecules/ds_loading_view.dart';
import 'package:vet_app/design_system/organisms/ds_toast.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/auth/presentation/controllers/current_user.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/presentation/controllers/active_consultation.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_recorder_controller.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_recorder_result.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_recorder_state.dart';
import 'package:vet_app/features/consultation/presentation/controllers/pause_consultation_controller.dart';
import 'package:vet_app/features/consultation/presentation/controllers/recorder_error_message.dart';
import 'package:vet_app/features/consultation/presentation/controllers/sign_consultation_controller.dart';
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
import 'package:vet_app/features/consultation/presentation/sections/sign_consultation_sheet.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';

class ConsultationView extends ConsumerStatefulWidget {
  const ConsultationView({required this.patient, super.key});

  final Patient patient;

  @override
  ConsumerState<ConsultationView> createState() => _ConsultationViewState();
}

class _ConsultationViewState extends ConsumerState<ConsultationView>
    with WidgetsBindingObserver {
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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
    WidgetsBinding.instance.removeObserver(this);
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Solo `paused` / `hidden` indican que la app pasó al background real.
    // `inactive` ocurre con diálogos del sistema (ej. prompt de permisos),
    // no se puede tratar como background — cortaría la grabación al instante.
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      ref.read(consultationRecorderControllerProvider.notifier).stop();
    }
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
    ref.read(consultationRecorderControllerProvider.notifier).toggle(
          section: _active,
          patientId: widget.patient.id,
          consultationId: ref.read(activeConsultationProvider),
        );
  }

  void _discardRecording() {
    ref.read(consultationRecorderControllerProvider.notifier).discard();
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
    final consultationId = ref.read(activeConsultationProvider);
    if (consultationId == null) {
      DsToast.show(
        context,
        message: 'Graba al menos una sección antes de pausar',
        variant: DsToastVariant.error,
      );
      return;
    }
    ref.read(pauseConsultationControllerProvider.notifier).pause(
          consultationId: consultationId,
          reason: reason,
          note: note,
        );
  }

  Future<void> _onSign() async {
    final consultationId = ref.read(activeConsultationProvider);
    if (consultationId == null) {
      DsToast.show(
        context,
        message: 'Graba al menos una sección antes de firmar',
        variant: DsToastVariant.error,
      );
      return;
    }
    final initialSummary =
        _values[ConsultationSection.signature]?.text.trim() ?? '';
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      builder: (sheetContext) => SignConsultationSheet(
        patientName: widget.patient.name,
        initialSummary: initialSummary,
        onCancel: () => Navigator.of(sheetContext).pop(),
        onConfirm: (result, summary, diagnosis) {
          Navigator.of(sheetContext).pop();
          ref.read(signConsultationControllerProvider.notifier).sign(
                consultationId: consultationId,
                result: result,
                summary: summary,
                primaryDiagnosis: diagnosis,
              );
        },
      ),
    );
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

    ref
      ..listen<AsyncValue<ConsultationRecorderState>>(
        consultationRecorderControllerProvider,
        (prev, next) {
          next.whenOrNull(
            error: (error, _) {
              DsToast.show(
                context,
                message: recorderErrorMessage(error),
                variant: DsToastVariant.error,
              );
            },
          );
        },
      )
      ..listen<ConsultationRecorderDelivery?>(
        consultationRecorderResultProvider,
        (prev, next) {
          if (next == null) return;
          if (prev?.seq == next.seq) return;
          final controller = _values[next.section];
          if (controller == null) return;
          controller.text = next.result.suggestedText;
        },
      )
      ..listen<AsyncValue<void>>(
        pauseConsultationControllerProvider,
        (prev, next) {
          next.whenOrNull(
            error: (error, _) => DsToast.show(
              context,
              message: 'No se pudo pausar: $error',
              variant: DsToastVariant.error,
            ),
            data: (_) {
              // El AsyncData(null) del build() inicial dispara sin este guard.
              if (prev is AsyncLoading) {
                DsToast.show(
                  context,
                  message: 'Consulta pausada',
                  variant: DsToastVariant.success,
                );
                context.go(AppRoutes.today);
              }
            },
          );
        },
      )
      ..listen<AsyncValue<void>>(
        signConsultationControllerProvider,
        (prev, next) {
          next.whenOrNull(
            error: (error, _) => DsToast.show(
              context,
              message: 'No se pudo firmar: $error',
              variant: DsToastVariant.error,
            ),
            data: (_) {
              if (prev is AsyncLoading) {
                DsToast.show(
                  context,
                  message: 'Consulta firmada',
                  variant: DsToastVariant.success,
                );
                context.go(AppRoutes.today);
              }
            },
          );
        },
      );

    final busy = ref.watch(pauseConsultationControllerProvider).isLoading ||
        ref.watch(signConsultationControllerProvider).isLoading;

    final recorderState =
        ref.watch(consultationRecorderControllerProvider).value ??
            const ConsultationRecorderState.idle();

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
                        state: recorderState,
                        sectionLabel: _active.title,
                        onToggle: _toggleRecording,
                        onDiscard: _discardRecording,
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
            if (busy)
              const Positioned.fill(
                child: ColoredBox(
                  color: Colors.black54,
                  child: DsLoadingView(),
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
    final user = ref.watch(currentUserProvider).value;
    final doctorName =
        user == null ? '' : VeterinarianFormatters.salutation(user);
    final doctorRegistry =
        user == null ? '' : VeterinarianFormatters.registry(user);
    return SignatureBody(
      controller: controller,
      doctorName: doctorName,
      doctorRegistry: doctorRegistry,
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
