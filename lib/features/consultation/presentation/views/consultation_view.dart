import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/app/shared/utils/patient_formatters.dart';
import 'package:vet_app/app/shared/utils/veterinarian_formatters.dart';
import 'package:vet_app/design_system/molecules/ds_error_view.dart';
import 'package:vet_app/design_system/molecules/ds_loading_view.dart';
import 'package:vet_app/design_system/organisms/ds_toast.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/auth/presentation/controllers/current_user.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_pause_reason.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/presentation/controllers/active_consultation.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_detail_controller.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_form_controller.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_form_state.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_process_controller.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_processing_section.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_recorder_controller.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_recorder_state.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_sync_controller.dart';
import 'package:vet_app/features/consultation/presentation/controllers/pause_consultation_controller.dart';
import 'package:vet_app/features/consultation/presentation/controllers/recorder_error_message.dart';
import 'package:vet_app/features/consultation/presentation/controllers/sign_consultation_controller.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/exam_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/food_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/identification_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/labs_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/signature_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/treatment_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/bodies/vitals_body.dart';
import 'package:vet_app/features/consultation/presentation/sections/consultation_compliance_sheet.dart';
import 'package:vet_app/features/consultation/presentation/sections/consultation_header_section.dart';
import 'package:vet_app/features/consultation/presentation/sections/consultation_sign_bar.dart';
import 'package:vet_app/features/consultation/presentation/sections/pause_consultation_sheet.dart';
import 'package:vet_app/features/consultation/presentation/sections/sign_consultation_sheet.dart';
import 'package:vet_app/features/consultation/presentation/widgets/consultation_section_card.dart';
import 'package:vet_app/features/consultation/presentation/widgets/field_with_mic.dart';
import 'package:vet_app/features/consultations/presentation/controllers/in_progress_consultations.dart';
import 'package:vet_app/features/consultations/presentation/controllers/paused_consultations.dart';
import 'package:vet_app/features/consultations/presentation/controllers/recent_consultations.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/entities/species.dart';

const _audioTextSections = <ConsultationSection>{
  ConsultationSection.reason,
  ConsultationSection.anamnesis,
  ConsultationSection.problems,
  ConsultationSection.diagnosis,
  ConsultationSection.recipe,
  ConsultationSection.prognosis,
};

const _allTextBearingSections = <ConsultationSection>{
  ..._audioTextSections,
  ConsultationSection.exam,
  ConsultationSection.labs,
  ConsultationSection.signature,
};

class ConsultationView extends ConsumerStatefulWidget {
  const ConsultationView({required this.consultationId, this.patient, super.key});

  final Patient? patient;
  final String consultationId;

  @override
  ConsumerState<ConsultationView> createState() => _ConsultationViewState();
}

class _ConsultationViewState extends ConsumerState<ConsultationView>
    with WidgetsBindingObserver {
  final Map<ConsultationSection, TextEditingController> _textCtrls = {};
  final TextEditingController _tempCtrl = TextEditingController();
  final TextEditingController _fcCtrl = TextEditingController();
  final TextEditingController _frCtrl = TextEditingController();
  final TextEditingController _weightCtrl = TextEditingController();
  final TextEditingController _tllcCtrl = TextEditingController();
  final TextEditingController _trcpCtrl = TextEditingController();

  final Set<ConsultationSection> _collapsed = {};

  Consultation? _resumedFrom;
  bool _hydrated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    for (final s in _allTextBearingSections) {
      final ctrl = TextEditingController()..addListener(_redraw);
      // signature queda fuera del bridge: local-only, persiste solo al firmar.
      if (s != ConsultationSection.signature) {
        ctrl.addListener(() => _bridgeText(s, ctrl.text));
      }
      _textCtrls[s] = ctrl;
    }
    for (final c in _miniCtrls) {
      c.addListener(_redraw);
    }
    _tempCtrl.addListener(() => _formNotifier.setTemperatureC(_tempCtrl.text));
    _fcCtrl.addListener(() => _formNotifier.setHeartRateBpm(_fcCtrl.text));
    _frCtrl.addListener(
      () => _formNotifier.setRespiratoryRateRpm(_frCtrl.text),
    );
    _weightCtrl.addListener(
      () => _formNotifier.setWeightKg(_weightCtrl.text),
    );
    _tllcCtrl.addListener(() => _formNotifier.setTllcSeconds(_tllcCtrl.text));
    _trcpCtrl.addListener(() => _formNotifier.setTrcpSeconds(_trcpCtrl.text));
    // Modo nueva consulta: arranca con todas las secciones colapsadas excepto
    // Motivo (la primera). En resume se abren todas para revisión.
    if (widget.patient != null) {
      for (final s in ConsultationSection.values) {
        if (s != ConsultationSection.reason) _collapsed.add(s);
      }
      // El provider es auto-dispose y nadie lo watcheó durante la navegación.
      Future.microtask(() {
        if (!mounted) return;
        ref
            .read(activeConsultationProvider.notifier)
            .setId(widget.consultationId);
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    for (final c in _textCtrls.values) {
      c.dispose();
    }
    for (final c in _miniCtrls) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Solo `paused` / `hidden` indican background real. `inactive` ocurre con
    // diálogos del sistema y cortaría la grabación al instante.
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      ref.read(consultationRecorderControllerProvider.notifier).stop();
      // Best-effort: si el OS mata la app, la request ya salió.
      _formNotifier.flushAll();
    }
  }

  List<TextEditingController> get _miniCtrls => [
        _tempCtrl,
        _fcCtrl,
        _frCtrl,
        _weightCtrl,
        _tllcCtrl,
        _trcpCtrl,
      ];

  void _redraw() {
    if (mounted) setState(() {});
  }

  // Resuelto fresco en cada uso para no quedar con notifier rancio si el
  // provider se invalidara entre callbacks.
  ConsultationFormController get _formNotifier => ref.read(
    consultationFormControllerProvider(widget.consultationId).notifier,
  );

  // Bridge de texto: para `exam` el contenido del FieldWithMic es el sub-campo
  // `systems_affected`, no un payload de texto plano de la sección.
  void _bridgeText(ConsultationSection section, String text) {
    if (section == ConsultationSection.exam) {
      _formNotifier.setSystemsAffected(text);
    } else {
      _formNotifier.setText(section, text);
    }
  }

  String get _patientName =>
      widget.patient?.name ?? _resumedFrom?.patient.name ?? '';
  Species get _species =>
      widget.patient?.species ?? _resumedFrom?.patient.species ?? Species.dog;
  String get _patientSubtitle {
    final p = widget.patient;
    if (p != null) return '${p.breed} · ${p.ageYears} años';
    return '';
  }
  bool get _isUrgent => widget.patient?.isAlert ?? false;

  String get _identificationSummary {
    final p = widget.patient;
    if (p != null) return PatientFormatters.identificationLine(p);
    final r = _resumedFrom?.patient;
    if (r == null) return '';
    return PatientFormatters.identificationLineFromSummary(r);
  }

  bool _isFilled(ConsultationSection s, ConsultationFormState form) {
    switch (s) {
      case ConsultationSection.identification:
        return _patientName.isNotEmpty;
      case ConsultationSection.food:
        return form.food != null;
      case ConsultationSection.vitals:
        return _tempCtrl.text.isNotEmpty &&
            _fcCtrl.text.isNotEmpty &&
            _frCtrl.text.isNotEmpty &&
            _weightCtrl.text.isNotEmpty;
      case ConsultationSection.exam:
        // Per design: filled cuando los 3 dropdowns clave tienen valor.
        return form.mucosa != null && form.bcs != null && form.pulse != null;
      case ConsultationSection.treatment:
        return form.treatment != null;
      // Resto: secciones de texto libre — filled si el textarea tiene algo.
      // ignore: no_default_cases
      default:
        return _textCtrls[s]?.text.trim().isNotEmpty ?? false;
    }
  }

  int _completedCount(ConsultationFormState form) =>
      ConsultationSection.values.where((s) => _isFilled(s, form)).length;
  int get _totalSections => ConsultationSection.values.length;

  void _toggle(ConsultationSection s) {
    setState(() {
      if (!_collapsed.remove(s)) _collapsed.add(s);
    });
  }

  void _toggleRecording(ConsultationSection section) {
    ref
        .read(consultationRecorderControllerProvider.notifier)
        .toggle(section: section);
  }

  Future<void> _openCompliance() {
    final form = ref.read(
      consultationFormControllerProvider(widget.consultationId),
    );
    return showConsultationComplianceSheet(
      context,
      sections: ConsultationSection.values,
      isFilled: (s) => _isFilled(s, form),
      onJump: (s) => setState(() => _collapsed.remove(s)),
    );
  }

  Future<void> _openPauseSheet() {
    final form = ref.read(
      consultationFormControllerProvider(widget.consultationId),
    );
    return showPauseConsultationSheet(
      context,
      patientName: _patientName,
      sectionsCompleted: _completedCount(form),
      sectionsTotal: _totalSections,
      onConfirm: _confirmPause,
    );
  }

  Future<void> _confirmPause(
    ConsultationPauseReason reason,
    String? note,
  ) async {
    final consultationId = ref.read(activeConsultationProvider);
    if (consultationId == null) return;
    // Drena el debounce antes de pausar: si no, el PATCH /pause puede llegar
    // antes que el último cambio del doc.
    await _formNotifier.flushAll();
    if (!mounted) return;
    // El estado del pause lo observa la View vía ref.listen.
    unawaited(
      ref
          .read(pauseConsultationControllerProvider.notifier)
          .pause(consultationId: consultationId, reason: reason, note: note),
    );
  }

  Future<void> _onSign() async {
    final consultationId = ref.read(activeConsultationProvider);
    if (consultationId == null) {
      DsToast.show(
        context,
        message: 'Empezá la consulta antes de firmar',
        variant: DsToastVariant.error,
      );
      return;
    }
    await showSignConsultationSheet(
      context,
      patientName: _patientName,
      initialSummary:
          _textCtrls[ConsultationSection.signature]?.text.trim() ?? '',
      onConfirm: (result, summary, diagnosis) async {
        // La consulta queda inmutable tras firmar — drenamos antes para que
        // ninguna edición pendiente del debounce se pierda.
        await _formNotifier.flushAll();
        if (!mounted) return;
        // El estado del sign lo observa la View vía ref.listen.
        unawaited(
          ref
              .read(signConsultationControllerProvider.notifier)
              .sign(
                consultationId: consultationId,
                result: result,
                summary: summary,
                primaryDiagnosis: diagnosis,
              ),
        );
      },
    );
  }

  void _back() {
    if (_shouldWarnOnBack) {
      _openPauseSheet();
      return;
    }
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.patients);
    }
  }

  // La consulta se crea upfront en in_progress; salir sin pausar la deja colgada.
  bool get _shouldWarnOnBack =>
      ref.read(activeConsultationProvider) != null;

  void _attachListeners() {
    ref
      ..listen<AsyncValue<ConsultationRecorderState>>(
        consultationRecorderControllerProvider,
        _onRecorderChange,
      )
      ..listen<AsyncValue<ConsultationProcessSuggestion?>>(
        consultationProcessControllerProvider,
        _onProcessChange,
      )
      ..listen<AsyncValue<void>>(
        pauseConsultationControllerProvider,
        _onPauseChange,
      )
      ..listen<AsyncValue<void>>(
        signConsultationControllerProvider,
        _onSignChange,
      )
      ..listen<AsyncValue<void>>(
        consultationSyncControllerProvider,
        _onSyncChange,
      );
    if (widget.patient == null) {
      ref.listen<AsyncValue<Consultation>>(
        consultationDetailControllerProvider(widget.consultationId),
        _onConsultationDetailChange,
      );
    }
  }

  void _onConsultationDetailChange(
    AsyncValue<Consultation>? prev,
    AsyncValue<Consultation> next,
  ) {
    next.whenOrNull(data: _hydrateFromConsultation);
  }

  void _hydrateFromConsultation(Consultation c) {
    if (_hydrated) return;
    // Form state es la fuente de verdad; primero lo llenamos desde backend.
    _formNotifier.hydrate(c);
    final form = ref.read(
      consultationFormControllerProvider(widget.consultationId),
    );
    // Luego volcamos los TextEditingController desde el form (no desde
    // sc.text directo, porque para `exam` ese campo es el render, no lo que
    // el doc edita en el FieldWithMic). Las listeners de los controllers
    // disparan setters pero los guards idempotentes los hacen no-op.
    for (final s in _allTextBearingSections) {
      if (s == ConsultationSection.exam) {
        _textCtrls[s]?.text = form.systemsAffected ?? '';
      } else if (s == ConsultationSection.signature) {
        // Local-only: backend no devuelve esta sección.
        continue;
      } else {
        _textCtrls[s]?.text = form.texts[s] ?? '';
      }
    }
    _tempCtrl.text = form.temperatureC ?? '';
    _fcCtrl.text = form.heartRateBpm ?? '';
    _frCtrl.text = form.respiratoryRateRpm ?? '';
    _weightCtrl.text = form.weightKg ?? '';
    _tllcCtrl.text = form.tllcSeconds ?? '';
    _trcpCtrl.text = form.trcpSeconds ?? '';
    ref.read(activeConsultationProvider.notifier).setId(c.id);
    setState(() {
      _resumedFrom = c;
      _hydrated = true;
    });
  }

  void _onRecorderChange(
    AsyncValue<ConsultationRecorderState>? prev,
    AsyncValue<ConsultationRecorderState> next,
  ) {
    next.whenOrNull(
      error: (error, _) => DsToast.show(
        context,
        message: recorderErrorMessage(error),
        variant: DsToastVariant.error,
      ),
    );
  }

  void _onProcessChange(
    AsyncValue<ConsultationProcessSuggestion?>? prev,
    AsyncValue<ConsultationProcessSuggestion?> next,
  ) {
    next.whenOrNull(
      error: (error, _) => DsToast.show(
        context,
        message: 'No se pudo procesar el audio: $error',
        variant: DsToastVariant.error,
      ),
      data: (sug) {
        if (sug == null) return;
        if (prev?.value?.seq == sug.seq) return;
        final ctrl = _textCtrls[sug.section];
        if (ctrl == null) return;
        ctrl.text = sug.outcome.suggestedText;
        // El listener del controller ya bridgeó al form state; flush para
        // mandar inmediato y no esperar el debounce.
        _formNotifier.flushSection(sug.section);
      },
    );
  }

  void _onSyncChange(AsyncValue<void>? prev, AsyncValue<void> next) {
    next.whenOrNull(
      error: (error, _) => DsToast.show(
        context,
        message: 'No se pudo guardar: $error',
        variant: DsToastVariant.error,
      ),
    );
  }

  void _onPauseChange(AsyncValue<void>? prev, AsyncValue<void> next) {
    next.whenOrNull(
      error: (error, _) => DsToast.show(
        context,
        message: 'No se pudo pausar: $error',
        variant: DsToastVariant.error,
      ),
      data: (_) {
        if (prev is AsyncLoading) {
          ref
            ..invalidate(pausedConsultationsProvider)
            ..invalidate(inProgressConsultationsProvider);
          DsToast.show(
            context,
            message: 'Consulta pausada',
            variant: DsToastVariant.success,
          );
          context.go(AppRoutes.today);
        }
      },
    );
  }

  void _onSignChange(AsyncValue<void>? prev, AsyncValue<void> next) {
    next.whenOrNull(
      error: (error, _) => DsToast.show(
        context,
        message: 'No se pudo firmar: $error',
        variant: DsToastVariant.error,
      ),
      data: (_) {
        if (prev is AsyncLoading) {
          ref
            ..invalidate(pausedConsultationsProvider)
            ..invalidate(inProgressConsultationsProvider)
            ..invalidate(recentConsultationsProvider);
          DsToast.show(
            context,
            message: 'Consulta firmada',
            variant: DsToastVariant.success,
          );
          context.go(AppRoutes.today);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    _attachListeners();

    final activeConsultationId = ref.watch(activeConsultationProvider);
    final hasActiveConsultation = activeConsultationId != null;

    // Watch incondicional: el provider es auto-dispose, y si solo se tocaba
    // vía ref.read durante hydrate(), quedaba sin watchers y se recreaba
    // vacío en el próximo build — perdiendo los dropdowns hidratados.
    final form = ref.watch(
      consultationFormControllerProvider(widget.consultationId),
    );

    if (widget.patient == null && !_hydrated) {
      final detail = ref.watch(
        consultationDetailControllerProvider(widget.consultationId),
      );
      if (detail.hasError) {
        return Scaffold(
          backgroundColor: DsColors.bg,
          body: SafeArea(
            child: DsErrorView(
              message: 'No se pudo cargar la consulta: ${detail.error}',
              onRetry: () => ref.invalidate(
                consultationDetailControllerProvider(widget.consultationId),
              ),
            ),
          ),
        );
      }
      return const Scaffold(
        backgroundColor: DsColors.bg,
        body: SafeArea(child: Center(child: DsLoadingView())),
      );
    }
    final completedCount = _completedCount(form);
    final busy =
        ref.watch(pauseConsultationControllerProvider).isLoading ||
        ref.watch(signConsultationControllerProvider).isLoading;
    final recorderState =
        ref.watch(consultationRecorderControllerProvider).value ??
        const ConsultationRecorderState.idle();
    final processingSection =
        ref.watch(consultationProcessingSectionProvider);

    return PopScope(
      canPop: !_shouldWarnOnBack,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _openPauseSheet();
      },
      child: Scaffold(
        backgroundColor: DsColors.bg,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  ConsultationHeaderSection(
                    species: _species,
                    patientName: _patientName,
                    patientSubtitle: _patientSubtitle,
                    completed: completedCount,
                    total: _totalSections,
                    onBack: _back,
                    onOpenChecklist: _openCompliance,
                    onPause: hasActiveConsultation ? _openPauseSheet : null,
                    isUrgent: _isUrgent,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(
                        DsSpacing.lg,
                        DsSpacing.md,
                        DsSpacing.lg,
                        140,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (final s in ConsultationSection.values)
                            ConsultationSectionCard(
                              n: s.n,
                              title: s.title,
                              hint: s.hint,
                              filled: _isFilled(s, form),
                              expanded: !_collapsed.contains(s),
                              onToggle: () => _toggle(s),
                              child: _buildBody(
                                s,
                                recorderState,
                                processingSection,
                              ),
                            ),
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
                  child: ConsultationSignBar(
                    completed: completedCount,
                    total: _totalSections,
                    onOpenCompliance: _openCompliance,
                    onSign: _onSign,
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
      ),
    );
  }

  Widget _buildBody(
    ConsultationSection s,
    ConsultationRecorderState recorderState,
    ConsultationSection? processingSection,
  ) {
    final isRecordingThis =
        recorderState is RecorderRecording && recorderState.section == s;
    final isProcessingThis = processingSection == s;
    final processingActive = processingSection != null;
    // Mientras procesa el audio o graba otra sección, el resto de mics se
    // bloquean para evitar pisar la entrega activa.
    final micEnabled = !processingActive &&
        (recorderState is RecorderIdle || isRecordingThis);
    final recordingElapsed =
        recorderState is RecorderRecording && recorderState.section == s
            ? recorderState.elapsed
            : null;
    void onMic() => _toggleRecording(s);
    void onBlur() => _formNotifier.flushSection(s);

    if (_audioTextSections.contains(s)) {
      return FieldWithMic(
        controller: _textCtrls[s]!,
        label: s.hint,
        isRecording: isRecordingThis,
        isProcessing: isProcessingThis,
        recordingElapsed: recordingElapsed,
        micEnabled: micEnabled,
        onMicTap: onMic,
        onEditingComplete: onBlur,
      );
    }

    switch (s) {
      case ConsultationSection.identification:
        return IdentificationBody(summary: _identificationSummary);
      case ConsultationSection.food:
        return FoodBody(consultationId: widget.consultationId);
      case ConsultationSection.vitals:
        return VitalsBody(
          temp: _tempCtrl,
          fc: _fcCtrl,
          fr: _frCtrl,
          weight: _weightCtrl,
        );
      case ConsultationSection.exam:
        return ExamBody(
          consultationId: widget.consultationId,
          systemsCtrl: _textCtrls[ConsultationSection.exam]!,
          systemsRecording: isRecordingThis,
          systemsProcessing: isProcessingThis,
          systemsRecordingElapsed: recordingElapsed,
          systemsMicEnabled: micEnabled,
          onSystemsMic: onMic,
          onSystemsBlur: onBlur,
          tllc: _tllcCtrl,
          trcp: _trcpCtrl,
        );
      case ConsultationSection.labs:
        return LabsBody(
          controller: _textCtrls[s]!,
          isRecording: isRecordingThis,
          isProcessing: isProcessingThis,
          recordingElapsed: recordingElapsed,
          micEnabled: micEnabled,
          onMicTap: onMic,
          onEditingComplete: onBlur,
          onAttach: () {
            DsToast.show(
              context,
              message: 'Adjuntar archivos próximamente',
              variant: DsToastVariant.error,
            );
          },
        );
      case ConsultationSection.treatment:
        return TreatmentBody(consultationId: widget.consultationId);
      case ConsultationSection.signature:
        final user = ref.watch(currentUserProvider).value;
        return SignatureBody(
          controller: _textCtrls[s]!,
          doctorName:
              user == null ? '' : VeterinarianFormatters.salutation(user),
          doctorRegistry:
              user == null ? '' : VeterinarianFormatters.registry(user),
          isRecording: isRecordingThis,
          isProcessing: isProcessingThis,
          recordingElapsed: recordingElapsed,
          micEnabled: micEnabled,
          onMicTap: onMic,
          onEditingComplete: onBlur,
          onSign: _onSign,
        );
      // El compilador necesita que el switch sea exhaustivo aunque
      // _audioTextSections cubre las 6 textareas simples arriba.
      case ConsultationSection.reason:
      case ConsultationSection.anamnesis:
      case ConsultationSection.problems:
      case ConsultationSection.diagnosis:
      case ConsultationSection.recipe:
      case ConsultationSection.prognosis:
        throw StateError('Unreachable: ${s.name} handled above');
    }
  }
}
