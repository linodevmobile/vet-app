// Consultation canvas — rediseño respetando los 10 puntos obligatorios (Comvezcol).
// El contenido NO se recorta. Lo que cambia:
//  - Ya no es un wizard lineal: canvas de scroll con 10 acordeones.
//  - Indicador de completitud global (no barra de "paso X de 10").
//  - Saltos libres entre secciones. AI contextual por sección.
//  - Firma bloqueada hasta que los 10 estén completos (o marcados N/A justificado).

// Las 10 secciones obligatorias (orden editable pero fiel al requerimiento Comvezcol):
const SECTIONS = [
  { id: 'identification', n: '01', letter: 'I',  title: 'Identificación',            hint: 'Paciente y propietario',         group: 'Registro' },
  { id: 'anamnesis',      n: '02', letter: 'S',  title: 'Anamnesis',                 hint: 'Historia clínica actual',        group: 'Subjetivo' },
  { id: 'exam',           n: '03', letter: 'O',  title: 'Examen físico',             hint: 'Constantes + hallazgos',         group: 'Objetivo' },
  { id: 'problems',       n: '04', letter: 'O',  title: 'Lista de problemas',        hint: 'Hallazgos clínicos detectados',  group: 'Objetivo' },
  { id: 'differential',   n: '05', letter: 'A',  title: 'Abordaje diagnóstico',      hint: 'Diferenciales y razonamiento',   group: 'Assessment' },
  { id: 'labs',           n: '06', letter: 'A',  title: 'Exámenes complementarios',  hint: 'Laboratorio, imagen',            group: 'Assessment' },
  { id: 'diagnosis',      n: '07', letter: 'A',  title: 'Diagnóstico clínico',       hint: 'Presuntivo y definitivo',        group: 'Assessment' },
  { id: 'plan',           n: '08', letter: 'P',  title: 'Plan terapéutico',          hint: 'Medicación y posología',         group: 'Plan' },
  { id: 'prognosis',      n: '09', letter: 'P',  title: 'Pronóstico y evolución',    hint: 'Expectativa clínica',            group: 'Plan' },
  { id: 'signature',      n: '10', letter: 'P',  title: 'Observaciones y firma',     hint: 'Firma hológrafa del profesional', group: 'Cierre' },
];

function Consultation({ goto }) {
  const [recording, setRecording] = React.useState(false);
  const [activeSection, setActiveSection] = React.useState('anamnesis');
  const [collapsed, setCollapsed] = React.useState({});
  const [showChecklist, setShowChecklist] = React.useState(false);
  const [showHospitalize, setShowHospitalize] = React.useState(false);
  const [showPause, setShowPause] = React.useState(false);

  const [values, setValues] = React.useState({
    reason: 'Vómitos intermitentes y heces blandas desde hace 24h',
    identification: 'Thor · Labrador ♂ · 7 años · 32.4 kg · Julian Smith · +34 612 345 678',
    anamnesis: '',
    temp: '38.5', fc: '120', fr: '24', weight: '32.4',
    exam: '',
    problems: '',
    differential: '',
    labs: '',
    diagnosis: '',
    plan: '',
    prognosis: '',
    signature: '',
  });

  const toggle = id => setCollapsed(c => ({ ...c, [id]: !c[id] }));
  const isFilled = id => {
    if (id === 'exam') return !!values.exam;
    if (id === 'identification') return !!values.identification;
    return !!values[id];
  };
  const completed = SECTIONS.filter(s => isFilled(s.id)).length;
  const pct = Math.round((completed / SECTIONS.length) * 100);
  const canSign = completed === SECTIONS.length;

  // AI fill — contextual por sección
  React.useEffect(() => {
    if (!recording) return;
    const t = setTimeout(() => {
      setRecording(false);
      setValues(v => {
        const fills = {
          anamnesis:    'Dueño refiere vómitos amarillentos 3x/día durante las últimas 24h. Heces blandas sin sangre. Cambio reciente de alimento hace 4 días. Bebe agua con normalidad. No hay letargia severa. Vacunas al día. Sin antecedentes de cuerpo extraño.',
          exam:         'Alerta, hidratación 5-7%. Mucosas rosadas, TLLC < 2s. Abdomen sensible a palpación profunda cranial, sin masas palpables. Linfonodos normales. Auscultación cardiopulmonar sin alteraciones.',
          problems:     '1. Vómitos agudos (24h)\n2. Diarrea sin sangre\n3. Deshidratación leve 5-7%\n4. Dolor abdominal cranial a la palpación',
          differential: 'DD principales:\n• Gastroenteritis alimentaria (muy probable por cambio de dieta)\n• Cuerpo extraño gastrointestinal (requiere Rx)\n• Parasitosis (requiere coprológico)\n• Pancreatitis aguda incipiente',
          labs:         'Hemograma + química básica solicitados. Rx abdominal lateral para descartar cuerpo extraño. Coprológico seriado 3 días. Resultados esperados en 48h.',
          diagnosis:    'Presuntivo: Gastroenteritis aguda de origen alimentario.\nDefinitivo: pendiente de resultados de laboratorio.',
          plan:         'Dieta blanda (pollo + arroz) por 48h.\nMetronidazol 15 mg/kg VO c/12h × 7 días.\nOmeprazol 1 mg/kg VO c/24h × 10 días.\nFluidoterapia SC si empeora hidratación.\nControl presencial en 72h.',
          prognosis:    'Pronóstico favorable en 5-7 días si responde a tratamiento dietético y farmacológico. Reservado si aparece sangre en heces o persisten vómitos > 48h pese al tratamiento.',
          signature:    'Se entrega copia al propietario con indicaciones de alarma: deshidratación severa, vómitos persistentes, letargia marcada → acudir a urgencias.',
        };
        return fills[activeSection] ? { ...v, [activeSection]: fills[activeSection] } : v;
      });
    }, 1800);
    return () => clearTimeout(t);
  }, [recording, activeSection]);

  return (
    <div style={{ paddingBottom: 140 }}>
      <ConsultHeader goto={goto} pct={pct} completed={completed} total={SECTIONS.length} onOpenChecklist={() => setShowChecklist(true)} onPause={() => setShowPause(true)}/>

      <div style={{ padding: '12px 16px 24px' }}>
        {/* Motivo — siempre visible */}
        <Field label="Motivo de consulta">
          <TextInput
            value={values.reason}
            onChange={v => setValues({ ...values, reason: v })}
            style={{ fontSize: 15, fontWeight: 500 }}
          />
        </Field>

        {/* Escalada rápida: convertir a ingreso hospitalario */}
        <button onClick={() => setShowHospitalize(true)} style={{
          marginTop: 10, width: '100%',
          padding: '10px 12px', borderRadius: 10,
          border: `1px dashed ${T.urgent}55`, background: `${T.urgent}08`,
          display: 'flex', alignItems: 'center', gap: 10, cursor: 'pointer',
          fontFamily: T.sans,
        }}>
          <div style={{
            width: 28, height: 28, borderRadius: 8,
            background: `${T.urgent}15`, color: T.urgent,
            display: 'flex', alignItems: 'center', justifyContent: 'center',
          }}>
            <Icon name="alert" size={14}/>
          </div>
          <div style={{ flex: 1, textAlign: 'left' }}>
            <div style={{ fontSize: 12, fontWeight: 600, color: T.urgent }}>
              ¿Caso crítico? Convertir a ingreso
            </div>
            <div style={{ fontSize: 10, color: T.ink60 }}>
              Envía a hospitalización sin cerrar la historia
            </div>
          </div>
          <Icon name="chevronR" size={14} color={T.urgent}/>
        </button>

        {/* 10 secciones como acordeones */}
        <div style={{ marginTop: 16, display: 'flex', flexDirection: 'column', gap: 8 }}>
          {SECTIONS.map((s, i) => {
            const prevGroup = i > 0 ? SECTIONS[i-1].group : null;
            const showGroup = s.group !== prevGroup;
            return (
              <React.Fragment key={s.id}>
                {showGroup && <GroupHeader label={s.group}/>}
                <Section
                  s={s}
                  active={activeSection === s.id}
                  onFocus={() => setActiveSection(s.id)}
                  collapsed={collapsed[s.id]}
                  onToggle={() => toggle(s.id)}
                  filled={isFilled(s.id)}
                  recording={recording && activeSection === s.id}
                >
                  <SectionBody id={s.id} values={values} setValues={setValues} recording={recording} activeSection={activeSection} goto={goto}/>
                </Section>
              </React.Fragment>
            );
          })}
        </div>
      </div>

      {/* Mic persistente */}
      <AIBar
        recording={recording}
        onToggle={() => setRecording(!recording)}
        activeSection={activeSection}
      />

      {/* Barra inferior: completitud + firma */}
      <div style={{
        position: 'absolute', bottom: 40, left: 0, right: 0,
        padding: '10px 16px',
        background: 'linear-gradient(to top, #F6F5F2 70%, rgba(246,245,242,0))',
      }}>
        <div style={{
          display: 'flex', alignItems: 'center', gap: 10,
          padding: '10px 12px', background: T.surface,
          border: `1px solid ${T.line}`, borderRadius: 12, marginBottom: 8,
          cursor: 'pointer',
        }} onClick={() => setShowChecklist(true)}>
          <div style={{
            width: 32, height: 32, borderRadius: 8,
            background: canSign ? T.ok : T.surfaceAlt,
            color: canSign ? '#fff' : T.ink80,
            display: 'flex', alignItems: 'center', justifyContent: 'center',
            fontFamily: T.mono, fontSize: 11, fontWeight: 600,
          }}>{completed}/10</div>
          <div style={{ flex: 1 }}>
            <div style={{ fontSize: 12, fontWeight: 600, color: T.ink }}>
              {canSign ? 'Historia completa · lista para firmar' : `Faltan ${10 - completed} secciones obligatorias`}
            </div>
            <div style={{ fontSize: 10, color: T.ink40, fontFamily: T.mono, textTransform: 'uppercase', letterSpacing: 0.6 }}>
              Exigido por Comvezcol · Res. 8430
            </div>
          </div>
          <Icon name="chevronR" size={14} color={T.ink40}/>
        </div>
        <Btn variant={canSign ? 'ai' : 'secondary'} size="lg" full icon={canSign ? 'check' : 'alert'} disabled={!canSign} onClick={() => canSign && goto('dashboard')}>
          {canSign ? 'Firmar y cerrar historia' : 'Completa las 10 secciones para firmar'}
        </Btn>
      </div>

      {/* Modal checklist regulatorio */}
      {showChecklist && (
        <ComplianceSheet
          sections={SECTIONS}
          isFilled={isFilled}
          onJump={(id) => { setShowChecklist(false); setActiveSection(id); setCollapsed(c => ({ ...c, [id]: false })); }}
          onClose={() => setShowChecklist(false)}
        />
      )}

      {/* Convertir a ingreso hospitalario */}
      {showHospitalize && (
        <HospitalizeSheet
          patient="Thor"
          reason={values.reason}
          dx={values.differential || values.diagnosis}
          onClose={() => setShowHospitalize(false)}
          onConfirm={() => { setShowHospitalize(false); goto('hospital-patient', { patient: 'Thor' }); }}
        />
      )}

      {/* Pausar consulta — el médico sigue trabajando, consulta queda abierta */}
      {showPause && (
        <PauseSheet
          patient="Thor"
          completed={completed}
          total={SECTIONS.length}
          onClose={() => setShowPause(false)}
          onConfirm={() => { setShowPause(false); goto('dashboard'); }}
        />
      )}
    </div>
  );
}

function PauseSheet({ patient, completed, total, onClose, onConfirm }) {
  const [reason, setReason] = React.useState('labs');
  const [note, setNote] = React.useState('');
  const reasons = [
    { id: 'labs',         label: 'Esperando laboratorios',  hint: 'Hemograma, química, coprológico' },
    { id: 'imaging',      label: 'Esperando imagen',         hint: 'Rx, ecografía, TAC' },
    { id: 'procedure',    label: 'Procedimiento en curso',   hint: 'Sedación, curación, muestra' },
    { id: 'owner',        label: 'Dueño ausente',            hint: 'Salió a buscar algo, regresa luego' },
    { id: 'other',        label: 'Otro motivo',              hint: 'Describir abajo' },
  ];

  return (
    <div onClick={onClose} style={{
      position: 'absolute', inset: 0, background: 'rgba(10,9,8,0.5)',
      zIndex: 200, display: 'flex', alignItems: 'flex-end',
    }}>
      <div onClick={e => e.stopPropagation()} style={{
        width: '100%', background: T.surface,
        borderRadius: '20px 20px 0 0', maxHeight: '85%', overflow: 'auto',
      }}>
        <div style={{ display: 'flex', justifyContent: 'center', padding: 10 }}>
          <div style={{ width: 36, height: 4, background: T.line, borderRadius: 2 }}/>
        </div>
        <div style={{ padding: '0 18px 20px' }}>
          <div style={{ fontSize: 10, color: T.warn, fontFamily: T.mono, letterSpacing: 1.2, textTransform: 'uppercase', marginBottom: 4 }}>
            Pausar consulta
          </div>
          <h2 style={{ margin: 0, fontSize: 20, fontWeight: 600, letterSpacing: -0.4 }}>
            Guardar progreso de {patient}
          </h2>
          <div style={{ fontSize: 12, color: T.ink60, marginTop: 4, lineHeight: 1.4 }}>
            La consulta queda abierta en tu dashboard. Puedes retomarla cuando los resultados estén listos.
          </div>

          <div style={{
            marginTop: 14, padding: '10px 12px', background: T.surfaceAlt, borderRadius: 10,
            display: 'flex', alignItems: 'center', gap: 10,
          }}>
            <div style={{
              width: 32, height: 32, borderRadius: 8, background: T.surface,
              color: T.ink, display: 'flex', alignItems: 'center', justifyContent: 'center',
              fontFamily: T.mono, fontSize: 11, fontWeight: 600,
            }}>{completed}/{total}</div>
            <div style={{ flex: 1 }}>
              <div style={{ fontSize: 12, fontWeight: 600, color: T.ink }}>Progreso guardado</div>
              <div style={{ fontSize: 10, color: T.ink40 }}>Las {completed} secciones completadas permanecen intactas</div>
            </div>
          </div>

          <div style={{ marginTop: 18, marginBottom: 8, fontSize: 11, color: T.ink40, fontFamily: T.mono, textTransform: 'uppercase', letterSpacing: 0.8 }}>
            Motivo de pausa
          </div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
            {reasons.map(r => {
              const active = reason === r.id;
              return (
                <button key={r.id} onClick={() => setReason(r.id)} style={{
                  width: '100%', textAlign: 'left',
                  padding: '10px 12px', borderRadius: 10,
                  border: `1px solid ${active ? T.ink : T.line}`,
                  background: active ? T.ink : T.surface, color: active ? '#fff' : T.ink,
                  cursor: 'pointer', display: 'flex', alignItems: 'center', gap: 10,
                  fontFamily: T.sans,
                }}>
                  <div style={{
                    width: 16, height: 16, borderRadius: '50%',
                    border: `1.5px solid ${active ? '#fff' : T.line}`,
                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                  }}>
                    {active && <div style={{ width: 7, height: 7, borderRadius: '50%', background: '#fff' }}/>}
                  </div>
                  <div style={{ flex: 1 }}>
                    <div style={{ fontSize: 13, fontWeight: 600 }}>{r.label}</div>
                    <div style={{ fontSize: 11, color: active ? 'rgba(255,255,255,0.65)' : T.ink40, marginTop: 1 }}>{r.hint}</div>
                  </div>
                </button>
              );
            })}
          </div>

          {reason === 'other' && (
            <div style={{ marginTop: 10 }}>
              <TextInput placeholder="Describe el motivo..." value={note} onChange={setNote} multiline rows={2}/>
            </div>
          )}

          <div style={{ display: 'flex', gap: 8, marginTop: 18 }}>
            <Btn variant="secondary" size="md" full onClick={onClose}>Cancelar</Btn>
            <Btn variant="primary" size="md" full icon="pause" onClick={onConfirm}>
              Pausar
            </Btn>
          </div>
        </div>
      </div>
    </div>
  );
}

function ConsultHeader({ goto, pct, completed, total, onOpenChecklist, onPause }) {
  return (
    <div style={{
      background: T.surface, borderBottom: `1px solid ${T.line}`,
      padding: '12px 16px 10px', position: 'sticky', top: 0, zIndex: 15,
    }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 10 }}>
        <button onClick={() => goto('patient', { patient: 'Thor' })} style={{
          width: 32, height: 32, borderRadius: 8, border: `1px solid ${T.line}`,
          background: T.surface, display: 'flex', alignItems: 'center', justifyContent: 'center',
          cursor: 'pointer',
        }}>
          <Icon name="back" size={14} color={T.ink60}/>
        </button>
        <PetAvatar species="dog" size={32} urgent/>
        <div style={{ flex: 1, minWidth: 0 }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: 6 }}>
            <span style={{ fontSize: 14, fontWeight: 600 }}>Thor</span>
            <span style={{ fontSize: 11, color: T.ink40 }}>· Labrador · 32.4 kg</span>
          </div>
          <div style={{ fontSize: 10, color: T.ok, fontFamily: T.mono, textTransform: 'uppercase', letterSpacing: 0.6 }}>
            Guardado · Hace 4s
          </div>
        </div>
        <button onClick={onOpenChecklist} style={{
          padding: '5px 9px', borderRadius: 999,
          border: `1px solid ${T.line}`, background: T.surface,
          display: 'flex', alignItems: 'center', gap: 5, cursor: 'pointer',
          fontSize: 11, fontWeight: 600, color: T.ink80, fontFamily: T.sans,
        }}>
          <span style={{ fontFamily: T.mono }}>{completed}/{total}</span>
          <Icon name="chevronD" size={12} color={T.ink40}/>
        </button>
        <button onClick={onPause} title="Pausar consulta" style={{
          width: 32, height: 32, borderRadius: 8, border: `1px solid ${T.warn}55`,
          background: `${T.warn}10`, display: 'flex', alignItems: 'center', justifyContent: 'center',
          cursor: 'pointer',
        }}>
          <Icon name="pause" size={13} color={T.warn}/>
        </button>
      </div>
      {/* Progreso de completitud regulatoria */}
      <div style={{
        height: 3, background: T.surfaceAlt, borderRadius: 2, overflow: 'hidden',
      }}>
        <div style={{
          width: `${pct}%`, height: '100%',
          background: pct === 100 ? T.ok : T.accent,
          transition: 'width 0.3s',
        }}/>
      </div>
    </div>
  );
}

function GroupHeader({ label }) {
  return (
    <div style={{
      fontSize: 9, color: T.ink40, fontFamily: T.mono,
      textTransform: 'uppercase', letterSpacing: 1.2, fontWeight: 600,
      padding: '8px 4px 2px',
    }}>{label}</div>
  );
}

function Section({ s, active, onFocus, collapsed, onToggle, filled, recording, children }) {
  return (
    <div onClick={onFocus} style={{
      background: T.surface, borderRadius: T.r3,
      border: `1px solid ${active ? T.ink : T.line}`,
      transition: 'border 0.15s',
    }}>
      <div onClick={onToggle} style={{
        padding: '12px 14px', display: 'flex', alignItems: 'center', gap: 10,
        cursor: 'pointer',
      }}>
        <div style={{
          width: 30, height: 30, borderRadius: 8,
          background: filled ? T.accent : T.surfaceAlt,
          color: filled ? '#fff' : T.ink60,
          display: 'flex', alignItems: 'center', justifyContent: 'center',
          fontFamily: T.mono, fontSize: 11, fontWeight: 600,
          letterSpacing: 0.4, flexShrink: 0,
        }}>
          {filled ? <Icon name="check" size={14}/> : s.n}
        </div>
        <div style={{ flex: 1, minWidth: 0 }}>
          <div style={{ fontSize: 13, fontWeight: 600, color: T.ink, letterSpacing: -0.1 }}>{s.title}</div>
          <div style={{ fontSize: 11, color: T.ink40 }}>{s.hint}</div>
        </div>
        {recording && <RecordingDot/>}
        {!filled && !recording && (
          <Chip tone="outline" size="xs">Pendiente</Chip>
        )}
        <Icon name={collapsed ? 'chevronR' : 'chevronD'} size={14} color={T.ink40}/>
      </div>
      {!collapsed && <div style={{ padding: '0 14px 14px' }}>{children}</div>}
    </div>
  );
}

function SectionBody({ id, values, setValues, recording, activeSection, goto }) {
  const ai = recording && activeSection === id;
  const update = (k, v) => setValues(s => ({ ...s, [k]: v }));

  if (id === 'identification') {
    return (
      <>
        <div style={{
          padding: 10, background: T.accentSoft, borderRadius: 8,
          fontSize: 12, color: T.accentInk, marginBottom: 10,
          display: 'flex', gap: 8, alignItems: 'flex-start',
        }}>
          <Icon name="check" size={14} color={T.accent} style={{ marginTop: 2 }}/>
          <div>
            <b>Prellenado desde ficha.</b> Datos sincronizados con el registro permanente del paciente.
          </div>
        </div>
        <TextInput multiline rows={2} value={values.identification} onChange={v => update('identification', v)}/>
      </>
    );
  }

  if (id === 'exam') {
    return (
      <>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 8, marginBottom: 12 }}>
          <Vital icon="thermo" label="Temp"  value={values.temp}   unit="°C"  onChange={v => update('temp', v)}/>
          <Vital icon="heart"  label="FC"    value={values.fc}     unit="ppm" onChange={v => update('fc', v)}/>
          <Vital icon="lungs"  label="FR"    value={values.fr}     unit="rpm" onChange={v => update('fr', v)}/>
          <Vital icon="weight" label="Peso"  value={values.weight} unit="kg"  onChange={v => update('weight', v)} alert="+0.3"/>
        </div>
        <TextInput multiline rows={3} placeholder="Observaciones del examen…" value={values.exam} onChange={v => update('exam', v)} aiActive={ai}/>
      </>
    );
  }

  if (id === 'differential') {
    return (
      <>
        <TextInput multiline rows={3} placeholder="Razonamiento clínico, diagnósticos diferenciales…" value={values.differential} onChange={v => update('differential', v)} aiActive={ai}/>
        {values.differential && (
          <div style={{ marginTop: 10, display: 'flex', flexDirection: 'column', gap: 6 }}>
            {[
              ['Gastroenteritis alimentaria', 'Probable', T.accent],
              ['Cuerpo extraño',              'Rx pendiente', T.warn],
              ['Parasitosis',                  'Coprológico', T.ink40],
            ].map(([d, note, color], i) => (
              <div key={i} style={{
                display: 'flex', alignItems: 'center', gap: 10,
                padding: '8px 10px', background: T.surfaceAlt,
                borderRadius: 8, border: `1px solid ${T.lineSoft}`,
              }}>
                <div style={{ width: 6, height: 6, borderRadius: '50%', background: color }}/>
                <span style={{ fontSize: 13, fontWeight: 500, flex: 1 }}>{d}</span>
                <span style={{ fontSize: 11, color: T.ink40 }}>{note}</span>
              </div>
            ))}
          </div>
        )}
      </>
    );
  }

  if (id === 'labs') {
    return (
      <>
        <TextInput multiline rows={2} placeholder="Exámenes solicitados y resultados…" value={values.labs} onChange={v => update('labs', v)} aiActive={ai}/>
        <button style={{
          marginTop: 8, width: '100%', padding: 10, borderRadius: 8,
          border: `1px dashed ${T.ink20}`, background: 'transparent',
          color: T.ink60, fontSize: 12, fontFamily: T.sans, cursor: 'pointer',
          display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 6,
        }}>
          <Icon name="plus" size={12}/> Adjuntar resultado (PDF, imagen)
        </button>
      </>
    );
  }

  if (id === 'plan') {
    return (
      <>
        <TextInput multiline rows={3} placeholder="Tratamiento, medicación, posología…" value={values.plan} onChange={v => update('plan', v)} aiActive={ai}/>
        {values.plan && (
          <div style={{ marginTop: 12 }}>
            <div style={{ fontSize: 10, color: T.ink40, fontFamily: T.mono, textTransform: 'uppercase', letterSpacing: 0.6, marginBottom: 6 }}>
              Medicación detectada ✦
            </div>
            <div style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
              <MedRow name="Metronidazol" dose="15 mg/kg" freq="c/12h" dur="7 días"/>
              <MedRow name="Omeprazol"    dose="1 mg/kg"  freq="c/24h" dur="10 días"/>
            </div>
          </div>
        )}
      </>
    );
  }

  if (id === 'signature') {
    return (
      <>
        <TextInput multiline rows={2} placeholder="Observaciones generales, indicaciones al propietario…" value={values.signature} onChange={v => update('signature', v)} aiActive={ai}/>
        <div style={{
          marginTop: 10, padding: 12, background: T.surfaceAlt,
          border: `1px dashed ${T.ink20}`, borderRadius: 10,
          display: 'flex', alignItems: 'center', gap: 10,
        }}>
          <div style={{
            width: 40, height: 40, borderRadius: 10, background: T.surface,
            display: 'flex', alignItems: 'center', justifyContent: 'center',
            border: `1px solid ${T.line}`,
          }}>
            <Icon name="edit" size={18} color={T.ink60}/>
          </div>
          <div style={{ flex: 1 }}>
            <div style={{ fontSize: 12, fontWeight: 600 }}>Dra. Mariana Rivas</div>
            <div style={{ fontSize: 10, color: T.ink40, fontFamily: T.mono }}>MV · Reg. 12.845</div>
          </div>
          <Btn size="sm" variant="secondary">Firmar</Btn>
        </div>
      </>
    );
  }

  // Anamnesis, problems, diagnosis, prognosis — texto libre
  const placeholders = {
    anamnesis:  'Historia clínica actual, antecedentes, sintomatología…',
    problems:   'Enumera los problemas detectados (uno por línea)…',
    diagnosis:  'Diagnóstico presuntivo y definitivo…',
    prognosis:  'Pronóstico esperado y evolución clínica observada…',
  };
  return <TextInput multiline rows={4} placeholder={placeholders[id]} value={values[id]} onChange={v => update(id, v)} aiActive={ai}/>;
}

function ComplianceSheet({ sections, isFilled, onJump, onClose }) {
  const completed = sections.filter(s => isFilled(s.id)).length;
  return (
    <div onClick={onClose} style={{
      position: 'absolute', inset: 0, background: 'rgba(0,0,0,0.35)',
      zIndex: 100, display: 'flex', alignItems: 'flex-end',
      animation: 'fadeIn 0.2s ease-out',
    }}>
      <div onClick={e => e.stopPropagation()} style={{
        width: '100%', background: T.bg,
        borderTopLeftRadius: 24, borderTopRightRadius: 24,
        padding: '10px 16px 32px', maxHeight: '82%', overflow: 'auto',
      }}>
        <div style={{
          width: 40, height: 4, borderRadius: 2, background: T.ink20,
          margin: '4px auto 14px',
        }}/>
        <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', marginBottom: 14 }}>
          <div>
            <div style={{
              fontSize: 10, color: T.ink40, fontFamily: T.mono,
              textTransform: 'uppercase', letterSpacing: 1.2, marginBottom: 2,
            }}>Requisito regulatorio</div>
            <h3 style={{ margin: 0, fontSize: 18, fontWeight: 600, letterSpacing: -0.3 }}>
              Historia clínica · Comvezcol
            </h3>
            <div style={{ fontSize: 11, color: T.ink60, marginTop: 2 }}>
              Res. 8430 · Los 10 puntos son obligatorios.
            </div>
          </div>
          <div style={{
            width: 52, height: 52, borderRadius: '50%',
            background: completed === 10 ? T.ok : T.surface,
            border: `2px solid ${completed === 10 ? T.ok : T.accent}`,
            color: completed === 10 ? '#fff' : T.accent,
            display: 'flex', alignItems: 'center', justifyContent: 'center',
            fontFamily: T.mono, fontSize: 13, fontWeight: 700,
          }}>{completed}/10</div>
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
          {sections.map(s => {
            const ok = isFilled(s.id);
            return (
              <div key={s.id} onClick={() => onJump(s.id)} style={{
                display: 'flex', alignItems: 'center', gap: 12,
                padding: '10px 12px',
                background: T.surface, borderRadius: 10,
                border: `1px solid ${T.line}`, cursor: 'pointer',
              }}>
                <div style={{
                  width: 24, height: 24, borderRadius: 6,
                  background: ok ? T.ok : T.surfaceAlt,
                  color: ok ? '#fff' : T.ink40,
                  display: 'flex', alignItems: 'center', justifyContent: 'center',
                  flexShrink: 0,
                }}>
                  {ok ? <Icon name="check" size={14}/> : <span style={{ fontFamily: T.mono, fontSize: 10, fontWeight: 600 }}>{s.n}</span>}
                </div>
                <div style={{ flex: 1 }}>
                  <div style={{ fontSize: 13, fontWeight: 500, color: T.ink }}>{s.title}</div>
                  <div style={{ fontSize: 10, color: T.ink40, fontFamily: T.mono, textTransform: 'uppercase', letterSpacing: 0.6 }}>
                    {ok ? 'Completo' : 'Pendiente'}
                  </div>
                </div>
                <Icon name="chevronR" size={14} color={T.ink40}/>
              </div>
            );
          })}
        </div>

        <div style={{
          marginTop: 14, padding: 12, background: T.aiSoft,
          borderRadius: 10, border: `1px solid ${T.ai}33`,
          fontSize: 11, color: T.ink80, lineHeight: 1.5,
          display: 'flex', gap: 10,
        }}>
          <Icon name="sparkle" size={16} color={T.ai} style={{ flexShrink: 0, marginTop: 1 }}/>
          <div>
            Puedes dictar cualquier sección con el micrófono. La IA reconoce el contexto y completa
            solo el campo activo. Nada se firma hasta que los 10 estén verificados.
          </div>
        </div>
      </div>
    </div>
  );
}

function Vital({ icon, label, value, unit, onChange, alert }) {
  return (
    <div style={{
      background: T.surfaceAlt, borderRadius: 10,
      padding: '8px 10px', border: `1px solid ${T.lineSoft}`,
    }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 4, marginBottom: 2 }}>
        <Icon name={icon} size={11} color={T.ink40}/>
        <span style={{ fontSize: 9, color: T.ink40, fontFamily: T.mono, textTransform: 'uppercase', letterSpacing: 0.6 }}>{label}</span>
      </div>
      <div style={{ display: 'flex', alignItems: 'baseline', gap: 2 }}>
        <input
          value={value}
          onChange={e => onChange?.(e.target.value)}
          style={{
            width: '100%', border: 'none', background: 'transparent', outline: 'none',
            fontSize: 15, fontWeight: 600, color: T.ink, fontFamily: T.sans, padding: 0,
            letterSpacing: -0.4,
          }}
        />
        <span style={{ fontSize: 9, color: T.ink40, fontFamily: T.mono }}>{unit}</span>
      </div>
      {alert && <div style={{ fontSize: 9, color: T.warn, fontFamily: T.mono, marginTop: 1 }}>{alert}</div>}
    </div>
  );
}

function MedRow({ name, dose, freq, dur }) {
  return (
    <div style={{
      display: 'flex', alignItems: 'center', gap: 10,
      padding: '10px', background: T.aiSoft,
      borderRadius: 8, border: `1px solid ${T.ai}33`,
    }}>
      <div style={{
        width: 26, height: 26, borderRadius: 6,
        background: '#fff', color: T.ai,
        display: 'flex', alignItems: 'center', justifyContent: 'center',
      }}>
        <Icon name="pill" size={14}/>
      </div>
      <div style={{ flex: 1 }}>
        <div style={{ fontSize: 13, fontWeight: 600, color: T.ink }}>{name}</div>
        <div style={{ fontSize: 10, color: T.ink60, fontFamily: T.mono }}>
          {dose} · {freq} · {dur}
        </div>
      </div>
      <Icon name="edit" size={14} color={T.ink40}/>
    </div>
  );
}

function RecordingDot() {
  return (
    <div style={{ display: 'flex', alignItems: 'center', gap: 4 }}>
      <div style={{
        width: 7, height: 7, borderRadius: '50%',
        background: T.urgent,
        animation: 'pulse 1.2s ease-in-out infinite',
      }}/>
      <span style={{ fontSize: 10, color: T.urgent, fontFamily: T.mono, fontWeight: 600 }}>REC</span>
    </div>
  );
}

function AIBar({ recording, onToggle, activeSection }) {
  const labelMap = {
    identification: 'Identificación',
    anamnesis: 'Anamnesis',
    exam: 'Examen físico',
    problems: 'Lista de problemas',
    differential: 'Abordaje diagnóstico',
    labs: 'Exámenes complementarios',
    diagnosis: 'Diagnóstico clínico',
    plan: 'Plan terapéutico',
    prognosis: 'Pronóstico',
    signature: 'Observaciones',
  };
  return (
    <div style={{
      position: 'absolute', bottom: 170, left: 16, right: 16, zIndex: 20,
    }}>
      <div style={{
        display: 'flex', alignItems: 'center', gap: 10,
        background: '#1A1915', color: '#fff',
        borderRadius: 999, padding: '6px 8px 6px 16px',
        boxShadow: '0 8px 24px rgba(0,0,0,0.18), 0 2px 6px rgba(0,0,0,0.08)',
        border: `1px solid ${recording ? T.urgent : 'rgba(255,255,255,0.15)'}`,
      }}>
        <Icon name="sparkle" size={14} color={recording ? T.urgent : '#E6D9B1'}/>
        <div style={{ flex: 1, minWidth: 0 }}>
          <div style={{ fontSize: 10, color: 'rgba(255,255,255,0.5)', fontFamily: T.mono, textTransform: 'uppercase', letterSpacing: 0.6 }}>
            {recording ? 'Escuchando…' : 'Dictar a'}
          </div>
          <div style={{ fontSize: 13, fontWeight: 500, overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
            {recording ? <Waveform/> : (labelMap[activeSection] || 'la sección activa')}
          </div>
        </div>
        <button onClick={onToggle} style={{
          width: 44, height: 44, borderRadius: '50%',
          background: recording ? T.urgent : '#fff',
          color: recording ? '#fff' : T.ink,
          border: 'none', display: 'flex', alignItems: 'center', justifyContent: 'center',
          cursor: 'pointer', flexShrink: 0,
        }}>
          <Icon name={recording ? 'stop' : 'mic'} size={18}/>
        </button>
      </div>
    </div>
  );
}

function Waveform() {
  return (
    <div style={{ display: 'flex', alignItems: 'center', gap: 2, height: 16 }}>
      {[6, 12, 4, 14, 8, 10, 4, 12, 6, 14, 8, 6, 10, 14, 8, 4, 12, 6, 10, 14].map((h, i) => (
        <div key={i} style={{
          width: 2, height: h, background: '#fff', borderRadius: 1,
          animation: `wave 0.8s ease-in-out ${i * 0.04}s infinite alternate`,
        }}/>
      ))}
    </div>
  );
}

function HospitalizeSheet({ patient, reason, dx, onClose, onConfirm }) {
  const [motivo, setMotivo] = React.useState(dx || reason || '');
  const [plan, setPlan] = React.useState('');
  const [priority, setPriority] = React.useState('stable');

  const priorities = [
    { id: 'critical', label: 'Crítico', color: T.urgent },
    { id: 'watch',    label: 'Vigilancia', color: T.warning },
    { id: 'stable',   label: 'Estable', color: T.ok },
  ];

  return (
    <div onClick={onClose} style={{
      position: 'absolute', inset: 0, background: 'rgba(14,23,38,0.55)',
      zIndex: 40, display: 'flex', alignItems: 'flex-end',
    }}>
      <div onClick={e => e.stopPropagation()} style={{
        width: '100%', background: T.surface, borderRadius: '20px 20px 0 0',
        padding: '18px 18px 24px', maxHeight: '85%', overflowY: 'auto',
      }}>
        <div style={{
          width: 36, height: 4, background: T.line, borderRadius: 2,
          margin: '0 auto 14px',
        }}/>

        <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 4 }}>
          <div style={{
            width: 32, height: 32, borderRadius: 10,
            background: `${T.urgent}15`, color: T.urgent,
            display: 'flex', alignItems: 'center', justifyContent: 'center',
          }}>
            <Icon name="alert" size={16}/>
          </div>
          <div>
            <div style={{ fontSize: 16, fontWeight: 600 }}>Convertir a ingreso</div>
            <div style={{ fontSize: 11, color: T.ink60, fontFamily: T.mono, textTransform: 'uppercase', letterSpacing: 0.6 }}>
              {patient} · Hospitalización
            </div>
          </div>
        </div>

        <div style={{
          marginTop: 14, padding: 10, background: T.accentSoft, borderRadius: 8,
          fontSize: 11, color: T.accent, lineHeight: 1.5,
        }}>
          La consulta queda guardada como borrador. Podrás completarla desde la ficha del
          paciente una vez esté estabilizado.
        </div>

        <div style={{ marginTop: 16 }}>
          <Field label="Motivo de ingreso">
            <TextInput
              value={motivo}
              onChange={setMotivo}
              placeholder="Ej. Gastroenteritis aguda con deshidratación"
              multiline rows={2}
            />
          </Field>
        </div>

        <div style={{ marginTop: 12 }}>
          <Field label="Prioridad clínica">
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 6, marginTop: 2 }}>
              {priorities.map(p => (
                <button key={p.id} onClick={() => setPriority(p.id)} style={{
                  padding: '10px 6px', borderRadius: 10,
                  border: `1px solid ${priority === p.id ? p.color : T.line}`,
                  background: priority === p.id ? `${p.color}12` : T.surface,
                  color: priority === p.id ? p.color : T.ink80,
                  fontSize: 12, fontWeight: 600, cursor: 'pointer',
                  fontFamily: T.sans,
                }}>{p.label}</button>
              ))}
            </div>
          </Field>
        </div>

        <div style={{ marginTop: 12 }}>
          <Field label="Plan inicial (opcional)">
            <TextInput
              value={plan}
              onChange={setPlan}
              placeholder="Fluidoterapia LR 40ml/h · Ranitidina 2mg/kg c/12h · Control vitales c/4h"
              multiline rows={3}
            />
          </Field>
          <div style={{ fontSize: 10, color: T.ink60, marginTop: 6, lineHeight: 1.5 }}>
            Podrás agregar medicamentos, fluidoterapia y tareas detalladas desde la ficha de hospital.
          </div>
        </div>

        <div style={{ display: 'flex', gap: 8, marginTop: 20 }}>
          <Btn variant="secondary" onClick={onClose} style={{ flex: 1 }}>Cancelar</Btn>
          <Btn variant="primary" icon="arrowR" onClick={onConfirm} style={{ flex: 2 }}>
            Ingresar paciente
          </Btn>
        </div>
      </div>
    </div>
  );
}

Object.assign(window, { Consultation, PauseSheet });
