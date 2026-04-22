// Patient profile — the "home base" for an existing patient.
// Shows timeline, vitals-at-a-glance, active problems, and a CLEAR primary action
// to start a new consultation (which pre-fills from this context).

function PatientProfile({ goto }) {
  const [tab, setTab] = React.useState('overview');

  return (
    <div style={{ paddingBottom: 100 }}>
      {/* Header with back */}
      <div style={{
        padding: '16px', display: 'flex', alignItems: 'center', gap: 12,
        background: T.surface, borderBottom: `1px solid ${T.line}`,
        position: 'sticky', top: 0, zIndex: 10,
      }}>
        <button onClick={() => goto('patients')} style={{
          width: 36, height: 36, borderRadius: 10, border: `1px solid ${T.line}`,
          background: T.surface, display: 'flex', alignItems: 'center', justifyContent: 'center',
          cursor: 'pointer',
        }}>
          <Icon name="back" size={16} color={T.ink60}/>
        </button>
        <div style={{ flex: 1, fontSize: 13, fontWeight: 500, color: T.ink60 }}>Ficha del paciente</div>
        <button style={{
          width: 36, height: 36, borderRadius: 10, border: `1px solid ${T.line}`,
          background: T.surface, display: 'flex', alignItems: 'center', justifyContent: 'center',
          cursor: 'pointer',
        }}>
          <Icon name="more" size={16} color={T.ink60}/>
        </button>
      </div>

      {/* Hero */}
      <div style={{ padding: '16px', background: T.surface, borderBottom: `1px solid ${T.line}` }}>
        <div style={{ display: 'flex', gap: 14, alignItems: 'flex-start' }}>
          <PetAvatar species="dog" size={68} urgent/>
          <div style={{ flex: 1, minWidth: 0 }}>
            <div style={{ display: 'flex', alignItems: 'baseline', gap: 8, flexWrap: 'wrap' }}>
              <h1 style={{ margin: 0, fontSize: 24, fontWeight: 600, letterSpacing: -0.6, color: T.ink }}>Thor</h1>
              <span style={{ fontSize: 13, color: T.ink60 }}>Labrador · ♂ · 7 años</span>
            </div>
            <div style={{ fontSize: 12, color: T.ink60, marginTop: 4 }}>
              Julian Smith · +34 612 345 678
            </div>
            <div style={{ display: 'flex', gap: 6, marginTop: 10, flexWrap: 'wrap' }}>
              <Chip tone="urgent" size="xs">Gastroenteritis activa</Chip>
              <Chip tone="warn" size="xs">Alergia a penicilina</Chip>
              <Chip tone="ok" size="xs">Vacunas al día</Chip>
            </div>
          </div>
        </div>

        {/* Vitals strip */}
        <div style={{
          display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 8,
          marginTop: 16, padding: '12px 0', borderTop: `1px solid ${T.lineSoft}`,
        }}>
          {[
            { k: 'Peso',  v: '32.4', u: 'kg', trend: '↑ 0.3' },
            { k: 'Edad',  v: '7',    u: 'años' },
            { k: 'Últ.',  v: '2h',   u: '' },
            { k: 'Visitas', v: '23', u: '' },
          ].map((m, i) => (
            <div key={i}>
              <div style={{ fontSize: 9, color: T.ink40, fontFamily: T.mono, textTransform: 'uppercase', letterSpacing: 0.6 }}>{m.k}</div>
              <div style={{ fontSize: 18, fontWeight: 600, color: T.ink, letterSpacing: -0.3 }}>
                {m.v}<span style={{ fontSize: 11, color: T.ink40, fontWeight: 400, marginLeft: 2 }}>{m.u}</span>
              </div>
              {m.trend && <div style={{ fontSize: 10, color: T.warn, fontFamily: T.mono }}>{m.trend}</div>}
            </div>
          ))}
        </div>

        {/* Primary action — obvious */}
        <Btn
          variant="primary"
          size="lg"
          full
          icon="plus"
          onClick={() => goto('consultation', { patient: 'Thor' })}
          style={{ marginTop: 14 }}
        >
          Iniciar nueva consulta
        </Btn>
      </div>

      {/* Tabs */}
      <div style={{
        display: 'flex', padding: '0 16px', gap: 20,
        borderBottom: `1px solid ${T.line}`, background: T.surface,
      }}>
        {[
          { id: 'overview', label: 'Resumen' },
          { id: 'timeline', label: 'Historia' },
          { id: 'meds',     label: 'Medicación' },
          { id: 'files',    label: 'Archivos' },
        ].map(t => (
          <button key={t.id} onClick={() => setTab(t.id)} style={{
            padding: '12px 0', background: 'none', border: 'none',
            borderBottom: `2px solid ${tab === t.id ? T.ink : 'transparent'}`,
            color: tab === t.id ? T.ink : T.ink40,
            fontSize: 13, fontWeight: 500, fontFamily: T.sans,
            cursor: 'pointer',
          }}>{t.label}</button>
        ))}
      </div>

      {/* Body */}
      <div style={{ padding: '16px' }}>
        {tab === 'overview' && <Overview goto={goto}/>}
        {tab === 'timeline' && <Timeline/>}
        {tab === 'meds' && <Meds/>}
        {tab === 'files' && <Files/>}
      </div>
    </div>
  );
}

function Overview({ goto }) {
  return (
    <>
      <SectionTitle kicker="Activo" title="Problemas abiertos" meta="2"/>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 8, marginBottom: 20 }}>
        <Card pad={12} style={{ borderLeft: `3px solid ${T.urgent}` }}>
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 4 }}>
            <span style={{ fontSize: 14, fontWeight: 600 }}>Gastroenteritis hemorrágica</span>
            <Chip tone="urgent" size="xs">Día 2</Chip>
          </div>
          <div style={{ fontSize: 12, color: T.ink60 }}>
            Vómitos intermitentes, heces blandas. Cambio reciente en dieta.
          </div>
        </Card>
        <Card pad={12} style={{ borderLeft: `3px solid ${T.warn}` }}>
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 4 }}>
            <span style={{ fontSize: 14, fontWeight: 600 }}>Control de peso</span>
            <Chip tone="warn" size="xs">Crónico</Chip>
          </div>
          <div style={{ fontSize: 12, color: T.ink60 }}>
            +2.1 kg desde enero. Dieta hipocalórica recomendada.
          </div>
        </Card>
      </div>

      <SectionTitle kicker="Recordatorios" title="Próximos" />
      <Card pad={0} style={{ marginBottom: 20 }}>
        {[
          { icon: 'pill',     label: 'Desparasitación externa', due: 'en 12 días' },
          { icon: 'calendar', label: 'Vacuna anual',            due: 'en 3 meses' },
        ].map((r, i) => (
          <div key={i} style={{
            display: 'flex', alignItems: 'center', gap: 12,
            padding: '12px 14px',
            borderBottom: i === 0 ? `1px solid ${T.lineSoft}` : 'none',
          }}>
            <div style={{
              width: 32, height: 32, borderRadius: 8,
              background: T.surfaceAlt, color: T.ink80,
              display: 'flex', alignItems: 'center', justifyContent: 'center',
            }}>
              <Icon name={r.icon} size={16}/>
            </div>
            <div style={{ flex: 1, fontSize: 13, fontWeight: 500 }}>{r.label}</div>
            <span style={{ fontSize: 11, color: T.ink40, fontFamily: T.mono }}>{r.due}</span>
          </div>
        ))}
      </Card>
    </>
  );
}

function Timeline() {
  const [openId, setOpenId] = React.useState(null);
  const entries = [
    { id: 'e1', when: 'Hoy 14:05', kind: 'Consulta',  title: 'Gastroenteritis hemorrágica', doc: 'Dra. Rivas', tone: 'urgent', complete: true },
    { id: 'e2', when: '11 abr',    kind: 'Consulta',  title: 'Chequeo anual',               doc: 'Dra. Rivas', tone: 'ok',     complete: true },
    { id: 'e3', when: '11 abr',    kind: 'Vacuna',    title: 'Antirrábica + polivalente',   doc: 'Dra. Rivas', tone: 'neutral',complete: true },
    { id: 'e4', when: '02 mar',    kind: 'Laboratorio', title: 'Hemograma completo',       doc: 'Lab. Central', tone: 'neutral', complete: true },
    { id: 'e5', when: '18 feb',    kind: 'Consulta',  title: 'Dermatitis alérgica',        doc: 'Dr. Méndez', tone: 'warn',    complete: true },
    { id: 'e6', when: '02 ene',    kind: 'Cirugía',   title: 'Extracción de quiste sebáceo', doc: 'Dra. Rivas', tone: 'warn',  complete: true },
  ];
  return (
    <>
      <div style={{ position: 'relative', paddingLeft: 20 }}>
        <div style={{ position: 'absolute', left: 5, top: 8, bottom: 8, width: 1, background: T.line }}/>
        {entries.map((e) => (
          <div key={e.id} onClick={() => setOpenId(e.id)} style={{
            position: 'relative', marginBottom: 4,
            padding: '6px 8px 8px', marginLeft: -8, marginRight: -8,
            borderRadius: 10, cursor: 'pointer',
            display: 'flex', alignItems: 'flex-start', gap: 0,
          }}>
            <div style={{
              position: 'absolute', left: -12, top: 11,
              width: 11, height: 11, borderRadius: '50%',
              background: T.surface, border: `2px solid ${
                e.tone === 'urgent' ? T.urgent : e.tone === 'warn' ? T.warn : e.tone === 'ok' ? T.ok : T.ink40
              }`,
            }}/>
            <div style={{ flex: 1 }}>
              <div style={{ fontSize: 10, color: T.ink40, fontFamily: T.mono, textTransform: 'uppercase', letterSpacing: 0.6 }}>
                {e.when} · {e.kind}
              </div>
              <div style={{ fontSize: 14, fontWeight: 500, color: T.ink, marginTop: 1 }}>{e.title}</div>
              <div style={{ fontSize: 11, color: T.ink60, marginTop: 1, display: 'flex', alignItems: 'center', gap: 8 }}>
                <span>{e.doc}</span>
                {e.complete && <Chip tone="ok" size="xs">10/10 firmado</Chip>}
              </div>
            </div>
            <Icon name="chevronR" size={14} color={T.ink40} style={{ marginTop: 14 }}/>
          </div>
        ))}
      </div>
      {openId && <RecordDetail entry={entries.find(x => x.id === openId)} onClose={() => setOpenId(null)}/>}
    </>
  );
}

function RecordDetail({ entry, onClose }) {
  const SECTIONS = [
    { n: '01', title: 'Identificación',            body: 'Thor · Labrador ♂ · 7 años · 32.4 kg · Dueño: Julian Smith · +34 612 345 678' },
    { n: '02', title: 'Anamnesis',                 body: 'Dueño refiere vómitos amarillentos 3x/día durante 24h. Heces blandas sin sangre. Cambio reciente de alimento hace 4 días. Bebe agua con normalidad. Vacunas al día.' },
    { n: '03', title: 'Examen físico',             body: 'T 38.5°C · FC 120 ppm · FR 24 rpm · Peso 32.4 kg (+0.3). Alerta, hidratación 5-7%. Mucosas rosadas TLLC<2s. Abdomen sensible cranial sin masas. Auscultación normal.' },
    { n: '04', title: 'Lista de problemas',         body: '1. Vómitos agudos (24h)\n2. Diarrea sin sangre\n3. Deshidratación leve 5-7%\n4. Dolor abdominal cranial' },
    { n: '05', title: 'Abordaje diagnóstico',       body: 'DD: Gastroenteritis alimentaria (probable) · Cuerpo extraño (Rx pendiente) · Parasitosis (coprológico) · Pancreatitis aguda.' },
    { n: '06', title: 'Exámenes complementarios',   body: 'Hemograma + química básica solicitados. Rx abdominal lateral. Coprológico seriado 3 días. Resultados esperados en 48h.' },
    { n: '07', title: 'Diagnóstico clínico',         body: 'Presuntivo: Gastroenteritis aguda origen alimentario. Definitivo: pendiente de laboratorio.' },
    { n: '08', title: 'Plan terapéutico',            body: 'Dieta blanda 48h. Metronidazol 15 mg/kg VO c/12h × 7d. Omeprazol 1 mg/kg VO c/24h × 10d. Fluidoterapia SC si empeora. Control en 72h.' },
    { n: '09', title: 'Pronóstico',                   body: 'Favorable en 5-7 días con tratamiento dietético y farmacológico. Reservado si aparece sangre en heces o persisten vómitos > 48h.' },
    { n: '10', title: 'Observaciones y firma',       body: 'Entregada copia al propietario. Dra. Mariana Rivas · MV Reg. 12.845 · Firmado digitalmente 14:37.' },
  ];
  return (
    <div onClick={onClose} style={{
      position: 'absolute', inset: 0, background: 'rgba(0,0,0,0.4)',
      zIndex: 100, display: 'flex', alignItems: 'flex-end',
      animation: 'fadeIn 0.2s ease-out',
    }}>
      <div onClick={e => e.stopPropagation()} style={{
        width: '100%', background: T.bg,
        borderTopLeftRadius: 24, borderTopRightRadius: 24,
        maxHeight: '90%', overflow: 'auto',
      }}>
        <div style={{ position: 'sticky', top: 0, background: T.bg, padding: '10px 16px 12px', zIndex: 2, borderBottom: `1px solid ${T.line}` }}>
          <div style={{ width: 40, height: 4, borderRadius: 2, background: T.ink20, margin: '4px auto 12px' }}/>
          <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: 10 }}>
            <div style={{ flex: 1, minWidth: 0 }}>
              <div style={{ fontSize: 10, color: T.ink40, fontFamily: T.mono, textTransform: 'uppercase', letterSpacing: 1.2 }}>
                {entry.when} · {entry.kind}
              </div>
              <div style={{ fontSize: 17, fontWeight: 600, letterSpacing: -0.3, marginTop: 2 }}>{entry.title}</div>
              <div style={{ fontSize: 11, color: T.ink60, marginTop: 2, display: 'flex', alignItems: 'center', gap: 8 }}>
                <span>{entry.doc}</span>
                <Chip tone="ok" size="xs">Firmado · 10/10</Chip>
              </div>
            </div>
            <button onClick={onClose} style={{
              width: 32, height: 32, borderRadius: 8, border: `1px solid ${T.line}`, background: T.surface,
              display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer',
            }}><Icon name="close" size={14} color={T.ink60}/></button>
          </div>
          <div style={{ display: 'flex', gap: 6, marginTop: 10 }}>
            <Btn size="sm" variant="secondary" icon="share" style={{ flex: 1 }}>Exportar PDF</Btn>
            <Btn size="sm" variant="secondary" icon="edit" style={{ flex: 1 }}>Addendum</Btn>
          </div>
        </div>

        <div style={{ padding: '14px 16px 32px', display: 'flex', flexDirection: 'column', gap: 8 }}>
          {SECTIONS.map(s => (
            <div key={s.n} style={{
              background: T.surface, border: `1px solid ${T.line}`, borderRadius: 12,
              padding: '12px 14px',
            }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 6 }}>
                <div style={{
                  width: 24, height: 24, borderRadius: 6, background: T.accentSoft, color: T.accentInk,
                  display: 'flex', alignItems: 'center', justifyContent: 'center',
                  fontFamily: T.mono, fontSize: 10, fontWeight: 600,
                }}>{s.n}</div>
                <div style={{ fontSize: 13, fontWeight: 600, color: T.ink }}>{s.title}</div>
              </div>
              <div style={{ fontSize: 12, color: T.ink80, lineHeight: 1.55, whiteSpace: 'pre-line' }}>{s.body}</div>
            </div>
          ))}
          <div style={{
            marginTop: 4, padding: 12, background: T.surfaceAlt, borderRadius: 10,
            fontSize: 10, color: T.ink60, fontFamily: T.mono, lineHeight: 1.5,
            textTransform: 'uppercase', letterSpacing: 0.4,
          }}>
            Registro bloqueado · Comvezcol Res. 8430 · Modificaciones solo vía addendum
          </div>
        </div>
      </div>
    </div>
  );
}

function Meds() {
  return (
    <>
      <SectionTitle kicker="En curso" title="Medicación activa" meta="2"/>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
        {[
          { name: 'Metronidazol 250mg', dose: '1 comp / 12h', dur: '7 días', progress: 0.4 },
          { name: 'Omeprazol 10mg',     dose: '1 cap / 24h',  dur: '10 días', progress: 0.2 },
        ].map((m, i) => (
          <Card key={i} pad={12}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 6 }}>
              <span style={{ fontSize: 14, fontWeight: 600 }}>{m.name}</span>
              <Chip tone="accent" size="xs">Activo</Chip>
            </div>
            <div style={{ fontSize: 12, color: T.ink60, marginBottom: 8 }}>
              {m.dose} · {m.dur}
            </div>
            <div style={{ height: 3, borderRadius: 2, background: T.line, overflow: 'hidden' }}>
              <div style={{ width: `${m.progress*100}%`, height: '100%', background: T.accent }}/>
            </div>
          </Card>
        ))}
      </div>
    </>
  );
}

function Files() {
  return (
    <>
      <SectionTitle kicker="Adjuntos" title="Archivos" meta="11 archivos"/>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 8 }}>
        {['Radiografía tórax', 'Hemograma', 'Ecografía abd.', 'Foto lesión'].map((n, i) => (
          <div key={i}>
            <Placeholder label={i < 3 ? 'scan' : 'photo'} height={90} rounded={10}/>
            <div style={{ fontSize: 11, fontWeight: 500, marginTop: 6 }}>{n}</div>
            <div style={{ fontSize: 10, color: T.ink40, fontFamily: T.mono }}>18 abr · PDF</div>
          </div>
        ))}
      </div>
    </>
  );
}

Object.assign(window, { PatientProfile });
