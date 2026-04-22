import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vet_app/design_system/molecules/ds_error_view.dart';
import 'package:vet_app/design_system/molecules/ds_loading_view.dart';

/// Renderiza un `AsyncValue<T>` con defaults del design system.
/// `loading` y `error` se pueden sobrescribir; si no, usa `DsLoadingView`
/// y `DsErrorView` respectivamente.
class DsAsyncValue<T> extends StatelessWidget {
  const DsAsyncValue({
    required this.value,
    required this.data,
    this.loading,
    this.error,
    this.onRetry,
    super.key,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final Widget Function()? loading;
  final Widget Function(Object error, StackTrace stack)? error;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => loading?.call() ?? const DsLoadingView(),
      error: (e, st) =>
          error?.call(e, st) ?? DsErrorView(message: '$e', onRetry: onRetry),
    );
  }
}
