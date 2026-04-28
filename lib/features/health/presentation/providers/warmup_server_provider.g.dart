// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warmup_server_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(warmupServerUseCase)
final warmupServerUseCaseProvider = WarmupServerUseCaseProvider._();

final class WarmupServerUseCaseProvider
    extends
        $FunctionalProvider<
          WarmupServerUseCase,
          WarmupServerUseCase,
          WarmupServerUseCase
        >
    with $Provider<WarmupServerUseCase> {
  WarmupServerUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'warmupServerUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$warmupServerUseCaseHash();

  @$internal
  @override
  $ProviderElement<WarmupServerUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WarmupServerUseCase create(Ref ref) {
    return warmupServerUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WarmupServerUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WarmupServerUseCase>(value),
    );
  }
}

String _$warmupServerUseCaseHash() =>
    r'434b81845d9f2cf90c14400f6f65c08f376720c3';
