import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:vet_app/features/auth/presentation/views/login_view.dart';
import 'package:vet_app/features/home/presentation/views/home_view.dart';
import 'package:vet_app/features/splash/presentation/views/splash_view.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final refresh = _AuthRefreshListenable();
  ref
    ..listen(authControllerProvider, (_, __) => refresh.refresh())
    ..onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: refresh,
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);
      final onSplash = state.matchedLocation == AppRoutes.splash;
      final onLogin = state.matchedLocation == AppRoutes.login;

      if (auth.isLoading && !auth.hasValue) {
        return onSplash ? null : AppRoutes.splash;
      }

      final loggedIn = auth.value ?? false;

      if (loggedIn) {
        return (onLogin || onSplash) ? AppRoutes.home : null;
      }
      return onLogin ? null : AppRoutes.login;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}

class _AuthRefreshListenable extends ChangeNotifier {
  void refresh() => notifyListeners();
}
