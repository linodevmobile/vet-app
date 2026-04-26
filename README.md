# VetApp

App Flutter veterinaria: grabación de audio → transcripción con IA → historia clínica estructurada.

Backend: https://github.com/linodevmobile/BackendVetApp
Base URL PROD: https://backendvetapp.onrender.com

---

## Requisitos

- Flutter SDK `^3.10.0` (gestionado con [`fvm`](https://fvm.app))
- [`lefthook`](https://github.com/evilmartians/lefthook) en PATH (hooks de git)

```bash
fvm install
fvm use
lefthook install   # una sola vez tras clonar
```

---

## Setup inicial

```bash
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
```

---

## Flavors

Dos entrypoints + archivos de config en `env/`:

| Flavor | Entrypoint            | Config           | BASE_URL                              |
|--------|-----------------------|------------------|---------------------------------------|
| STG    | `lib/main_stg.dart`   | `env/stg.json`   | https://backendvetapp.onrender.com    |
| PROD   | `lib/main_prod.dart`  | `env/prod.json`  | https://api.vetapp.com                |

---

## Correr en desarrollo

```bash
# STG
fvm flutter run --flavor stg -t lib/main_stg.dart --dart-define-from-file=env/stg.json

# PROD
fvm flutter run --flavor prod -t lib/main_prod.dart --dart-define-from-file=env/prod.json
```

---

## Build release

### Android APK

```bash
# STG
fvm flutter build apk --release --flavor stg -t lib/main_stg.dart --dart-define-from-file=env/stg.json

# PROD
fvm flutter build apk --release --flavor prod -t lib/main_prod.dart --dart-define-from-file=env/prod.json
```

Output: `build/app/outputs/flutter-apk/app-<flavor>-release.apk`

### Android App Bundle (Play Store)

```bash
fvm flutter build appbundle --release --flavor prod -t lib/main_prod.dart --dart-define-from-file=env/prod.json
```

### iOS (requiere macOS, flavors iOS pendientes)

```bash
fvm flutter build ios --release -t lib/main_prod.dart --dart-define-from-file=env/prod.json
```

---

## Code generation

Freezed + json_serializable + riverpod_generator corren vía `build_runner`.

```bash
# One-shot
fvm dart run build_runner build --delete-conflicting-outputs

# Watch (regenera al guardar)
fvm dart run build_runner watch --delete-conflicting-outputs
```

---

## Splash screen

Regenerar assets nativos tras cambiar `flutter_native_splash` en `pubspec.yaml`:

```bash
fvm dart run flutter_native_splash:create
```

---

## Calidad

```bash
fvm dart format .
fvm flutter analyze
fvm flutter test
```

Lefthook ya corre format + analyze en `pre-commit` y tests en `pre-push`.

---

## Limpiar build

```bash
fvm flutter clean && fvm flutter pub get
```

---

## Documentación interna

- Arquitectura: [`.claude/rules/arquitectura-explicada.md`](.claude/rules/arquitectura-explicada.md)
- Estilo Dart: [`.claude/rules/dart-style.md`](.claude/rules/dart-style.md)
- Composición UI: [`.claude/rules/widget-composition.md`](.claude/rules/widget-composition.md)
- Validaciones: [`.claude/rules/validations.md`](.claude/rules/validations.md)
- Contrato API: [`docs/api/BackendVetApp.postman_collection.json`](docs/api/BackendVetApp.postman_collection.json)
