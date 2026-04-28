// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_appointments.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTodayAppointmentsUseCase)
final getTodayAppointmentsUseCaseProvider =
    GetTodayAppointmentsUseCaseProvider._();

final class GetTodayAppointmentsUseCaseProvider
    extends
        $FunctionalProvider<
          GetTodayAppointmentsUseCase,
          GetTodayAppointmentsUseCase,
          GetTodayAppointmentsUseCase
        >
    with $Provider<GetTodayAppointmentsUseCase> {
  GetTodayAppointmentsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTodayAppointmentsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTodayAppointmentsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTodayAppointmentsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTodayAppointmentsUseCase create(Ref ref) {
    return getTodayAppointmentsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTodayAppointmentsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTodayAppointmentsUseCase>(value),
    );
  }
}

String _$getTodayAppointmentsUseCaseHash() =>
    r'f7f0776dbff04fea80439fc6890ac8e456bdf76c';

@ProviderFor(TodayAppointments)
final todayAppointmentsProvider = TodayAppointmentsProvider._();

final class TodayAppointmentsProvider
    extends $AsyncNotifierProvider<TodayAppointments, List<Appointment>> {
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
  TodayAppointments create() => TodayAppointments();
}

String _$todayAppointmentsHash() => r'a8cf1403f3c11fc32b60afc6078ea8f04f8ad4d7';

abstract class _$TodayAppointments extends $AsyncNotifier<List<Appointment>> {
  FutureOr<List<Appointment>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Appointment>>, List<Appointment>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Appointment>>, List<Appointment>>,
              AsyncValue<List<Appointment>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
