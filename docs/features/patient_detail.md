# Patient Detail — Historia clínica completa

Vista grande de detalle de paciente accesible desde consultas firmadas. Diseño en `desing/project/components/patient-profile.jsx`. Se construye en múltiples sesiones; este doc es el registro vivo de qué está hecho y qué queda.

## Anatomía del diseño

```
┌──────────────────────────────────────┐
│ HEADER  ← back · "Historia clínica" · ⋮│   ← Fase 1
├──────────────────────────────────────┤
│ HERO  avatar · Thor · Labrador · ♂   │   ← Fase 1
│       owner · phone                  │
│       chips: alerta · vacunas · #vis │
├──────────────────────────────────────┤
│ VITALS STRIP   peso · edad · últ · próx│ ← Fase 1 (datos parciales)
├──────────────────────────────────────┤
│ ACTIONS   [Nueva consulta] [Hospital]│   ← Fase 1
├──────────────────────────────────────┤
│ TABS  Resumen · Historia · Salud · …│   ← Fase 2+
├──────────────────────────────────────┤
│ BODY (depende del tab activo)        │   ← Fase 2+
└──────────────────────────────────────┘
```

## Endpoint disponible

**`GET /patients/:id`** existe en `docs/api/BackendVetApp.postman_collection.json` (línea 174-179).

> Devuelve paciente por UUID. 404 si no existe o no pertenece al vet autenticado.

El response no está documentado explícitamente, pero según el DTO existente (`lib/features/patients/infrastructure/models/patient_dto.dart`) y los campos del `POST /patients`, devuelve:

```json
{
  "data": {
    "id": "uuid",
    "name": "Thor",
    "species": "dog | cat | exotic",
    "sex": "male | female",
    "breed": "Labrador",
    "date_of_birth": "2019-05-12",
    "age_years": 7,
    "weight_kg": 32.4,
    "microchip": "...",
    "owner_name": "Julian Smith",
    "owner_phone": "+34 612 345 678",
    "owner_email": "...",
    "owner_address": "...",
    "veterinarian_id": "uuid",
    "created_at": "ISO8601"
  }
}
```

## Diseño vs. backend — gap analysis

| Elemento del diseño | Fuente backend | Estado |
|---|---|---|
| Avatar con flag `urgent` | derivado de `/patients/:id/alerts` (severity ≥ warning) | ✔ tenemos endpoint |
| Nombre · raza · sexo · edad | `GET /patients/:id` | ✔ |
| Owner: nombre + teléfono | `GET /patients/:id` (`owner_name`, `owner_phone`) | ✔ |
| Chip "Gastroenteritis activa" | `GET /patients/:id/alerts` (label de alerta activa) | ✔ endpoint existe; falta confirmar semántica (alertas crónicas vs. dx activo) |
| Chip "Vacunas al día" | **no existe schema de vacunación** | ✗ falta backend |
| Chip "23 visitas" | count de `GET /consultations?status=signed&patient_id=X` | ✗ filtro `patient_id` no documentado en By Status |
| Vitals strip — `Peso 32.4 kg ↑0.3` | `weight_kg` actual existe; histórico/trend **no** | ⚠ parcial — backend solo guarda último |
| Vitals strip — `Edad 7 años` | `age_years` o derivado de `date_of_birth` | ✔ |
| Vitals strip — `Últ. 2h` | tiempo desde última consulta firmada — **no expuesto** | ✗ falta `last_visit_at` o query |
| Vitals strip — `Próx. 12d` | siguiente cita — `/appointments` no admite filtro `patient_id&from` documentado | ⚠ requiere endpoint o filtro |

### Para conversar con backend

1. **Histórico de pesos** para `trend ↑ 0.3 kg`. Hoy `weight_kg` es escalar; necesita tabla/serie temporal o derivar de `weight_kg` de cada consulta.
2. **Conteo de visitas firmadas** por paciente: campo agregado `visit_count` en `/patients/:id` o filtro `patient_id` en `/consultations?status=signed`.
3. **`last_visit_at`** y **`next_appointment_at`** embebidos en `/patients/:id`, o queries dedicadas, para evitar 3 llamadas en el detalle.
4. **Vacunación**: ¿se modela como secciones de consulta o como tabla aparte? Esto bloquea la pestaña Salud → Vacunas y el chip "Vacunas al día".
5. **Adjuntos categorizados** (laboratorio/imagen/recetas/otros): hoy backend tiene `consultation_attachments`; ¿se exponen agrupados a nivel paciente?
6. **Cirugías** (Tab Salud → Cirugías): desde hospitalización, pero el flow de hospitalización todavía es solo lectura.

## Roadmap por fases

### Fase 1 — Header + Hero + Actions  ✅ HECHA (2026-04-28)

Scope acordado para hoy: header, datos del paciente (mascota) y botones.

- [x] `GET /patients/:id` plumbing — `PatientsApi.byId`, `IPatientsDatasource.getById`, `PatientsDatasourceImpl.getById`, `IPatientsRepository.getById`, `PatientsRepositoryImpl.getById`, `GetPatientByIdUseCase`, `PatientDetailController`.
- [x] Ruta `/patient/:id` (singular, parejo a `/consultation/:id`) fuera del shell → `PatientDetailView(patientId)`. `AppRoutes.patientById(id)`.
- [x] `PatientDetailHeaderSection` (back · kicker "HISTORIA CLÍNICA" + "Ficha del paciente" · ⋮ stub).
- [x] `PatientDetailHeroSection` (`DsPetAvatar` con `urgent` derivado de `patient.isAlert`; nombre + raza/sexo/edad; owner name/phone). Slot de chips presente pero vacío hoy.
- [x] `PatientDetailVitalsStripSection` con `Peso` y `Edad` reales; `Últ.` y `Próx.` con `—` (no inventamos data).
- [x] `PatientDetailActionsSection` (`Nueva consulta` + `Hospitalizar` stub con toast "próximamente").
- [x] Helper compartido `startPatientConsultation` extraído desde `_onPatientTap` (`patients_view.dart`) a `lib/features/consultation/presentation/start_patient_consultation.dart` — usado por `PatientsView` y `PatientDetailView`.
- [x] Entry point: tap en row de "Recientes" del home (`home_view.dart`) → `context.push(AppRoutes.patientById(record.patient.id))`.
- [x] Formatters de identidad/owner/vitals en `PatientFormatters` (regla: la View no formatea).

### Fase 2 — Tabs + tab Resumen

- [ ] Strip de tabs (Resumen / Historia / Salud / Adjuntos / Propietario).
- [ ] Tab Resumen: última visita destacada · próximos recordatorios · acceso rápido a tabs.

### Fase 3 — Tab Historia (timeline)

- [ ] Lista cronológica de consultas firmadas. Necesita filtro por paciente o `last_visit_at`.

### Fase 4 — Tab Salud

- [ ] Vacunas (depende de schema backend).
- [ ] Peso evolutivo (depende de histórico).
- [ ] Cirugías (depende de extracción desde hospitalización).

### Fase 5 — Tab Adjuntos

- [ ] Agrupados (laboratorio/imagen/recetas/otros). Depende de exposición agregada.

### Fase 6 — Tab Propietario

- [ ] Datos completos del owner + historial de pagos (no existe schema de pagos).

## Pendientes inmediatos para Fase 2+

- ⋮ del header en Fase 1 es stub — definir acciones (editar paciente, marcar favorito, ver historial completo, etc.).
- Avatar `urgent`: hoy se deriva de `patient.isAlert` (ya existente en entity), pero ese flag nunca se setea desde `GET /patients/:id`. Mientras backend no lo exponga, se queda en `false` siempre. Pendiente decidir: ¿se deriva client-side de `/patients/:id/alerts`?
- Chips del hero quedan vacíos hasta tener fuentes (alertas activas, vacunación, count de visitas).
- Vitals: integrar `Últ.` y `Próx.` cuando backend exponga `last_visit_at` y next-appointment por paciente. Trend de peso requiere histórico.
- "Hospitalizar" es stub — no existe flow de creación de hospitalización todavía. Si/cuando se diseñe, cablear acá.

## Estado

- 2026-04-28: Fase 1 completada (header + hero + vitals parciales + actions; entry desde Recientes).
