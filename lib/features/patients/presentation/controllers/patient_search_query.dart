import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patient_search_query.g.dart';

@riverpod
class PatientSearchQuery extends _$PatientSearchQuery {
  @override
  String build() => '';

  void update(String value) => state = value;

  void clear() => state = '';
}
