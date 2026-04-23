// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'microphone_permission_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(microphonePermissionService)
final microphonePermissionServiceProvider =
    MicrophonePermissionServiceProvider._();

final class MicrophonePermissionServiceProvider
    extends
        $FunctionalProvider<
          MicrophonePermissionService,
          MicrophonePermissionService,
          MicrophonePermissionService
        >
    with $Provider<MicrophonePermissionService> {
  MicrophonePermissionServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'microphonePermissionServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$microphonePermissionServiceHash();

  @$internal
  @override
  $ProviderElement<MicrophonePermissionService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MicrophonePermissionService create(Ref ref) {
    return microphonePermissionService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MicrophonePermissionService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MicrophonePermissionService>(value),
    );
  }
}

String _$microphonePermissionServiceHash() =>
    r'967bc56e8a7a5f7d12db78efe2de1def2c8b3779';
