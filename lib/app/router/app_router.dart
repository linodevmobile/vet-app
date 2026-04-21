import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/app/shell/home_shell.dart';
import 'package:vet_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:vet_app/features/auth/presentation/views/login_view.dart';
import 'package:vet_app/features/home/presentation/views/home_view.dart';
import 'package:vet_app/features/hospitalization/presentation/views/hospital_view.dart';
import 'package:vet_app/features/patients/presentation/views/add_patient_view.dart';
import 'package:vet_app/features/patients/presentation/views/patients_view.dart';
import 'package:vet_app/features/profile/presentation/views/profile_view.dart';
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
        return (onLogin || onSplash) ? AppRoutes.today : null;
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
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomeShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.today,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.patients,
                builder: (context, state) => const PatientsView(),
                routes: [
                  GoRoute(
                    path: 'new',
                    builder: (context, state) => const AddPatientView(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.hospital,
                builder: (context, state) => const HospitalView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfileView(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class _AuthRefreshListenable extends ChangeNotifier {
  void refresh() => notifyListeners();
}
