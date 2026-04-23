// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appointmentsRepository)
final appointmentsRepositoryProvider = AppointmentsRepositoryProvider._();

final class AppointmentsRepositoryProvider
    extends
        $FunctionalProvider<
          IAppointmentsRepository,
          IAppointmentsRepository,
          IAppointmentsRepository
        >
    with $Provider<IAppointmentsRepository> {
  AppointmentsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appointmentsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appointmentsRepositoryHash();

  @$internal
  @override
  $ProviderElement<IAppointmentsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IAppointmentsRepository create(Ref ref) {
    return appointmentsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAppointmentsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAppointmentsRepository>(value),
    );
  }
}

String _$appointmentsRepositoryHash() =>
    r'220dec792d12d1d3433d3d07e80d8c20ace55991';
