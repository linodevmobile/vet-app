// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_appointments.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(todayAppointments)
final todayAppointmentsProvider = TodayAppointmentsProvider._();

final class TodayAppointmentsProvider
    extends
        $FunctionalProvider<
          List<Appointment>,
          List<Appointment>,
          List<Appointment>
        >
    with $Provider<List<Appointment>> {
  TodayAppointmentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayAppointmentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayAppointmentsHash();

  @$internal
  @override
  $ProviderElement<List<Appointment>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<Appointment> create(Ref ref) {
    return todayAppointments(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Appointment> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Appointment>>(value),
    );
  }
}

String _$todayAppointmentsHash() => r'bc7446627ae61c7f85c6de9e6b90d87852c8d1da';
