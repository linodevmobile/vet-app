# DB Roadmap — VetApp

Plan estratégico de crecimiento del schema de base de datos. **No es orden de implementación táctico** (ver §8 y los dos docs complementarios `backend-api-spec.md` + `consultation-api-gaps.md` para eso).

Propósito: que cuando lleguen features futuras ya sepamos dónde encajan y qué decisiones tempranas evitan migraciones complicadas más adelante.

---

## 1. Alcance

Este documento organiza las **tablas y columnas que van a existir** a medida que la app crece, agrupadas en capas temporales por nivel de certeza:

- **Capa 1** — necesarias para lo ya **diseñado** y parcialmente construido.
- **Capa 2** — **probables** en los próximos 3-6 meses (features ya pensados, no scoped aún).
- **Capa 3** — **futuras** (features que el negocio menciona pero no están cerca).

Más §6 (convenciones transversales que aplican a **todas** las tablas) y §8 (decisiones que hay que tomar **ahora** aunque la feature aún no exista, para evitar migraciones dolorosas).

---

## 2. Estado actual — snapshot `supabase_schema_v2.sql`

**Tablas existentes**

| Tabla | Rol |
|---|---|
| `veterinarians` | Perfil del médico (1:1 con `auth.users`) |
| `patients` | Paciente + dueño (datos flattened) |
| `consultations` | Registro clínico (source of truth) |
| `consultation_drafts` | Capas de IA por sección (JSONB), 1 row por sección |
| `medical_orders` + `order_medications` | Órdenes derivadas del plan terapéutico |
| `treatment_events` | Cada aplicación programada (tablero de hospitalización) |
| `hospitalizations` | Estado activo en hospital |
| `files` | Attachments crudos (URL + tipo) |

**Enums existentes**: `consultation_status {in_progress, completed}`, `consultation_result {discharge, hospitalization, deceased, referred}`, `clinical_section (7 keys)`, `order_type`, `order_status`, `treatment_event_status`, `hospitalization_status`, `file_type {audio, image, pdf, other}`.

**Lo que NO existe hoy**: alerts, appointments, favoritos, multi-clínica, audit log, soft delete, notifications, vacunas, inventario, facturación, mensajería owner.

---

## 3. Capa 1 — Bloqueantes para features ya diseñadas

### 3.1 `patient_alerts` — alergias y condiciones crónicas

```sql
CREATE TYPE alert_severity AS ENUM ('info', 'warning', 'critical');

CREATE TABLE patient_alerts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  patient_id UUID NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
  label TEXT NOT NULL,
  severity alert_severity NOT NULL DEFAULT 'warning',
  active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  created_by UUID REFERENCES veterinarians(id),
  deleted_at TIMESTAMPTZ
);

CREATE INDEX idx_alerts_patient_active
  ON patient_alerts(patient_id) WHERE active = true AND deleted_at IS NULL;
```

Alimenta el chip rojo "urgente" en listados y header de consulta.

### 3.2 `appointments` — agenda diaria

Ya especificado en `backend-api-spec.md §1.1`. Resumido:
- FK a `patient` + `veterinarian`.
- `scheduled_at`, `status {scheduled|now|completed|cancelled}`, `urgent`, `reason`.
- `consultation_id` nullable (se setea cuando la cita arranca como consulta).

### 3.3 `vet_favorite_patients` — pacientes favoritos

Ya especificado en `backend-api-spec.md §1.4`. M:N simple.

### 3.4 Extensiones a `consultations`

```sql
CREATE TYPE consultation_type AS ENUM ('routine', 'surgery', 'emergency');

ALTER TABLE consultations
  ADD COLUMN type consultation_type NOT NULL DEFAULT 'routine',
  ADD COLUMN summary TEXT,
  ADD COLUMN signature_url TEXT,
  ADD COLUMN pause_note TEXT,
  ADD COLUMN deleted_at TIMESTAMPTZ;

-- Extender status para reflejar "paused"
ALTER TYPE consultation_status ADD VALUE 'paused' BEFORE 'completed';
```

- `type` — tarjeta de registros recientes (ya lo pide el cliente).
- `summary` — texto corto mostrado en dashboard.
- `signature_url` — firma hológrafa (imagen en Storage).
- `pause_note` — requerido cuando se pausa con deferrables vacías (ver `consultation-api-gaps.md §4`).
- `paused` en enum — nuevo estado.

### 3.5 Extender `clinical_section` enum con labs

```sql
ALTER TYPE clinical_section ADD VALUE 'complementary_exams';
```

Corresponde a la sección 06 `Exámenes complementarios` del UI. Bloqueante para `labs_body.dart`.

### 3.6 Extensiones a `files` — attachments clínicos

```sql
ALTER TABLE files
  ADD COLUMN section clinical_section,
  ADD COLUMN label TEXT,
  ADD COLUMN size_bytes BIGINT,
  ADD COLUMN mime_type TEXT,
  ADD COLUMN uploaded_by UUID REFERENCES veterinarians(id),
  ADD COLUMN deleted_at TIMESTAMPTZ;

CREATE INDEX idx_files_consultation_section
  ON files(consultation_id, section) WHERE deleted_at IS NULL;
```

Permite vincular un PDF al `complementary_exams` de una consulta con label ("Rx abdominal lateral").

### 3.7 Denormalizaciones útiles

Opcional pero recomendado:

```sql
ALTER TABLE consultations
  ADD COLUMN patient_weight_kg DECIMAL(6,2);
```

Snapshot del peso del paciente al momento de la consulta (capturado en examen físico). Evita recalcular desde `consultation_drafts.physical_exam` cada vez que un reporte pregunte por histórico de peso.

---

## 4. Capa 2 — Probables 3-6 meses

### 4.1 Multi-clínica

Vets reales trabajan en varias clínicas. Modelo:

```sql
CREATE TABLE clinics (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  address TEXT,
  phone TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at TIMESTAMPTZ
);

CREATE TABLE clinic_veterinarians (
  clinic_id UUID NOT NULL REFERENCES clinics(id) ON DELETE CASCADE,
  veterinarian_id UUID NOT NULL REFERENCES veterinarians(id) ON DELETE CASCADE,
  role TEXT,  -- 'owner', 'staff', 'assistant'
  PRIMARY KEY (clinic_id, veterinarian_id)
);

-- Cada paciente pertenece a una clínica (RLS tenant key)
ALTER TABLE patients ADD COLUMN clinic_id UUID REFERENCES clinics(id);
ALTER TABLE appointments ADD COLUMN clinic_id UUID REFERENCES clinics(id);
ALTER TABLE consultations ADD COLUMN clinic_id UUID REFERENCES clinics(id);
```

Esto **cambia la key de RLS** — ver §6.

### 4.2 Audit log

```sql
CREATE TABLE activity_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  actor_id UUID REFERENCES veterinarians(id),
  entity_type TEXT NOT NULL,   -- 'consultation', 'patient', 'order'
  entity_id UUID NOT NULL,
  action TEXT NOT NULL,         -- 'created', 'updated', 'signed', 'deleted'
  diff JSONB,                    -- cambio específico
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_activity_entity ON activity_log(entity_type, entity_id);
CREATE INDEX idx_activity_actor ON activity_log(actor_id, created_at DESC);
```

Crítico cuando alguien reclame "¿quién cambió esta consulta?". Especialmente **después** de firmada: consultas firmadas no deberían mutar silenciosamente.

### 4.3 Notifications

```sql
CREATE TYPE notification_type AS ENUM (
  'treatment_due', 'consultation_unsigned', 'alert_critical', 'appointment_reminder'
);

CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  veterinarian_id UUID NOT NULL REFERENCES veterinarians(id) ON DELETE CASCADE,
  type notification_type NOT NULL,
  entity_type TEXT,
  entity_id UUID,
  title TEXT NOT NULL,
  body TEXT,
  read_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_notifications_vet_unread
  ON notifications(veterinarian_id) WHERE read_at IS NULL;
```

Alimenta badge rojo en app + eventual push notification server-side.

### 4.4 Weight history explícito

Si `consultations.patient_weight_kg` (§3.7) no alcanza (ej. reportes complejos, gráfica de evolución):

```sql
CREATE TABLE patient_weight_history (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  patient_id UUID NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
  consultation_id UUID REFERENCES consultations(id) ON DELETE SET NULL,
  weight_kg DECIMAL(6,2) NOT NULL,
  measured_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_weight_patient ON patient_weight_history(patient_id, measured_at DESC);
```

### 4.5 Soft delete sistemático

Agregar `deleted_at TIMESTAMPTZ` en todas las tablas de dominio clínico. Ver §6 y §8.1.

---

## 5. Capa 3 — Futuras

### 5.1 Vacunación

```sql
CREATE TABLE vaccines (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  target_disease TEXT,
  species TEXT[],           -- ['dog', 'cat']
  manufacturer TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE patient_vaccinations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  patient_id UUID NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
  vaccine_id UUID NOT NULL REFERENCES vaccines(id),
  applied_at TIMESTAMPTZ NOT NULL,
  applied_by UUID REFERENCES veterinarians(id),
  batch_number TEXT,
  next_dose_at TIMESTAMPTZ,
  consultation_id UUID REFERENCES consultations(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

### 5.2 Desparasitación

Mismo patrón que vacunas:

```sql
CREATE TABLE deworming_events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  patient_id UUID NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
  product_name TEXT NOT NULL,
  applied_at TIMESTAMPTZ NOT NULL,
  applied_by UUID REFERENCES veterinarians(id),
  next_application_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

### 5.3 Inventario

```sql
CREATE TABLE inventory_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  clinic_id UUID NOT NULL REFERENCES clinics(id),
  name TEXT NOT NULL,
  sku TEXT,
  category TEXT,
  unit TEXT,
  reorder_threshold INT,
  current_stock INT NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at TIMESTAMPTZ
);

CREATE TABLE stock_movements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  item_id UUID NOT NULL REFERENCES inventory_items(id),
  delta INT NOT NULL,           -- positivo entrada, negativo salida
  reason TEXT NOT NULL,         -- 'purchase', 'consumption', 'adjustment', 'expired'
  order_medication_id UUID REFERENCES order_medications(id),
  created_by UUID REFERENCES veterinarians(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

Conecta prescripciones con stock real → alerta de reorden, vencimientos.

### 5.4 Lab results estructurados

Hoy labs son PDF crudo. Cuando haya integración con laboratorios:

```sql
CREATE TABLE lab_panels (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,           -- 'Hemograma', 'Química básica'
  species TEXT[]
);

CREATE TABLE lab_parameters (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  panel_id UUID NOT NULL REFERENCES lab_panels(id),
  code TEXT NOT NULL,           -- 'HCT', 'ALT'
  unit TEXT,
  reference_min DECIMAL(10,3),
  reference_max DECIMAL(10,3)
);

CREATE TABLE lab_results (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  consultation_id UUID NOT NULL REFERENCES consultations(id),
  parameter_id UUID NOT NULL REFERENCES lab_parameters(id),
  value DECIMAL(10,3),
  text_value TEXT,
  measured_at TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
```

### 5.5 Comunicación con dueños

```sql
CREATE TABLE owner_reminders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  patient_id UUID NOT NULL REFERENCES patients(id) ON DELETE CASCADE,
  kind TEXT NOT NULL,           -- 'vaccination_due', 'recheck', 'vaccine_anniversary'
  scheduled_for TIMESTAMPTZ NOT NULL,
  sent_at TIMESTAMPTZ,
  channel TEXT,                 -- 'sms', 'whatsapp', 'email'
  status TEXT NOT NULL DEFAULT 'pending'
);
```

### 5.6 Facturación

```sql
CREATE TABLE invoices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  consultation_id UUID REFERENCES consultations(id),
  patient_id UUID NOT NULL REFERENCES patients(id),
  clinic_id UUID NOT NULL REFERENCES clinics(id),
  total DECIMAL(12,2) NOT NULL,
  currency TEXT NOT NULL DEFAULT 'COP',
  status TEXT NOT NULL DEFAULT 'draft',  -- 'draft', 'issued', 'paid', 'cancelled'
  issued_at TIMESTAMPTZ,
  paid_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE invoice_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  invoice_id UUID NOT NULL REFERENCES invoices(id) ON DELETE CASCADE,
  description TEXT NOT NULL,
  quantity DECIMAL(10,3) NOT NULL DEFAULT 1,
  unit_price DECIMAL(12,2) NOT NULL,
  total DECIMAL(12,2) NOT NULL,
  inventory_item_id UUID REFERENCES inventory_items(id),
  order_medication_id UUID REFERENCES order_medications(id)
);
```

---

## 6. Convenciones transversales

### 6.1 Identidad

- **UUID v4** como PK en todas las tablas (ya).
- Nunca autoincremental — evita colisiones si algún día se distribuye.

### 6.2 Timestamps

- **Siempre `TIMESTAMPTZ`** (ya).
- `created_at`, `updated_at` con trigger automático (ya).
- `deleted_at TIMESTAMPTZ NULL` sistemático — ver §8.1.
- Zonas horarias: server en UTC, cliente convierte a TZ local.

### 6.3 Soft delete

Regla: en dominio clínico **nada se borra físicamente**. `deleted_at` marca el borrado lógico. Queries estándar filtran `WHERE deleted_at IS NULL`.

Razón: historia clínica es evidencia legal. Si se borra físicamente, ni un vet ni el sistema pueden justificar qué pasó.

### 6.4 Multi-tenancy (preparación)

Hoy todo es single-clinic. Cuando entre `clinics` (§4.1):
- Agregar `clinic_id` a toda tabla de dominio.
- RLS cambia de `authenticated` a `authenticated + clinic_id = current_clinic()`.
- Migración incremental: primero columna nullable, backfill, luego `NOT NULL`.

### 6.5 Enums vs lookup tables

Regla:
- **Enum PostgreSQL** cuando los valores son estables y los conoce el código cliente (`consultation_result`, `species`, `clinical_section`).
- **Tabla de lookup** cuando los valores los administra el usuario (razas de perro, medicamentos, proveedores).

Migrar enums es caro (downtime corto). Elegir bien de arranque.

### 6.6 Indexing

Regla general:
- Índice en cada FK (postgres no los crea automáticamente).
- Índice parcial para flags booleanos con alta cardinalidad (`WHERE active = true`).
- Índice compuesto para queries frecuentes de dashboard.
- `EXPLAIN ANALYZE` antes de agregar — no pre-optimizar.

### 6.7 RLS

Hoy: política `anon_all` permisiva (MVP). Transición:
1. `authenticated` con `veterinarian_id = auth.uid()` cuando auth esté producción.
2. `authenticated + clinic_id IN (SELECT clinic_id FROM clinic_veterinarians WHERE vet_id = auth.uid())` cuando entre multi-clinic.
3. `service_role` para jobs de backend que cruzan clínicas (reportes globales, mantenimiento).

---

## 7. ERD mental — relaciones clave

```
auth.users ──1:1── veterinarians ──M:N── clinics (Capa 2)
                      │                     │
                      │                     └──M:N── patients
                      │                                │
                      ├──M:N (favorites)───────────────┤
                      │                                │
                      └──1:N── appointments ─────────M:1┘
                                     │
                                     └──0:1── consultations
                                                   │
                    ┌──────────────────────────────┤
                    │                              │
              consultation_drafts (1:N)    medical_orders (1:N)
                    │                              │
              (section + JSONB)              order_medications (1:N)
                                                   │
                                          treatment_events (1:N)
                                                   │
                   consultations ─1:0..1─ hospitalizations ────┘
                        │
                        └──1:N── files (con section binding)
                        └──1:N── lab_results (Capa 3)
                        └──1:N── invoice_items (Capa 3)

patients ──1:N── patient_alerts
         ──1:N── patient_vaccinations (Capa 3)
         ──1:N── patient_weight_history (Capa 2)
         ──1:N── deworming_events (Capa 3)
         ──1:N── owner_reminders (Capa 3)
```

---

## 8. Decisiones tempranas (anti-sorpresa)

Cosas que conviene decidir/implementar **ahora** aunque la feature aún no exista:

### 8.1 `deleted_at` en todas las tablas de dominio

Costo hoy: 1 columna nullable + update de queries estándar. Costo después: migración + reescritura de reportes que asumieron "lo que no está en la tabla no existe".

### 8.2 `clinic_id` nullable en tablas de dominio

Aunque solo haya una clínica hoy, dejar la columna nullable prepara multi-tenant sin downtime.

Alternativa: no agregarlo hasta que entre multi-tenant + backfill con un default. Trade-off: la segunda opción es más limpia si estamos seguros de que multi-tenant va a demorar.

**Recomendación**: esperar. Agregarlo cuando se escriba §4.1 — no antes.

### 8.3 `activity_log` temprano

Costo: 1 tabla + N triggers. Beneficio: trazabilidad desde el día 1.

**Recomendación**: no empezar con triggers. Empezar con logs **aplicación-side** desde el backend (Node) escribiendo a `activity_log` en las acciones sensibles (cierre de consulta, edición post-firma, eliminación de paciente).

### 8.4 Enum `consultation_status` con `paused` de arranque

Evita `ALTER TYPE ... ADD VALUE` cuando entre la feature pausa. Agregar ya.

### 8.5 `signature_url` en consultations desde ya

Columna nullable sin impacto. Cuando diseño UI de firma hológrafa esté listo, solo hay que escribir, no migrar.

### 8.6 Supabase Storage buckets desde el arranque

Crear los 3 buckets probables: `consultation-audio/`, `consultation-attachments/`, `signatures/`. Política privada. El costo es cero si no se usan; crear después requiere coordinar deploy de API + migración de paths.

---

## 9. Orden de implementación sugerido

Ver `consultation-api-gaps.md §9` para el orden táctico detallado. Resumen por capas:

**Ahora (Capa 1)**: §3.4 (`type` + `summary` + `paused` + `signature_url`), §3.5 (`complementary_exams` enum), §3.1 (`patient_alerts`), §3.6 (`files` extensiones), §8.5.

**Antes de producción**: §3.2 (`appointments`), §3.3 (favoritos), §6.7 (RLS authenticated), §8.1 (`deleted_at` global), §8.3 (`activity_log` mínimo).

**Según tracción**: §4 completo (multi-clinic, notifications, weight history).

**Según expansión de negocio**: §5 (vacunas, inventario, lab estructurado, facturación, comms).

---

## 10. Referencias cruzadas

- `docs/backend-api-spec.md` — endpoints dashboard + patients.
- `docs/consultation-api-gaps.md` — gaps UI↔API para registro de paciente + consulta.
- `lib/features/consultation/README.md` — reglas de negocio cliente (Comvezcol, deferrable).
- `BackendVetApp/supabase_schema_v2.sql` — schema actual autoritativo.
- `.claude/rules/arquitectura-explicada.md` — capas domain/infra/presentation.
