import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation.dart';
import 'package:vet_app/features/consultation/domain/entities/consultation_section.dart';
import 'package:vet_app/features/consultation/infrastructure/models/consultation_section_wire.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_form_state.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_sync_controller.dart';
import 'package:vet_app/features/consultation/presentation/controllers/section_content_mapper.dart';

part 'consultation_form_controller.g.dart';

@riverpod
class ConsultationFormController extends _$ConsultationFormController {
  static const _debounce = Duration(seconds: 2);
  final Map<ConsultationSection, Timer> _timers = {};

  @override
  ConsultationFormState build(String consultationId) {
    ref.onDispose(_cancelAllTimers);
    return const ConsultationFormState();
  }

  // Carga inicial desde el backend al reanudar una pausada. Setea state directo
  // sin _schedule: no queremos re-PATCHear lo que acabamos de recibir. Las
  // listeners de los TextEditingController que disparen los setters después de
  // hidratar caen sobre los guards idempotentes y no agendan nada.
  void hydrate(Consultation c) {
    state = SectionContentMapper.fromConsultation(c);
  }

  void setText(ConsultationSection section, String value) {
    if (state.texts[section] == value) return;
    state = state.copyWith(texts: {...state.texts, section: value});
    _schedule(section);
  }

  void setFood(String value) {
    if (state.food == value) return;
    state = state.copyWith(food: value);
    _schedule(ConsultationSection.food);
  }

  void setTemperatureC(String value) {
    if (state.temperatureC == value) return;
    state = state.copyWith(temperatureC: value);
    _schedule(ConsultationSection.vitals);
  }

  void setHeartRateBpm(String value) {
    if (state.heartRateBpm == value) return;
    state = state.copyWith(heartRateBpm: value);
    _schedule(ConsultationSection.vitals);
  }

  void setRespiratoryRateRpm(String value) {
    if (state.respiratoryRateRpm == value) return;
    state = state.copyWith(respiratoryRateRpm: value);
    _schedule(ConsultationSection.vitals);
  }

  void setWeightKg(String value) {
    if (state.weightKg == value) return;
    state = state.copyWith(weightKg: value);
    _schedule(ConsultationSection.vitals);
  }

  void setMucosa(String value) {
    if (state.mucosa == value) return;
    state = state.copyWith(mucosa: value);
    _schedule(ConsultationSection.exam);
  }

  void setBcs(String value) {
    if (state.bcs == value) return;
    state = state.copyWith(bcs: value);
    _schedule(ConsultationSection.exam);
  }

  void setAttitudeOwner(String value) {
    if (state.attitudeOwner == value) return;
    state = state.copyWith(attitudeOwner: value);
    _schedule(ConsultationSection.exam);
  }

  void setAttitudeVet(String value) {
    if (state.attitudeVet == value) return;
    state = state.copyWith(attitudeVet: value);
    _schedule(ConsultationSection.exam);
  }

  void setPulse(String value) {
    if (state.pulse == value) return;
    state = state.copyWith(pulse: value);
    _schedule(ConsultationSection.exam);
  }

  void setDehydration(double value) {
    if (state.dehydration == value) return;
    state = state.copyWith(dehydration: value);
    _schedule(ConsultationSection.exam);
  }

  void setTllcSeconds(String value) {
    if (state.tllcSeconds == value) return;
    state = state.copyWith(tllcSeconds: value);
    _schedule(ConsultationSection.exam);
  }

  void setTrcpSeconds(String value) {
    if (state.trcpSeconds == value) return;
    state = state.copyWith(trcpSeconds: value);
    _schedule(ConsultationSection.exam);
  }

  void setSystemsAffected(String value) {
    if (state.systemsAffected == value) return;
    state = state.copyWith(systemsAffected: value);
    _schedule(ConsultationSection.exam);
  }

  void setTreatment(String value) {
    if (state.treatment == value) return;
    state = state.copyWith(treatment: value);
    _schedule(ConsultationSection.treatment);
  }

  Future<void> flushSection(ConsultationSection section) async {
    _timers.remove(section)?.cancel();
    await _syncNow(section);
  }

  // Sequential, no Future.wait: el sync controller expone un solo AsyncValue
  // y los syncs en paralelo se pisarían el state.
  Future<void> flushAll() async {
    final pending = _timers.keys.toList();
    for (final s in pending) {
      _timers.remove(s)?.cancel();
    }
    for (final s in pending) {
      await _syncNow(s);
      if (!ref.mounted) return;
    }
  }

  void _schedule(ConsultationSection section) {
    if (ConsultationSectionWire.wireFor(section) == null) return;
    _timers.remove(section)?.cancel();
    _timers[section] = Timer(_debounce, () {
      _timers.remove(section);
      if (!ref.mounted) return;
      _syncNow(section);
    });
  }

  Future<void> _syncNow(ConsultationSection section) async {
    if (ConsultationSectionWire.wireFor(section) == null) return;
    final content = SectionContentMapper.buildContent(section, state);
    final text = content == null ? state.texts[section] : null;
    if (text == null && content == null) return;
    await ref
        .read(consultationSyncControllerProvider.notifier)
        .syncSection(
          consultationId: consultationId,
          section: section,
          text: text,
          content: content,
        );
  }

  void _cancelAllTimers() {
    for (final t in _timers.values) {
      t.cancel();
    }
    _timers.clear();
  }
}
