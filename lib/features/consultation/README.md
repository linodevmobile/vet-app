# Consultation (feature)

Captura de historia clínica con 10 secciones obligatorias (Comvezcol, Res. 8430).

Este README documenta decisiones de negocio que **no** son derivables del código. Las reglas de estilo/arquitectura viven en `.claude/rules/` del repo; acá solo lo específico de este módulo.

---

## Regulatorio — las 10 secciones son obligatorias

Comvezcol exige los 10 puntos en toda historia clínica veterinaria firmada (Res. 8430). No se pueden eliminar ni reordenar arbitrariamente. Orden fijado en `ConsultationSection` (enum en `domain/entities/`).

Agrupación SOAP + registro + cierre:

| # | Sección | Grupo |
|---|---|---|
| 01 | Identificación | Registro |
| 02 | Anamnesis | Subjetivo |
| 03 | Examen físico | Objetivo |
| 04 | Lista de problemas | Objetivo |
| 05 | Abordaje diagnóstico | Assessment |
| 06 | Exámenes complementarios | Assessment |
| 07 | Diagnóstico clínico | Assessment |
| 08 | Plan terapéutico | Plan |
| 09 | Pronóstico y evolución | Plan |
| 10 | Observaciones y firma | Cierre |

---

## Fillability — `deferrable: bool`

Las 10 son obligatorias **para firmar**. Pero no todas se pueden llenar en el mismo momento: un paciente puede quedar en clínica todo el día esperando resultados de laboratorio, y el médico debe poder atender a otros pacientes entre tanto.

Cada sección del enum declara si puede diferirse:

- **Immediate (`deferrable: false`)** — 01-04. Se llenan con el paciente presente. Sin esto, la consulta no tiene base clínica para seguir.
- **Deferrable (`deferrable: true`)** — 05-10. Dependen de resultados, evolución o decisión final. Pueden quedar vacías mientras la consulta está en estado `paused`.

### Estados de consulta (pendientes de modelar — fase controller)

- `inProgress` — el médico está capturando activamente.
- `paused` — consulta abierta pero sin médico activo. Solo permitido si **todas las immediate** están llenas.
- `signed` — cierre definitivo. Exige las **10 completas** (incluida firma). No se puede revertir.

### `pauseNote` (pendiente — fase controller)

Cuando el médico pausa con secciones deferrables vacías, se le pide una nota breve que explique por qué (ej. "esperando hemograma y Rx abdominal"). Campo vive a nivel de consulta, **no** por sección.

---

## Arquitectura — dónde vive qué

```
lib/features/consultation/
├── domain/
│   └── entities/
│       └── consultation_section.dart   # enum de las 10 + grupos + deferrable
├── infrastructure/                      # (vacío hoy) datasource + repository + api
└── presentation/
    ├── views/                           # ConsultationView
    ├── sections/                        # Header, acordeón, bodies, compliance sheet
    └── controllers/                     # (futuro) AsyncNotifier de estado
```

> Nota: existen dos carpetas `consultations/` y `consultation/` en `lib/features/`:
> - `consultation/` (singular) → esta feature, captura de una consulta activa.
> - `consultations/` (plural) → historial agregado en dashboard (lista de consultas pasadas). Scope distinto.

---

## Decisiones activas / trade-offs

### Strings de UI en domain
`title`, `hint` y `group.label` del enum están en español, en capa de domain. **Correcto solo** mientras el MVP sea monolingüe. Si entra i18n, mover copy a `l10n/` con keys y dejar en domain únicamente los ids estructurales.

### `n` hardcodeado ('01'..'10') vs derivado del índice
Hardcodeado por claridad. Si se reordena el enum, hay que tocar los `n` a mano — trade-off aceptado porque el orden está fijado por norma y no debería cambiar.

### No se modeló `letter` SOAP (I/S/O/A/P) en el enum
No se usa en el shell actual. Si la `ComplianceSheet` o algún reporte lo requiere, agregarlo como campo adicional del enum.

### Sin `freezed` para el enum
Set cerrado de 10, sin copy/serialización — enum nativo de Dart es más barato y garantiza exhaustividad en `switch`. `freezed` se reserva para el estado del formulario (valores capturados) que vendrá con el controller.

---

## Plan de construcción (histórico — referencia)

Se trabaja por partes para mantener el contexto pequeño y revisable.

1. ✅ Entity `ConsultationSection` (fijar las 10 + grupos + deferrable).
2. ⏳ Shell UI: `ConsultationView` + header con progress + 10 acordeones vacíos.
3. ⏳ Bodies por sección (identification → signature).
4. ⏳ `AIBar` persistente + integración con recording.
5. ⏳ `ComplianceSheet` (bottom sheet con checklist).
6. ⏳ Firma bloqueada + barra inferior de completitud.
7. ⏳ Controller + state (`inProgress`/`paused`/`signed`) + `pauseNote`.
8. ⏳ Infrastructure: POST al backend, datasource, repository.
