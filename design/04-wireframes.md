# Wireframes — 5 ključnih stranica

ASCII skice za strukturu, redosled sekcija i ponašanje na 3 širine. Ovo su low-fidelity layout-i — boje, fontovi, slike vidi u `tokens.json` i `mockup-home.html`.

Konvencije:
- `[CTA]` — primary dugme (tamna šuma fill)
- `[btn]` — sekundarno dugme (border-only)
- `(img)` — slika
- `<icon>` — ikona
- `———` — divider
- `EYEBROW` — mali uppercase tekst (accent boja, letter-spacing 0.15em)

---

## 1. Homepage `/`

### Desktop (≥ 1024px)

```
┌────────────────────────────────────────────────────────────────────┐
│ HEADER (sticky)                                                    │
│  [LOGO sitnezivotinje]  Kalendar  Kategorije  Rase  Savezi  Blog  │
│                                                  <search>  [SR/CYR]│
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  EYEBROW: SLEDEĆA VELIKA MANIFESTACIJA                             │
│                                                                    │
│  Međunarodna izložba                ┌──────────────────────────┐   │
│  sitnih životinja Vršac             │                          │   │
│  *2026* (italic, EB Garamond)       │      (poster img,        │   │
│                                     │       4:5 vertical)      │   │
│  📍 Vršac, Srbija   📅 25-27. okt.  │                          │   │
│  ⏱ Za 4 dana 18 sati 22 minuta     │                          │   │
│                                     │                          │   │
│  Kratak opis (2-3 reda)             │                          │   │
│                                     │                          │   │
│  [Detalji manifestacije] [+ Kalendar]│                         │   │
│                                     └──────────────────────────┘   │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  EYEBROW: NAREDNE MANIFESTACIJE                                    │
│  Kalendar         (link "Vidi sve →")                              │
│                                                                    │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐  ┌───────────┐       │
│  │ (poster)  │  │ (poster)  │  │ (poster)  │  │ (poster)  │       │
│  │           │  │           │  │           │  │           │       │
│  │ EYEBROW   │  │ EYEBROW   │  │ EYEBROW   │  │ EYEBROW   │       │
│  │ Naslov    │  │ Naslov    │  │ Naslov    │  │ Naslov    │       │
│  │ 📍 grad   │  │ 📍 grad   │  │ 📍 grad   │  │ 📍 grad   │       │
│  │ 📅 datum  │  │ 📅 datum  │  │ 📅 datum  │  │ 📅 datum  │       │
│  └───────────┘  └───────────┘  └───────────┘  └───────────┘       │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│  alt background (#F4F1EC)                                          │
│                                                                    │
│  EYEBROW: ISTRAŽI PO KATEGORIJI                                    │
│  Šta tražiš?    *(italic display)*                                 │
│                                                                    │
│  ┌───────────────┐  ┌───────────────┐  ┌───────────────┐          │
│  │ <golub icon>  │  │ <kokoš icon>  │  │ <kunić icon>  │          │
│  │ Golubarstvo   │  │ Živinarstvo   │  │ Kunićarstvo   │          │
│  │ kratak opis   │  │ kratak opis   │  │ kratak opis   │          │
│  │ 12 rasa →     │  │ 8 rasa →      │  │ 6 rasa →      │          │
│  └───────────────┘  └───────────────┘  └───────────────┘          │
│  ┌───────────────┐  ┌───────────────┐                             │
│  │ <ptica icon>  │  │ <hrčak icon>  │                             │
│  │ Ptice         │  │ Glodari       │                             │
│  └───────────────┘  └───────────────┘                             │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  EYEBROW: SA BLOGA                                                 │
│  Najnoviji članci         (link "Svi članci →")                    │
│                                                                    │
│  ┌─────────────────────┐  ┌─────────────────────┐ ┌─────────────┐ │
│  │ (cover img, 16:9)   │  │ (cover img, 16:9)   │ │ (cover img) │ │
│  │                     │  │                     │ │             │ │
│  │ EYEBROW kategorija  │  │ EYEBROW kategorija  │ │ EYEBROW     │ │
│  │ Naslov posta        │  │ Naslov posta        │ │ Naslov      │ │
│  │ Excerpt 2 reda...   │  │ Excerpt 2 reda...   │ │ Excerpt...  │ │
│  │ Autor • 5 min       │  │ Autor • 7 min       │ │ Autor • 4m  │ │
│  └─────────────────────┘  └─────────────────────┘ └─────────────┘ │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  EYEBROW: ZAJEDNICA                                                │
│  Nacionalni savezi i organizacije                                  │
│                                                                    │
│  🇷🇸 AOS Srbija    🇭🇷 HSUGPKPZ    🇸🇮 SDGPMŽ    🇧🇦 Savez BiH     │
│  🇲🇪 Crna Gora     🇲🇰 Makedonija   🇭🇺 MGKSZ      🇪🇺 EE Europe    │
│  (logo grid, 4 kolone, monohrome logos sa hover-om)                │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  Newsletter                                                        │
│  Mesečni pregled manifestacija direktno na email.                  │
│  [email input...........] [Prijavi se]                             │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│ FOOTER (#1F2A1A bg, beli tekst)                                   │
│  Logo + slogan        Kalendar    Kategorije   Pravno              │
│                       link        link         Uslovi              │
│                       link        link         Privatnost          │
│  © 2026 sitnezivotinje.com                                         │
└────────────────────────────────────────────────────────────────────┘
```

### Mobile (375px)

- Header se sklapa u hamburger meni
- Hero: poster gore (full width, 4:5), tekst ispod
- Kalendar preview: horizontalni scroll (`overflow-x-scroll snap-x`) — 1.2 kartice vidljive, tap "Vidi sve →"
- Kategorije: 2 kolone grid (5 kartica → 2-2-1)
- Blog: vertikalna lista, full-width slike
- Savezi: 2 kolone grid

---

## 2. `/kalendar` — najvažnija stranica

### Desktop

```
┌────────────────────────────────────────────────────────────────────┐
│ HEADER                                                             │
├────────────────────────────────────────────────────────────────────┤
│ Breadcrumb: Početna / Kalendar manifestacija                       │
│                                                                    │
│ EYEBROW: 47 NAJAVLJENIH MANIFESTACIJA                              │
│ Kalendar manifestacija   *(italic display)*                        │
│ Sve izložbe, berze i specijalke u Srbiji i regionu.                │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│ ┌─ FILTER BAR (sticky ispod header-a) ─────────────────────────┐   │
│ │ <search 'pretraga'>  [Zemlja ▾] [Mesec ▾] [Kategorija ▾]    │   │
│ │ [Tip događaja ▾] [Reset filtere]                             │   │
│ │                                  Pogled: [📋 Lista] [▦] [🗺]  │   │
│ │ Aktivni: [×Srbija] [×Januar 2026] [×Golubarstvo]             │   │
│ └──────────────────────────────────────────────────────────────┘   │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│ JANUAR 2026  *(group header, italic display)*                      │
│                                                                    │
│ ┌──────────────────────────────────────────────────────────────┐   │
│ │ ┌────┐  EYEBROW: izložba • golubarstvo                       │   │
│ │ │ 25 │  Tradicionalna međunarodna izložba                    │   │
│ │ │JAN │  📍 Subotica, Srbija   ⏱ 3 dana   🏛 SC Subotica    │   │
│ │ └────┘  Organizator: AOS Srbija    [Detalji →]               │   │
│ │ ───────────────────────────────────────────────────────────  │   │
│ │ ┌────┐  EYEBROW: berza • golubarstvo, živinarstvo            │   │
│ │ │ 28 │  Prolećna berza Sombor                                │   │
│ │ │JAN │  📍 Sombor, Srbija     ⏱ 1 dan    🏛 Bivša Panonka  │   │
│ │ └────┘  Organizator: DOSŽ Sombor 1871   [Detalji →]          │   │
│ │ ───────────────────────────────────────────────────────────  │   │
│ │ ...                                                          │   │
│ └──────────────────────────────────────────────────────────────┘   │
│                                                                    │
│ FEBRUAR 2026                                                       │
│ ...                                                                │
│                                                                    │
│ [Učitaj još]  ili  paginacija: < 1 2 3 ... >                       │
└────────────────────────────────────────────────────────────────────┘
```

### Pogled "Grid" (toggle)

- 3 kolone na desktop, 2 na tablet, 1 na mobile
- Karte sa poster slikom + meta podacima (kao na home preview-u)

### Pogled "Mapa" (toggle)

- Leaflet mapa, zoom default na Beograd, granice = Balkan + Mađarska
- Pin-ovi po koordinatama, klik → popup sa karticom
- Filteri ostaju aktivni (utiču na pin-ove)
- Prebacivanje view-a NE menja URL filterskih parametara, samo `?pogled=mapa`

### Mobile

- Filteri u "Filter" drawer (slide-in s desna), fixed dugme dole-desno: `[≡ Filteri (3)]`
- Kartice eventa: vertikalna lista, datum levo (mali kvadrat), tekst desno
- Pogled toggle: bottom bar (sticky), tri ikone

---

## 3. `/kalendar/[slug]` — Detalj manifestacije

### Desktop

```
┌────────────────────────────────────────────────────────────────────┐
│ HEADER                                                             │
├────────────────────────────────────────────────────────────────────┤
│ Breadcrumb: Početna / Kalendar / Međunarodna izložba Vršac 2026    │
│                                                                    │
│ ┌──────────────────────────────────────┐  ┌───────────────────┐    │
│ │                                      │  │                   │    │
│ │ EYEBROW: IZLOŽBA • GOLUBARSTVO,      │  │   (poster img,    │    │
│ │ ŽIVINARSTVO • MEĐUNARODNA            │  │     4:5 vert)     │    │
│ │                                      │  │                   │    │
│ │ Međunarodna izložba                  │  │                   │    │
│ │ sitnih životinja Vršac               │  │                   │    │
│ │ *2026*  (display italic)             │  │                   │    │
│ │                                      │  │                   │    │
│ │ 📅 25 – 27. oktobar 2026             │  │                   │    │
│ │ 📍 Sportska hala HMŠ, Vršac          │  │                   │    │
│ │ 🏛 Organizator: UO Vršački prevrtač  │  │                   │    │
│ │                                      │  │                   │    │
│ │ ⏱ ODBROJAVANJE: 4d 18h 22m           │  │                   │    │
│ │                                      │  │                   │    │
│ │ [Dodaj u kalendar (.ics)]            │  │                   │    │
│ │ [Posetite zvaničan sajt →]           │  │                   │    │
│ │ [Podeli ↗]                           │  │                   │    │
│ └──────────────────────────────────────┘  └───────────────────┘    │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│ ┌─ Glavni sadržaj (2/3) ─────────┐  ┌─ Sidebar (1/3) ──────────┐  │
│ │                                │  │                          │  │
│ │ O manifestaciji                │  │ INFORMACIJE              │  │
│ │ (portable text body)           │  │ Tip       Izložba        │  │
│ │                                │  │ Trajanje  3 dana         │  │
│ │ - Istorija izložbe             │  │ Učesnici  ~200 izlagača  │  │
│ │ - Šta će biti izloženo         │  │ Eksponati ~1.700         │  │
│ │ - Specijalni programi          │  │ Cena      Slobodan ulaz  │  │
│ │ - Praktične info               │  │                          │  │
│ │                                │  │ ───────────              │  │
│ │ Galerija (prošlogodišnja)      │  │ KONTAKT                  │  │
│ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐            │  │ 📞 +381 13 ...           │  │
│ │ └──┘ └──┘ └──┘ └──┘            │  │ ✉ info@vrsac-...        │  │
│ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐            │  │ 🌐 vrsac-prevrtac.rs    │  │
│ │ └──┘ └──┘ └──┘ └──┘            │  │                          │  │
│ │                                │  │ ───────────              │  │
│ │ MAPA                           │  │ PRIJAVA IZLAGAČA         │  │
│ │ ┌──────────────────────────┐   │  │ Rok: 15. okt 2026        │  │
│ │ │                          │   │  │ [Prijavi se →]           │  │
│ │ │  (Leaflet sa pin-om)     │   │  │                          │  │
│ │ │                          │   │  │ ───────────              │  │
│ │ └──────────────────────────┘   │  │ ORGANIZATOR              │  │
│ │ Sportska hala HMŠ, Vršac       │  │ ┌─────────┐              │  │
│ │ [Otvori u Google Maps →]       │  │ │  logo   │              │  │
│ │                                │  │ └─────────┘              │  │
│ └────────────────────────────────┘  │ UO Vršački prevrtač     │  │
│                                     │ [Vidi profil →]          │  │
│                                     └──────────────────────────┘  │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  EYEBROW: SLIČNE MANIFESTACIJE                                     │
│  Možda te zanima                                                   │
│                                                                    │
│  ┌──────┐  ┌──────┐  ┌──────┐                                     │
│  │event │  │event │  │event │                                     │
│  └──────┘  └──────┘  └──────┘                                     │
│                                                                    │
└────────────────────────────────────────────────────────────────────┘
```

### Mobile

- Hero: poster gore (full width 4:5), tekst ispod
- Sidebar nestaje, postaje sekcije ispod glavnog sadržaja
- "Dodaj u kalendar" dugme u sticky bottom bar-u (uvek dostupno)

---

## 4. `/blog/[slug]` — Blog post

### Desktop

```
┌────────────────────────────────────────────────────────────────────┐
│ HEADER                                                             │
├────────────────────────────────────────────────────────────────────┤
│ Breadcrumb: Početna / Blog / Golubarstvo / Naslov posta            │
│                                                                    │
│              ┌───────────────────────────────┐                     │
│              │                               │                     │
│              │   (cover image, 16:9)         │                     │
│              │     edge-to-edge ili sa       │                     │
│              │     180px margin              │                     │
│              │                               │                     │
│              └───────────────────────────────┘                     │
│                                                                    │
│              EYEBROW: GOLUBARSTVO • 12 MIN ČITANJA                 │
│                                                                    │
│              Kako sam za 5 godina                                  │
│              odgojio prvog šampiona                                │
│              *Srpskog visokoletača*                                │
│              (display italic, max-width 65ch, centrirano)          │
│                                                                    │
│              Marko Petrović • 24. januar 2026                      │
│                                                                    │
│ ──────────────────────────────────────────────────────────────────│
│                                                                    │
│ ┌─ TOC (sticky, 1/4) ──┐  ┌─ Telo posta (max 65ch) ────────────┐ │
│ │                      │  │                                    │ │
│ │ Sadržaj              │  │ Lead paragraph (lg, secondary)...  │ │
│ │ → Početak            │  │                                    │ │
│ │ → Izbor matice       │  │ Body tekst...                      │ │
│ │ → Trening leta       │  │                                    │ │
│ │ → Prva izložba       │  │ ## Izbor matice                    │ │
│ │ → Šta sam naučio     │  │                                    │ │
│ │                      │  │ Body...                            │ │
│ │ ────                 │  │                                    │ │
│ │ [Podeli ↗]           │  │  ┌──────────────────────┐          │ │
│ │ [Sačuvaj]            │  │  │  (slika sa caption)  │          │ │
│ │                      │  │  └──────────────────────┘          │ │
│ │                      │  │  Caption ispod (italic, sm)        │ │
│ │                      │  │                                    │ │
│ │                      │  │ ## Trening leta                    │ │
│ │                      │  │                                    │ │
│ │                      │  │ ┌─ CALLOUT BLOK ───────────────┐  │ │
│ │                      │  │ │ 💡 Savet: ...                 │  │ │
│ │                      │  │ └──────────────────────────────┘  │ │
│ │                      │  │                                    │ │
│ │                      │  │ ...                                │ │
│ └──────────────────────┘  └────────────────────────────────────┘ │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  ┌─ AUTOR BOX ─────────────────────────────────────────────┐      │
│  │ ┌──────┐  Marko Petrović                                │      │
│  │ │ avt  │  Odgajivač iz Vršca, član UO "Vršački prevr."  │      │
│  │ └──────┘  [Svi članci autora →]                         │      │
│  └──────────────────────────────────────────────────────────┘     │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  EYEBROW: SRODNI ČLANCI                                            │
│  Pročitaj još                                                      │
│                                                                    │
│  ┌──────┐  ┌──────┐  ┌──────┐                                     │
│  │ post │  │ post │  │ post │                                     │
│  └──────┘  └──────┘  └──────┘                                     │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│  Newsletter signup (kao na home)                                   │
└────────────────────────────────────────────────────────────────────┘
```

### Mobile

- Cover image full-width (16:9)
- Naslov i telo: full-width sa horizontalnim padding-om (24px)
- TOC: collapsible accordion na vrhu, ne sticky
- Share / Save: floating action button dole-desno

---

## 5. `/kategorije/[slug]` — npr. `/kategorije/golubarstvo`

### Desktop

```
┌────────────────────────────────────────────────────────────────────┐
│ HEADER                                                             │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │                                                              │  │
│  │   (hero img, 12:5, edge-to-edge)                             │  │
│  │   gradient overlay (bottom-up, brand color)                  │  │
│  │                                                              │  │
│  │   EYEBROW: KATEGORIJA                                        │  │
│  │   Golubarstvo  *(display italic, beli tekst, na overlay-u)*  │  │
│  │   Visokoletači, prevrtači, gušani, ukrasni golubovi.         │  │
│  │                                                              │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  Intro tekst kategorije (max 65ch, prose styling)                  │
│  Šta je golubarstvo, koje su glavne grupe rasa, kratka istorija.   │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  EYEBROW: NAREDNE MANIFESTACIJE                                    │
│  Kalendar — golubarstvo                                            │
│                                                                    │
│  ┌────┐ ┌────┐ ┌────┐                                              │
│  │evnt│ │evnt│ │evnt│   [Vidi sve u kalendaru →]                  │
│  └────┘ └────┘ └────┘                                              │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│  alt background                                                    │
│                                                                    │
│  EYEBROW: REGISTAR                                                 │
│  Rase u kategoriji                                                 │
│                                                                    │
│  Filter: [Zemlja porekla ▾] [Status ▾] [Autohtone samo ☐]          │
│                                                                    │
│  ┌────┐ ┌────┐ ┌────┐ ┌────┐                                      │
│  │rasa│ │rasa│ │rasa│ │rasa│                                      │
│  └────┘ └────┘ └────┘ └────┘                                      │
│  ┌────┐ ┌────┐ ┌────┐ ┌────┐                                      │
│  │rasa│ │rasa│ │rasa│ │rasa│                                      │
│  └────┘ └────┘ └────┘ └────┘                                      │
│                                                                    │
│  [Vidi ceo registar rasa →]                                        │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  EYEBROW: SA BLOGA                                                 │
│  Članci o golubarstvu                                              │
│                                                                    │
│  ┌──────┐ ┌──────┐ ┌──────┐                                       │
│  │ post │ │ post │ │ post │   [Svi članci u kategoriji →]         │
│  └──────┘ └──────┘ └──────┘                                       │
│                                                                    │
├────────────────────────────────────────────────────────────────────┤
│                                                                    │
│  EYEBROW: ORGANIZACIJE                                             │
│  Specijalistički savezi i klubovi                                  │
│                                                                    │
│  - Klub odgajivača Srpskog visokoletača                            │
│  - Klub gušana Srbije                                              │
│  - ...                                                             │
│                                                                    │
└────────────────────────────────────────────────────────────────────┘
```

---

## Bonus — Kartica strukture (reusable patterns)

### EventCard (pojavljuje se na home, /kalendar grid view, kategorija)

```
┌─────────────────────────┐
│                         │
│  (poster, 4:5)          │
│                         │
│                         │
├─────────────────────────┤
│ EYEBROW: tip • kateg.   │
│ Naslov manifestacije    │
│ (Fraunces 600, 2 reda)  │
│ ───                     │
│ 📍 Grad, zemlja         │
│ 📅 25-27. okt 2026      │
└─────────────────────────┘
```

### EventListItem (lista view u /kalendar)

```
┌────────────────────────────────────────────────────────┐
│ ┌────┐  EYEBROW: tip • kategorije                      │
│ │ 25 │  Naslov manifestacije                           │
│ │JAN │  📍 Grad, Zemlja  ⏱ 3 dana  🏛 Lokacija       │
│ └────┘  Organizator: ime saveza      [Detalji →]       │
└────────────────────────────────────────────────────────┘
```

### ArticleCard (blog grid)

```
┌─────────────────────────┐
│                         │
│  (cover, 16:9)          │
│                         │
├─────────────────────────┤
│ EYEBROW: kategorija     │
│ Naslov posta            │
│ (Fraunces 600, 2 reda)  │
│ Excerpt 2 reda...       │
│ ───                     │
│ Autor • 5 min čitanja   │
└─────────────────────────┘
```

### BreedCard (registar rasa)

```
┌─────────────────────────┐
│                         │
│  (img, 3:2)             │
│                         │
├─────────────────────────┤
│ EYEBROW: 🇷🇸 srbija • autohtona│
│ Srpski visokoletač      │
│ (Fraunces 600)          │
│ Kratak opis (2 reda)... │
└─────────────────────────┘
```

---

## Komentar o pristupačnosti i mobile-first

- **Tap target min 44×44px** (WCAG) — sva dugmad i linkovi u navigaciji
- **Sticky filter bar** u kalendaru ne sme da zatvori CTA — testiraj na 375px
- **Sticky bottom bar** na detail stranicama ne sme da bude duplikat sticky header-a — bira se: ili header ili bottom bar (preferiraj bottom za detail, header za listu)
- **Skip-to-content** link u header-u (sakriven dok ne fokus-uje)
- **Focus rings** vidljivi na svim interaktivnim elementima (Tailwind `focus-visible:ring-2`)
- **Reduced motion** — sve tranzicije respekt-uju `prefers-reduced-motion`
