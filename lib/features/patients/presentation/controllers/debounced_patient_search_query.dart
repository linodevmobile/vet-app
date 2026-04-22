import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/features/patients/presentation/controllers/patient_search_query.dart';

part 'debounced_patient_search_query.g.dart';

const _debounce = Duration(milliseconds: 350);

@riverpod
class DebouncedPatientSearchQuery extends _$DebouncedPatientSearchQuery {
  Timer? _timer;

  @override
  String build() {
    ref.onDispose(() => _timer?.cancel());
    ref.listen<String>(patientSearchQueryProvider, (_, next) {
      _timer?.cancel();
      _timer = Timer(_debounce, () => state = next);
    });
    return ref.read(patientSearchQueryProvider);
  }
}
