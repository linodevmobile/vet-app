# Spec de Backend — Paciente + Consulta (flujo completo)

Doc de handoff al backend con los **gaps detectados** entre la UI actual del cliente Flutter (AddPatient + ConsultationView) y los endpoints existentes en `BackendVetApp.postman_collection.json`.

Complementa `docs/backend-api-spec.md` (dashboard + listado de pacientes). Acá se concentra lo específico del **registro de un paciente nuevo** y la **captura de su consulta** (10 secciones Comvezcol).

---

## 1. Flujo end-to-end esperado

```
[AddPatientView]
  POST /patients            → Patient{id}
        │
        ▼
[ConsultationView]
  POST /consultation/process (section=anamnesis + patient_id + vet_id + type + motivo)
        │  (crea consulta, devuelve consultation_id)
        ▼
  POST /consultation/process (section=examen_fisico, consultation_id)
  POST /consultation/process (section=abordaje_diagnostico, …)
  POST /consultation/process (section=labs, …)          ← endpoint nuevo
  POST /consultation/process (section=diagnostico_*, …)
  POST /consultation/process (section=plan_terapeutico, …)
  POST /consultation/process (section=pronostico_evolucion, …)
        │
        ▼
  PATCH /patients/:id         (weight_kg actualizado desde Examen Físico)
  PATCH /consultation/:id/close  (result, chief_complaint, primary_diagnosis, signature)
```

Cada sección acepta **audio** (dictado con IA, comportamiento actual) **o texto** (tipeo directo sin grabar — falta endpoint, ver §5.1).

---

## 2. AddPatient — gaps contra `POST /patients`

### 2.1 Lo que la UI captura hoy

Form mínimo en `features/patients/presentation/views/add_patient_view.dart`:

| Campo UI | Tipo | Persiste en `Patient` entity? |
|---|---|---|
| `name` | String | ✅ |
| `species` | enum `dog/cat/exotic` | ✅ |
| `age` (años) | int | ✅ (`ageYears`) |
| `weight_kg` | double | ❌ **no persiste en entity hoy** |
| `owner_name` | String | ✅ (`ownerName`) |
| `phone` (dueño) | String | ❌ **no persiste en entity hoy** |

### 2.2 Lo que el API pide

`POST /patients` body:
```json
{
  "name": "...",
  "species": "canino|felino|...",
  "breed": "...",
  "sex": "male|female",
  "date_of_birth": "YYYY-MM-DD",
  "weight_kg": 28.5,
  "microchip": "...",
  "owner_name": "...",
  "owner_phone": "+57…",
  "owner_email": "..."
}
```

### 2.3 Gaps y decisiones requeridas

| Gap | Decisión pendiente |
|---|---|
| **`breed` no en UI** | Agregar al form mínimo, o hacerlo opcional en backend (nullable) y capturarlo después en consulta |
| **`sex` no en UI** | Mismo patrón que breed: capturar ahora u opcional |
| **`owner_email` no en UI** | Opcional backend — el form MVP prioriza tel del dueño, no email |
| **`microchip` no en UI** | Opcional — no todos los pacientes lo tienen |
| **`age_years` (UI) ↔ `date_of_birth` (API)** | Calcular `date_of_birth = today - age_years` en cliente (aproximación), **O** agregar `age_years: int` aceptado como alternativa en API |
| **`weight_kg` + `owner_phone` capturados pero no en entity** | Ampliar `Patient` entity con ambos campos y serializar al POST |
| **`species` mapping `dog↔canino`, `cat↔felino`** | Ver `docs/backend-api-spec.md §5.1` — pendiente migración a enum EN en backend |

### 2.4 Acción recomendada (cliente)

1. Ampliar `Patient` freezed entity con `weightKg: double?` y `ownerPhone: String?`.
2. Agregar `breed: String?` opcional al form (textfield libre — no drop-down porque las razas son demasiadas).
3. Agregar selector binario `sex` (male/female) o posponer a consulta.
4. Adaptador `age_years → date_of_birth` en `PatientRepository.create()`.

---

## 3. ConsultationView — mapeo 10 secciones UI ↔ 7 API

### 3.1 Tabla de mapeo

| # | UI (Comvezcol 10) | API `section` actual | Nota |
|---|---|---|---|
| 01 | Identificación | — | Prellenado desde `patient_id`, no se envía |
| 02 | Anamnesis | `anamnesis` | **Crea la consulta** — debe llevar `consultation_type` y `chief_complaint` |
| 03 | Examen físico | `examen_fisico` | Además dispara `PATCH /patients/:id` con `weight_kg` nuevo |
| 04 | Lista de problemas | parte de `abordaje_diagnostico` | UI los separa, API los fusiona |
| 05 | Abordaje diagnóstico | parte de `abordaje_diagnostico` | Mismo endpoint que 04 |
| 06 | Exámenes complementarios | **NO EXISTE** | Ver §5.2 |
| 07 | Diagnóstico clínico | `diagnostico_presuntivo` + `diagnostico_definitivo` | UI tiene 1 campo, API 2 |
| 08 | Plan terapéutico | `plan_terapeutico` | 1:1 |
| 09 | Pronóstico y evolución | `pronostico_evolucion` | 1:1 |
| 10 | Observaciones y firma | `PATCH /consultation/:id/close` | No es sección — es cierre |

### 3.2 Divergencias estructurales a resolver

- **Problemas + Abordaje**: el backend acepta un único blob `abordaje_diagnostico`. El cliente debe concatenar ambas secciones en un solo texto, **O** el backend debe split en dos secciones separadas (`problemas`, `abordaje_diagnostico`). Recomendado: split server-side (mantiene la estructura Comvezcol).

- **Diagnóstico presuntivo + definitivo**: el cliente tiene un solo campo. Opciones:
  - (a) dividir UI en dos subcampos dentro del acordeón `Diagnóstico clínico`.
  - (b) cliente manda ambos endpoints con el mismo texto (duplica).
  - (c) backend acepta sección unificada `diagnostico_clinico` y deriva los dos subregistros.
  - **Recomendado**: (a) — respeta el contrato API actual y es correcto clínicamente.

---

## 4. Estado del borrador — `paused` / `inProgress` / `signed`

El cliente modela tres estados de consulta (ver `lib/features/consultation/README.md`):

- `inProgress` — captura activa.
- `paused` — consulta abierta sin médico activo (paciente espera resultados).
- `signed` — cierre definitivo (= `close`).

UI label del estado `paused` en el diseño: "Pendiente de resultados" / "En progreso" (dashboard). Backend enum value: `paused`.

### 4.1 Qué soporta el API hoy

El GET `/consultation/:id` devuelve drafts por sección. No hay columna `status` explícita; el estado se infiere por la presencia/ausencia de `closed_at`.

### 4.2 Propuesta de schema

Agregar columnas en `consultations`:
```sql
CREATE TYPE consultation_status AS ENUM ('in_progress', 'paused', 'signed');
CREATE TYPE consultation_pause_reason AS ENUM (
  'labs',        -- esperando laboratorios (hemograma, química, coprológico)
  'imaging',     -- esperando imagen (Rx, ecografía, TAC)
  'procedure',   -- procedimiento en curso (sedación, curación, muestra)
  'owner',       -- dueño ausente (salió a buscar algo)
  'other'        -- otro motivo (obliga a revisar pause_note)
);

ALTER TABLE consultations
  ADD COLUMN status consultation_status NOT NULL DEFAULT 'in_progress',
  ADD COLUMN pause_reason consultation_pause_reason,
  ADD COLUMN pause_note TEXT,
  ADD COLUMN paused_at TIMESTAMPTZ;

-- Integridad: si está pausada, reason y paused_at obligatorios
ALTER TABLE consultations ADD CONSTRAINT consultations_pause_coherence CHECK (
  (status = 'paused' AND pause_reason IS NOT NULL AND paused_at IS NOT NULL)
  OR (status <> 'paused' AND pause_reason IS NULL AND paused_at IS NULL)
);

-- Dashboard lista por tiempo de espera
CREATE INDEX consultations_paused_at_idx ON consultations (paused_at DESC)
  WHERE status = 'paused';
```

Notas:
- `pause_note` — texto libre **siempre opcional**, para cualquier reason. Permite contexto fino (ej: reason=`labs`, note=`hemograma + química`). El cliente lo usa para armar el subtítulo del card dashboard: `"{reasonLabel} — {note}"` si existe.
- `paused_at` — timestamp que permite al cliente calcular `waiting` (`now() - paused_at`) y el flag stale (>2h). Umbral stale vive en cliente, no en backend.
- Sin columna `resumed_at` por ahora — al reanudar volvemos a `in_progress` y las tres columnas se limpian a `NULL`. Si se necesita auditoría futura, mover a tabla `consultation_pause_events`.

### 4.3 Endpoints nuevos

#### `PATCH /consultation/:id/pause`

Body:
```json
{
  "reason": "labs|imaging|procedure|owner|other",
  "note": "hemograma + química básica"
}
```

Reglas:
- `reason` obligatorio — enum cerrado.
- `note` opcional (string, max 500 chars).
- Solo válido si `status = 'in_progress'`. Si ya está `paused` → 409. Si `signed` → 409.
- Server setea `paused_at = now()`, `status = 'paused'`.
- Respuesta: consulta completa actualizada (mismo shape que GET `/consultation/:id`).

#### `PATCH /consultation/:id/resume`

Sin body. Reglas:
- Solo válido si `status = 'paused'` → pasa a `in_progress`, limpia `pause_reason`, `pause_note`, `paused_at`.
- Si `in_progress` → 409 (no-op seguro también aceptable, elegir).
- Si `signed` → 409.

#### `GET /consultations?status=paused&veterinarian_id={{me}}`

Para alimentar la sección dashboard **En progreso**. Ordenado por `paused_at ASC` (más antiguas primero — spec pide evitar olvidos).

Response item mínimo (el dashboard no necesita todo el detalle):
```json
{
  "id": "...",
  "patient": { "id": "...", "name": "Thor", "species": "canino" },
  "status": "paused",
  "pause_reason": "labs",
  "pause_note": "hemograma",
  "paused_at": "2026-04-22T13:45:00Z",
  "sections_completed": 6,
  "sections_total": 10
}
```

`sections_completed` / `sections_total` ya deberían ser derivables del estado de drafts — si no, el backend puede calcularlos on-the-fly.

---

## 5. Endpoints nuevos requeridos

### 5.1 `POST /consultation/process` — aceptar texto sin audio

**Contexto**: hoy el endpoint exige audio file. El flujo UI permite al doctor **tipear directamente** sin grabar. Sin esto, no hay forma de persistir texto escrito.

**Propuesta**: permitir `text: string` como campo alternativo al `audio`. Al menos uno debe estar presente.

```http
POST /consultation/process
Content-Type: multipart/form-data

section: anamnesis
consultation_id: {{consultation_id}}
text: "Dueño refiere vómitos amarillentos 3x/día..."
```

O alternativa en JSON puro (endpoint separado):
```http
POST /consultation/process-text
Content-Type: application/json

{ "section": "anamnesis", "consultation_id": "...", "text": "..." }
```

**Recomendado**: aceptar `text` opcional en el endpoint existente (menos duplicación).

### 5.2 Sección `examenes_complementarios` (labs) + attachments

**Gap**: la UI tiene `labs` (sección 06) con textarea + botón "Adjuntar resultado (PDF, imagen)". API no tiene nada equivalente.

**Propuestas**:

```http
POST /consultation/process
section: examenes_complementarios
consultation_id: {{id}}
text: "Hemograma + química básica..."
```

```http
POST /consultation/:id/attachments
Content-Type: multipart/form-data

section: examenes_complementarios
file: <PDF o imagen>
label: "Rx abdominal lateral"
```

Requiere nueva tabla `consultation_attachments`:
```sql
CREATE TABLE consultation_attachments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  consultation_id UUID NOT NULL REFERENCES consultations(id) ON DELETE CASCADE,
  section TEXT NOT NULL,
  storage_path TEXT NOT NULL,
  mime_type TEXT NOT NULL,
  label TEXT,
  size_bytes BIGINT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

Storage: Supabase Storage bucket privado `consultation-attachments/`.

### 5.3 `consultation_type` + `chief_complaint` en primera request

**Contexto**: el cliente captura "Motivo de consulta" como campo fijo arriba de los acordeones, **antes** de cualquier sección. Hoy ese campo sólo se envía en el `close`.

**Propuesta**: la primera request (anamnesis) acepta ambos campos y los persiste en `consultations`:

```http
POST /consultation/process
section: anamnesis
patient_id: {{id}}
veterinarian_id: {{vet_id}}
consultation_type: routine|surgery|emergency
chief_complaint: "Vómitos intermitentes y heces blandas desde hace 24h"
audio: <file> OR text: "..."
```

Razones: evita perder el dato si la consulta queda en `paused` sin cierre; permite mostrar el motivo en el dashboard "Registros recientes" aunque esté incompleta.

---

## 6. Endpoints a modificar

### 6.1 `PATCH /consultation/:id/close`

**Estado actual**:
```json
{
  "result": "discharge|hospitalization|deceased|referred",
  "chief_complaint": "...",
  "primary_diagnosis": "..."
}
```

**Ajustes requeridos**:
- `result` enum documentado explícitamente (ya existe en sample pero sin OpenAPI).
- `signature` — agregar campo opcional `signature_url` (string, URL firmada a asset subido previamente) o `signature_base64` (PNG embebido). Firma hológrafa dibujada por el doctor, pendiente de diseño en UI.
- `chief_complaint` debería ser **opcional** en el close si ya se envió en la primera request (§5.3).

---

## 7. ⚠️ Pendiente de diseño — botón "Mover a hospitalización"

**Gap de UX identificado**

La UI actual tiene un único botón de cierre: "Firmar y cerrar historia" → navega a dashboard. No permite elegir el `result` de la consulta.

El API soporta **cuatro resultados** para `PATCH close`:
- `discharge` (alta — default implícito actual)
- `hospitalization` (mover a hospitalización)
- `deceased` (fallecimiento)
- `referred` (referencia a especialista)

**Necesario en el diseño**:

Exponer en `ConsultationView` (probablemente en la barra inferior de firma o en una action sheet tras tap en "Firmar"):

1. Selector de resultado (bottom sheet con 4 opciones, o segmented control).
2. Flujo específico para `hospitalization`:
   - Si se selecciona → transición a alta de hospitalización (pre-llenar fecha, notas iniciales, criticality).
   - El paciente queda en la pantalla de hospitalización sin pasar por dashboard.
3. Flujo para `referred`: capturar centro/veterinario destino + motivo de referencia.
4. Flujo para `deceased`: captura de causa + confirmación adicional (acción destructiva).

**Sin esto, clínicamente la app no puede cerrar la mayoría de casos reales.** Revisar `desing_handoff/` y añadir wireframes específicos antes de implementar.

---

## 8. Sincronización de peso — `PATCH /patients/:id`

**Contexto**: en Examen Físico la UI captura `weight_kg` como uno de los 4 vitales. Ese peso debe persistirse al paciente.

**Momento del patch**: al cerrar la consulta (o al pausar). El cliente:

```http
PATCH /patients/:id
{ "weight_kg": 32.4 }
```

Idempotente — se puede reenviar. El endpoint ya existe en el API actual.

---

## 9. Orden de implementación sugerido

Bloqueantes primero:

1. **Ampliar `Patient` entity cliente** (weightKg, ownerPhone) + adaptar POST.
2. **`consultation_type` + `chief_complaint` en primera request** (§5.3) — sin esto se pierden datos al pausar.
3. **Endpoint soporta `text` sin audio** (§5.1) — desbloquea todo el flujo de tipeo.
4. **Estado `paused` + `pause_reason` + `pause_note` + `paused_at`** (§4) — requerido por la regla "doctor puede retomar después". Incluye endpoints `pause`, `resume` y `GET /consultations?status=paused` para dashboard.
5. **Sección `examenes_complementarios` + attachments** (§5.2) — bloqueante para `labs` body.
6. **Split `problemas` vs `abordaje_diagnostico`** (§3.2).
7. **Firma en close** (`signature_url` o `signature_base64`) (§6.1).
8. **Diseño y wiring del botón "Mover a hospitalización"** (§7).

No bloqueantes (se pueden diferir):

- `owner_email`, `microchip` opcionales en create patient.
- Dividir `diagnostico_clinico` en UI en presuntivo/definitivo.

---

## 10. TODOs del cliente bloqueados por este spec

Ubicación de los `TODO` en el código Flutter que esperan estos endpoints/decisiones:

- `features/patients/presentation/views/add_patient_view.dart` — `TODO(patients)` reemplazar construcción transiente de `Patient` por respuesta real del `AddPatientController` + backend.
- `features/patients/domain/entities/patient.dart` — ampliar entity con `weightKg`, `ownerPhone`, posible `breed`.
- `features/consultation/presentation/sections/bodies/labs_body.dart` — `onAttach` callback `null` hasta que exista endpoint de attachments.
- `features/consultation/presentation/sections/bodies/signature_body.dart` — botón "Firmar" de tarjeta interna: captura de firma hológrafa pendiente de diseño.
- `features/consultation/presentation/views/consultation_view.dart` — `_onSign()` hoy navega directo a `/today`; debe pedir `result` (§7) y disparar `PATCH close` antes de nav.
- `features/consultation/presentation/widgets/pause_consultation_sheet.dart` (pendiente de crear) — bottom sheet del flujo pausa (§4.3). Bloqueado por endpoint `PATCH /consultation/:id/pause`.
- `features/dashboard/presentation/widgets/in_progress_consultations_section.dart` (pendiente de crear) — sección "En progreso" del dashboard. Bloqueada por `GET /consultations?status=paused`. Umbral stale (2h) vive en `core/constants/consultation_constants.dart` del cliente.
- `features/auth/presentation/controllers/current_user.dart` — `TODO(auth)` datos del veterinario (incluida la `registry` agregada recientemente para `SignatureBody`) leer del `AuthSession` real.

---

## 11. Referencias cruzadas

- `docs/backend-api-spec.md` — dashboard + listado de pacientes (no duplicado acá).
- `lib/features/consultation/README.md` — reglas de negocio cliente (Comvezcol, deferrable, estados).
- `.claude/rules/arquitectura-explicada.md` — contratos domain/infra/presentation.
