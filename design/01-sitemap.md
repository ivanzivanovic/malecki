# Sitemap — sitnezivotinje.com

Hijerarhijska struktura sajta sa URL-ovima, izvorom sadržaja i tipom renderovanja.

Legenda:
- **SSG** — statički generisano u build-u
- **ISR** — statički + revalidate `3600s`
- **dyn** — server-rendered svaki put (retko)
- **Sanity** — sadržaj iz CMS-a
- **i18n** — postoji `sr-Latn`, `sr-Cyrl`, `en` varijanta (default `sr-Latn`)

---

## 1. Glavna navigacija

| URL | Naslov | Render | Izvor | i18n |
|---|---|---|---|---|
| `/` | Početna | ISR | Sanity (kurirano) | da |
| `/kalendar` | Kalendar manifestacija | ISR | Sanity (Event) | da |
| `/kalendar/[slug]` | Detalj manifestacije | ISR | Sanity (Event) | da |
| `/kategorije` | Sve kategorije | SSG | Sanity (AnimalCategory) | da |
| `/kategorije/[slug]` | Detalj kategorije | ISR | Sanity (AnimalCategory) | da |
| `/rase` | Registar rasa | ISR | Sanity (Breed) | da |
| `/rase/[slug]` | Detalj rase | ISR | Sanity (Breed) | da |
| `/savezi` | Savezi i krovne organizacije | ISR | Sanity (Organization) | da |
| `/savezi/[slug]` | Detalj saveza | ISR | Sanity (Organization) | da |
| `/blog` | Blog index | ISR | Sanity (Article) | da |
| `/blog/[slug]` | Blog post | ISR | Sanity (Article) | da |
| `/o-nama` | O nama | SSG | Sanity (Page singleton) | da |
| `/kontakt` | Kontakt | SSG | Sanity (Page singleton) + Resend | da |

## 2. Pomoćne stranice

| URL | Naslov | Render | Izvor |
|---|---|---|---|
| `/uslovi-koriscenja` | Uslovi korišćenja | SSG | Sanity (Page singleton) |
| `/politika-privatnosti` | Politika privatnosti | SSG | Sanity (Page singleton) |
| `/pretraga` | Rezultati pretrage | dyn | Sanity full-text |
| `/404` | Stranica nije pronađena | SSG | hardcoded |
| `/500` | Greška servera | SSG | hardcoded |

## 3. Sistemske rute (nisu u navigaciji, ali postoje)

| URL | Svrha |
|---|---|
| `/sitemap.xml` | Auto-generisan iz Sanity-ja, dnevno |
| `/robots.txt` | Statički |
| `/feed.xml` | RSS za blog (Prioritet 3) |
| `/api/contact` | POST endpoint za kontakt formu |
| `/api/newsletter` | POST endpoint za Brevo signup |
| `/api/ics/[eventSlug]` | Generiše .ics fajl za "Dodaj u kalendar" |
| `/api/og/[type]/[slug]` | Dinamičke OG slike (Vercel OG) |
| `/studio` | Sanity Studio (zaštićen) |

## 4. Filterski URL-ovi (kalendar)

Kalendar koristi query parametre, **ne** dinamičke segmente — bolje za UX (deljive URL-ovi, browser history) i jednostavnije za SEO (canonical bez filtera).

```
/kalendar?zemlja=rs&mesec=2026-01&kategorija=golubarstvo&tip=izlozba&pogled=lista
```

Parametri:
- `zemlja` — `rs|hr|si|ba|me|mk|hu|eu` (multi: `?zemlja=rs,hr`)
- `mesec` — `YYYY-MM` (jedan)
- `kategorija` — slug iz `AnimalCategory` (multi)
- `tip` — `izlozba|berza|specijalka|sajam|kongres` (multi)
- `pogled` — `lista|grid|mapa` (default `lista`)
- `q` — pretraga po nazivu/gradu

Canonical: `/kalendar` (bez parametara). Filtrirane verzije imaju `<meta name="robots" content="noindex,follow">`.

## 5. Mapa sajta — vizuelno

```
/
├── /kalendar                    ← najvažnija stranica
│   └── /kalendar/[slug]
├── /kategorije
│   ├── /kategorije/golubarstvo
│   ├── /kategorije/zivinarstvo
│   ├── /kategorije/kunicarstvo
│   ├── /kategorije/ptice
│   └── /kategorije/glodari
├── /rase
│   └── /rase/[slug]             ← npr. /rase/srpski-visokoletac
├── /savezi
│   └── /savezi/[slug]           ← npr. /savezi/aos-srbija
├── /blog
│   └── /blog/[slug]
├── /o-nama
├── /kontakt
└── (footer)
    ├── /uslovi-koriscenja
    └── /politika-privatnosti
```

## 6. Internal linking — pravila

- Svaki **Event** linkuje na: kategoriju (gornji deo kartice), grad (footer kartice), organizatorski savez (sidebar detalja)
- Svaka **Rasa** linkuje na: kategoriju, zemlju porekla, srodne rase (3)
- Svaki **Blog post** linkuje na: kategoriju, autora, srodne postove (3 — preko `relatedArticles` u Sanity-ju)
- **Kategorijska stranica** prikazuje: 3 najbliža eventa iz kategorije + sve rase iz kategorije + 3 najnovija posta sa tagom kategorije
- **Header** i **Footer** uvek imaju link ka `/kalendar` (najvažniji CTA)

## 7. SEO — slug pravila

- Latinica, sve malim slovima, crtica umesto razmaka
- Bez dijakritika: `š→s`, `č→c`, `ć→c`, `ž→z`, `đ→dj`
- Maks 60 karaktera
- Auto-generisano iz `title`/`name`, editor može menjati ručno
- Implementacija: `lib/slugify.ts` (jedan util, ne duplikati)

Primeri:
- "Međunarodna izložba Vršac 2026" → `medjunarodna-izlozba-vrsac-2026`
- "Srpski visokoletač" → `srpski-visokoletac`
- "Asocijacija odgajivača sitnih životinja Srbije" → `aos-srbija` (ručno skraćeno)
