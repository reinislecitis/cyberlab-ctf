# CyberLab CTF — Izvietošanas Ceļvedis

Laiks: ~20–30 minūtes. Nepieciešams tikai pārlūkprogramma.

---

## SOLIS 1 — Supabase (datubāze)

### 1.1 Izveidojiet kontu
1. Atveriet **https://supabase.com** → "Start your project"
2. Reģistrējieties ar GitHub vai e-pastu (BEZMAKSAS)
3. Izveidojiet jaunu projektu:
   - **Name:** `cyberlab-ctf`
   - **Database Password:** izvēlieties stipru paroli (saglabājiet!)
   - **Region:** `West EU (Ireland)` — tuvākais Latvijai
4. Gaidiet ~2 minūtes kamēr projekts tiek izveidots

### 1.2 Izveidojiet tabulas
1. Kreisajā izvēlnē → **SQL Editor**
2. Noklikšķiniet **"New query"**
3. Nokopējiet VISU saturu no faila `supabase_setup.sql`
4. Ielīmējiet SQL redaktorā
5. Nospiediet **"Run"** (zaļā poga)
6. Jāparādās ziņojumam "Success"

### 1.3 Iegūstiet API atslēgas
1. Kreisajā izvēlnē → **Settings** → **API**
2. Nokopējiet un saglabājiet:
   - **Project URL** (izskatās kā: `https://xxxxx.supabase.co`)
   - **anon / public** atslēga (gara virkne)

---

## SOLIS 2 — Konfigurējiet failus

### Atveriet `src/index.html` un `src/admin.html`
Abos failos atrodiet šīs 3 rindiņas augšā un aizstājiet:

```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
// → aizstājiet ar jūsu Project URL
// Piemērs: 'https://abcdefgh.supabase.co'

const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
// → aizstājiet ar anon/public atslēgu

const ACCESS_CODE = 'YOUR_ACCESS_CODE';
// → index.html: kods ko dodiet studentiem
// Piemērs: 'kiber2024'
```

Tikai `admin.html` failā papildus:
```javascript
const ADMIN_PASSWORD = 'YOUR_ADMIN_PASSWORD';
// → jūsu admin parole
// Piemērs: 'prof_admin_2024!'
```

### Piemērs kā izskatīsies pēc aizpildīšanas:
```javascript
const SUPABASE_URL = 'https://abcdefghijkl.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
const ACCESS_CODE = 'kiber2024';
```

---

## SOLIS 3 — Cloudflare Pages (hosting)

### 3.1 Izveidojiet kontu
1. Atveriet **https://cloudflare.com** → "Sign Up" (BEZMAKSAS)
2. Reģistrējieties ar e-pastu

### 3.2 Izvietojiet mājaslapu
1. Kreisajā izvēlnē → **Workers & Pages** → **Pages**
2. Noklikšķiniet **"Create a project"**
3. Izvēlieties **"Direct Upload"** (ne GitHub)
4. **Project name:** `cyberlab-ctf`
5. Noklikšķiniet **"Create project"**

### 3.3 Augšupielādējiet failus
1. Parādīsies "Upload assets" ekrāns
2. Velciet vai izvēlieties abus failus no mapes `src/`:
   - `index.html`
   - `admin.html`
3. Noklikšķiniet **"Deploy site"**
4. Gaidiet ~30 sekundes

### 3.4 Iegūstiet URL
Pēc izvietošanas saņemsiet adresi, piemēram:
- **https://cyberlab-ctf.pages.dev** ← studenti
- **https://cyberlab-ctf.pages.dev/admin.html** ← jūs (pasniedzējs)

---

## SOLIS 4 — Pārbaudiet

1. Atveriet `https://cyberlab-ctf.pages.dev`
2. Ievadiet vārdu un jūsu ACCESS_CODE
3. Mēģiniet atrisināt kādu uzdevumu
4. Atveriet `admin.html` un pārbaudiet vai dati parādās

---

## SOLIS 5 — Izdaliet studentiem

Nosūtiet studentiem:
```
🛡️ CyberLab CTF — Praktiskais darbs

Adrese: https://cyberlab-ctf.pages.dev
Piekļuves kods: [jūsu ACCESS_CODE]

Ievadiet savu VĀRDU UZVĀRDU un kodu.
Progress tiek saglabāts automātiski.
Laiks: 3 stundas.
```

---

## Atjaunināt vēlāk (ja mainās saturs)

1. Atveriet **Cloudflare Pages** → jūsu projekts
2. Noklikšķiniet **"Create new deployment"**
3. Augšupielādējiet atjauninātus failus

---

## Problēmu novēršana

**"Invalid API key"** → pārbaudiet ka SUPABASE_ANON_KEY ir kopēts pilnībā

**Studenti nevar pieslēgties** → pārbaudiet ACCESS_CODE abos failos

**Dati netiek saglabāti** → Supabase SQL Editor: pārliecinieties ka tabulas ir izveidotas (skatiet SOLIS 1.2)

**Admin neredz datus** → pārbaudiet ka SUPABASE_URL un KEY sakrīt ar index.html

---

## Failu struktūra

```
src/
  index.html     ← Studentu CTF platforma
  admin.html     ← Pasniedzēja panelis
supabase_setup.sql  ← SQL tabulu izveide
SETUP.md            ← šis fails
```
