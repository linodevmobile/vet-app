# VetApp

App Flutter veterinaria: grabación de audio → transcripción con IA → historia clínica estructurada por secciones. Consume un backend REST propio (Supabase Auth por detrás, el cliente habla REST plano).

## Reglas vivas del proyecto

Leer **antes** de escribir código que toque el área correspondiente:

- [`.claude/rules/dart-style.md`](.claude/rules/dart-style.md) — nombrado, imports, `const`, comentarios, prohibiciones generales.
- [`.claude/rules/widget-composition.md`](.claude/rules/widget-composition.md) — jerarquía `View → Section → UIWidget` y dónde van los formatters.
- [`.claude/rules/validations.md`](.claude/rules/validations.md) — validaciones fuera de entities; `CoreValidationService` vs validations por módulo.
- [`.claude/rules/arquitectura-explicada.md`](.claude/rules/arquitectura-explicada.md) — Clean Architecture aplicada con Riverpod 3. **Fuente de verdad** de la arquitectura.

## Stack fijado

- Flutter + Dart SDK `^3.10.0`.
- Estado + DI: `flutter_riverpod` `^3.3.1` con code-gen obligatorio (`@riverpod`).
- Routing: `go_router` con `refreshListenable` alimentado por `ref.listen`.
- HTTP: `dio` (multipart nativo para audio).
- Persistencia: `flutter_secure_storage` (solo JWT del backend).
- Modelado: `freezed` + `json_serializable`.
- Lints: `very_good_analysis`. `riverpod_lint` + `custom_lint` pausados hasta que `custom_lint` soporte `analyzer ^9.0.0` (bloquea a `riverpod_generator 4.x`). Mientras tanto, las reglas de Riverpod 3 se enforzan vía `.claude/rules/arquitectura-explicada.md`.
- Tests: `mocktail`.
- Flavors: STG / PROD vía `--dart-define-from-file`.
- Calidad local: `lefthook` (sin CI remoto por ahora). Tras clonar el repo: `lefthook install` (una vez) para registrar los hooks de git. Requiere tener el binario `lefthook` en PATH.

## Fuera del stack — no introducir sin acordar antes

`get_it`, `injectable`, `fpdart`, `dartz`, `drift`, `isar`, `supabase_flutter`, y el API `Mutation` de Riverpod 3 (aún experimental).

## Reglas transversales no negociables

- **Comentarios**: solo el "por qué". Nunca describir el "qué". No narrar código autoexplicativo.
- **`try/catch`**: solo en `repositories/impl`. Prohibido en `UseCase`, `Notifier` y `View`.
- **Errores**: el repositorio lanza excepciones de dominio tipadas (`AuthFailure`, `NetworkFailure`, …). El `AsyncNotifier` las captura con `AsyncValue.guard`. No se usa `Either` ni wrappers.
- **Providers**: solo `Notifier` / `AsyncNotifier` con `@riverpod`. Legacy (`StateProvider`, `StateNotifier`) prohibido.
- **`ref.mounted`**: verificar después de cada `await` dentro de un notifier antes de tocar `state`.
- **UI**: `ref.watch(p).when(...)` para dibujar; `ref.listen(p, ...)` para efectos efímeros (toasts, navegación).

## Estructura

Feature-first. Las tres capas de cada feature son `domain/`, `infrastructure/`, `presentation/` (el término "infrastructure" respeta el vocabulario de `arquitectura-explicada.md`).

```
lib/
  main_stg.dart     # entrypoint flavor STG (por convención Flutter, mains en lib/ root)
  main_prod.dart    # entrypoint flavor PROD
  app/              # bootstrap, App widget, router
  core/             # env, network, storage, errors, providers transversales
  design_system/    # tokens, atoms, molecules, organisms (funcional, no abstracto)
  features/<x>/
    domain/
    infrastructure/
    presentation/
  l10n/
```

## Modo de trabajo

El owner está aprendiendo `freezed`, `json_serializable`, code-gen con `build_runner`, interceptores de Dio, y `lefthook`. Al crear un archivo nuevo, explicar **qué hace, por qué está en esa ruta, y cómo encaja** — no volcar código sin contexto. Ir archivo por archivo, confirmar, seguir.
  
## API Backend                                                                                                                                            
  - Postman collection: `docs/api/BackendVetApp.postman_collection.json`
  - Contiene todos los endpoints, schemas de request/response, enums válidos
  - Backend repo: https://github.com/linodevmobile/BackendVetApp
  - Base URL prod: https://backendvetapp.onrender.com

  Caveat: copia estática → queda desactualizada cuando backend cambia.
