// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_datasource_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appointmentsDatasource)
final appointmentsDatasourceProvider = AppointmentsDatasourceProvider._();

final class AppointmentsDatasourceProvider
    extends
        $FunctionalProvider<
          IAppointmentsDatasource,
          IAppointmentsDatasource,
          IAppointmentsDatasource
        >
    with $Provider<IAppointmentsDatasource> {
  AppointmentsDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appointmentsDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appointmentsDatasourceHash();

  @$internal
  @override
  $ProviderElement<IAppointmentsDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IAppointmentsDatasource create(Ref ref) {
    return appointmentsDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAppointmentsDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAppointmentsDatasource>(value),
    );
  }
}

String _$appointmentsDatasourceHash() =>
    r'1d71576f1dffaf454956af11457da0d60273732e';
