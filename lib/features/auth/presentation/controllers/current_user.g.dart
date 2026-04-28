// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentUser)
final currentUserProvider = CurrentUserProvider._();

final class CurrentUserProvider
    extends $AsyncNotifierProvider<CurrentUser, Veterinarian> {
  CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  CurrentUser create() => CurrentUser();
}

String _$currentUserHash() => r'c42c23acd59a9713f271f0841fb264e2ce086572';

abstract class _$CurrentUser extends $AsyncNotifier<Veterinarian> {
  FutureOr<Veterinarian> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Veterinarian>, Veterinarian>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Veterinarian>, Veterinarian>,
              AsyncValue<Veterinarian>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
