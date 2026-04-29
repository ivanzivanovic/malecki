# Komponente i SEO odluke

Finalna lista komponenti za implementaciju + sve SEO odluke (URL, meta, JSON-LD) na jednom mestu. Ovo je poslednji design dokument pre `02-brief-claude-code.md` i prelaska na implementaciju.

---

## 1. Komponentna mapa

Sve komponente, organizovane po domenu, sa kratkom svrhom i ključnim props-ima. Svrha: jasno pre kodiranja koja komponenta je atomska, a koja kompozicija.

### `/components/ui/` — shadcn primitives

Generišu se preko CLI-ja, ne pišu ručno. MVP set:

| Komponenta | Svrha |
|---|---|
| `button` | Sve dugmad |
| `input` | Tekstualna polja |
| `select` | Dropdown filteri |
| `dialog` | Modali (npr. lightbox galerija) |
| `sheet` | Mobile filter drawer |
| `dropdown-menu` | Header user/lang menu |
| `accordion` | Mobile TOC, FAQ |
| `tabs` | Pogled toggle (lista/grid/mapa) |
| `badge` | Status priznavanja, "novo" tag |
| `separator` | Divider linije |

### `/components/layout/`

| Komponenta | Props | Napomena |
|---|---|---|
| `Header` | `currentLocale: 'sr-Latn' \| 'sr-Cyrl' \| 'en'` | Sticky, sa skip-to-content linkom |
| `Footer` | — | Tamna pozadina (`brand.primary`), beli tekst |
| `Navigation` | `items: NavItem[]` | Desktop horizontalna + mobile drawer |
| `MobileDrawer` | `isOpen, onClose, items` | Slide-in s leva |
| `LanguageSwitcher` | `current, available[]` | Tekstualni `SR · ЋИР · EN` |
| `Breadcrumbs` | `items: { label, href }[]` | JSON-LD se generiše paralelno |
| `Container` | `width: 'narrow' \| 'default' \| 'wide' \| 'prose'` | Wrapper za max-width |
| `SkipToContent` | — | A11y, sakriven dok ne fokus-uje |

### `/components/event/`

| Komponenta | Props | Gde se koristi |
|---|---|---|
| `EventCard` | `event: Event, variant: 'grid' \| 'compact'` | Home preview, /kalendar grid view, kategorija |
| `EventListItem` | `event: Event` | /kalendar lista view (datum-blok levo, tekst desno) |
| `EventHero` | `event: Event` | /kalendar/[slug] vrh stranice |
| `EventCalendarGrid` | `events: Event[], month: Date` | /kalendar grid view (FullCalendar ili custom) |
| `EventListView` | `events: Event[], groupBy: 'month' \| 'week'` | /kalendar lista view (default) |
| `EventMapView` | `events: Event[]` | /kalendar mapa view (Leaflet) |
| `EventFilters` | `value, onChange` | Sticky bar u /kalendar |
| `ActiveFilters` | `filters, onRemove` | Chip-ovi ispod filter bara |
| `EventCountdown` | `targetDate: Date` | Hero "Za 4 dana 18 sati" |
| `AddToCalendarButton` | `event: Event` | Generiše .ics fajl preko `/api/ics/[slug]` |
| `EventInfoSidebar` | `event: Event` | Sidebar na detalj stranici |
| `EventRegistrationBox` | `event: Event` | Sidebar — rok prijave, CTA |

### `/components/breed/`

| Komponenta | Props | Gde |
|---|---|---|
| `BreedCard` | `breed: Breed` | /rase, /kategorije/[slug] |
| `BreedHero` | `breed: Breed` | /rase/[slug] |
| `BreedGallery` | `images: Image[]` | /rase/[slug] (lightbox) |
| `BreedCharacteristicsTable` | `characteristics: Object` | /rase/[slug] (size, weight, temperament...) |
| `BreedStandardSheet` | `pdfUrl: string` | Link za skidanje PDF standarda |

### `/components/blog/`

| Komponenta | Props | Gde |
|---|---|---|
| `ArticleCard` | `article: Article, variant: 'featured' \| 'default'` | /blog, home preview |
| `ArticleHero` | `article: Article` | /blog/[slug] vrh |
| `ArticleBody` | `body: PortableTextBlock[]` | Render PortableText sa custom blokovima |
| `AuthorByline` | `author: Author, publishedAt: Date, readingTime: number` | Ispod naslova |
| `AuthorBox` | `author: Author` | Na dnu posta (ispod tela) |
| `RelatedArticles` | `articles: Article[]` | Pre footera |
| `TableOfContents` | `headings: Heading[]` | Sticky sidebar (desktop) / accordion (mobile) |
| `ReadingProgressBar` | — | Tanka linija na vrhu, scroll progress |

### `/components/category/`

| Komponenta | Props |
|---|---|
| `CategoryCard` | `category: AnimalCategory` |
| `CategoryHero` | `category: AnimalCategory` |
| `CategoryGrid` | `categories: AnimalCategory[]` |

### `/components/organization/`

| Komponenta | Props |
|---|---|
| `OrganizationCard` | `org: Organization` |
| `OrganizationHero` | `org: Organization` |
| `OrganizationLogoGrid` | `orgs: Organization[]` (8 logo-a u footer-stilu) |

### `/components/shared/`

| Komponenta | Svrha |
|---|---|
| `Hero` | Generic hero sa eyebrow + display naslov + lead + CTA-ovi |
| `SectionTitle` | Eyebrow + display naslov + opciono "Vidi sve →" link |
| `Eyebrow` | Mali uppercase text sa accent bojom |
| `NewsletterSignup` | Email forma → POST `/api/newsletter` |
| `SearchBar` | Header pretraga + /pretraga page |
| `ShareButtons` | FB, Twitter, kopiraj link |
| `EmptyState` | "Nema rezultata" za filtere |
| `LoadMoreButton` | Paginacija "Učitaj još" |
| `Pagination` | Klasična < 1 2 3 ... > |
| `Image` | Wrapper oko `next/image` sa default alt validacijom |
| `Map` | Wrapper oko Leaflet (lazy loaded) |
| `IcsButton` | Generic "Dodaj u kalendar" |

### `/components/seo/`

| Komponenta | Svrha |
|---|---|
| `JsonLd` | Generic `<script type="application/ld+json">` |
| `EventJsonLd` | Schema.org Event |
| `ArticleJsonLd` | Schema.org Article |
| `BreadcrumbJsonLd` | Schema.org BreadcrumbList |
| `OrganizationJsonLd` | Globalni — u footer-u, jedan po sajtu |

### Ukupno komponenti

| Domen | Broj |
|---|---|
| ui (shadcn) | 10 |
| layout | 8 |
| event | 12 |
| breed | 5 |
| blog | 8 |
| category | 3 |
| organization | 3 |
| shared | 12 |
| seo | 5 |
| **Ukupno** | **66** |

---

## 2. SEO — finalne odluke

### URL i slug konvencije

- Latinica, lowercase, crtica umesto razmaka
- Bez dijakritika: `š→s, č→c, ć→c, ž→z, đ→dj`
- Maks 60 karaktera
- Implementacija: jedan util `/lib/slugify.ts` koji koristi i Sanity i frontend
- Kalendar filteri u **query parametrima**, ne dinamičkim segmentima (deljiv URL, jedinstven canonical)

### Title template

```
{Naslov stranice} | sitnezivotinje.com
```

Izuzeci:
- Homepage: `sitnezivotinje.com — Kalendar manifestacija sitnih životinja u Srbiji i regionu`
- /kalendar: `Kalendar manifestacija | sitnezivotinje.com`
- /kalendar/[slug]: `{Naziv eventa} — {datum} {Grad} | sitnezivotinje.com`
- /rase/[slug]: `{Naziv rase} — {Kategorija} | sitnezivotinje.com`
- /blog/[slug]: `{Naslov posta} | sitnezivotinje.com`
- /kategorije/[slug]: `{Naziv kategorije} — Rase, manifestacije, članci | sitnezivotinje.com`

### Meta description

- 150-160 karaktera
- Ako event/post ima `seo.metaDescription`, koristi to
- Inače: auto-generisano iz `excerpt`/`shortDescription`
- Mora sadržati ključnu reč i CTA gde je moguće
- Implementacija: `lib/seo.ts` ima `generateMetaDescription(content, fallback)`

### Canonical URL

- **Uvek** apsolutan: `https://sitnezivotinje.com/...`
- Filtrirane verzije `/kalendar?...` → canonical = `https://sitnezivotinje.com/kalendar` (bez parametara)
- Trailing slash: **bez** (Next.js default)
- Lokalizacija: canonical = primarna verzija (sr-Latn). Ostali jezici imaju `hreflang`.

### Open Graph / Twitter Card

Default OG slika: `siteSettings.defaultOgImage` (1200×630, JPEG).

Per-stranica OG:
- Event: koristi `poster` (ali resize na 1200×630, gradient overlay sa naslovom — generiše se preko `/api/og/event/[slug]`)
- Blog: koristi `coverImage` (resize na 1200×630, sa naslovom overlay-om)
- Rasa: `images[0]` resize
- Kategorija: `heroImage` resize
- Statičke stranice: `siteSettings.defaultOgImage`

Twitter Card: `summary_large_image` (uvek).

### hreflang

Na svakoj stranici koja postoji u više jezika:

```html
<link rel="alternate" hreflang="sr-Latn" href="https://sitnezivotinje.com/..." />
<link rel="alternate" hreflang="sr-Cyrl" href="https://sitnezivotinje.com/cir/..." />
<link rel="alternate" hreflang="en" href="https://sitnezivotinje.com/en/..." />
<link rel="alternate" hreflang="x-default" href="https://sitnezivotinje.com/..." />
```

URL prefix odluka: ćirilica = `/cir/`, engleski = `/en/`, latinica = `/` (default, bez prefiksa).

### Robots

`robots.txt`:

```
User-agent: *
Allow: /
Disallow: /admin
Disallow: /api
Disallow: /studio
Disallow: /pretraga
Disallow: /kalendar?*

Sitemap: https://sitnezivotinje.com/sitemap.xml
```

Filtrirane kalendar stranice (sa query parametrima) → `<meta name="robots" content="noindex,follow">` (ne indeksiraj, ali prati linkove).

### sitemap.xml

Auto-generisan iz Sanity-ja preko `app/sitemap.ts`. Uključuje:

- `/` (priority 1.0, daily)
- `/kalendar` (priority 0.9, daily)
- Sve `/kalendar/[slug]` (priority 0.8, weekly — do datuma eventa, posle weekly)
- Sve `/rase/[slug]` (priority 0.7, monthly)
- Sve `/savezi/[slug]` (priority 0.6, monthly)
- Sve `/blog/[slug]` (priority 0.7, monthly)
- Sve `/kategorije/[slug]` (priority 0.8, weekly)
- Statičke (`/o-nama`, `/kontakt`) (priority 0.4, yearly)

Revalidacija: `revalidate: 86400` (24h).

---

## 3. JSON-LD — strukturirani podaci

### Event (na `/kalendar/[slug]`)

```json
{
  "@context": "https://schema.org",
  "@type": "Event",
  "name": "Međunarodna izložba sitnih životinja Vršac 2026",
  "startDate": "2026-10-25T09:00:00+02:00",
  "endDate": "2026-10-27T18:00:00+02:00",
  "eventAttendanceMode": "https://schema.org/OfflineEventAttendanceMode",
  "eventStatus": "https://schema.org/EventScheduled",
  "location": {
    "@type": "Place",
    "name": "Sportska hala HMŠ",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "...",
      "addressLocality": "Vršac",
      "addressCountry": "RS"
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": 45.1208,
      "longitude": 21.2967
    }
  },
  "image": "https://sitnezivotinje.com/...",
  "description": "...",
  "organizer": {
    "@type": "Organization",
    "name": "UO Vršački prevrtač",
    "url": "https://sitnezivotinje.com/savezi/uo-vrsacki-prevrtac"
  },
  "offers": {
    "@type": "Offer",
    "url": "https://sitnezivotinje.com/kalendar/medjunarodna-izlozba-vrsac-2026",
    "price": "0",
    "priceCurrency": "RSD",
    "availability": "https://schema.org/InStock",
    "validFrom": "2026-09-01T00:00:00+02:00"
  }
}
```

### Article (na `/blog/[slug]`)

```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Kako sam za 5 godina odgojio prvog šampiona Srpskog visokoletača",
  "description": "...",
  "image": ["https://sitnezivotinje.com/..."],
  "datePublished": "2026-01-24T10:00:00+01:00",
  "dateModified": "2026-01-24T10:00:00+01:00",
  "author": {
    "@type": "Person",
    "name": "Marko Petrović",
    "url": "https://sitnezivotinje.com/autori/marko-petrovic"
  },
  "publisher": {
    "@type": "Organization",
    "name": "sitnezivotinje.com",
    "logo": {
      "@type": "ImageObject",
      "url": "https://sitnezivotinje.com/logo-512.png"
    }
  }
}
```

### BreadcrumbList (na svim stranicama osim home)

```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {"@type": "ListItem", "position": 1, "name": "Početna", "item": "https://sitnezivotinje.com"},
    {"@type": "ListItem", "position": 2, "name": "Kalendar", "item": "https://sitnezivotinje.com/kalendar"},
    {"@type": "ListItem", "position": 3, "name": "Vršac 2026", "item": "https://sitnezivotinje.com/kalendar/medjunarodna-izlozba-vrsac-2026"}
  ]
}
```

### Organization (globalni, u layout-u)

```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "sitnezivotinje.com",
  "url": "https://sitnezivotinje.com",
  "logo": "https://sitnezivotinje.com/logo-512.png",
  "sameAs": [
    "https://facebook.com/sitnezivotinje",
    "https://instagram.com/sitnezivotinje"
  ]
}
```

### WebSite (na home, sa SearchAction)

```json
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "url": "https://sitnezivotinje.com",
  "name": "sitnezivotinje.com",
  "potentialAction": {
    "@type": "SearchAction",
    "target": {
      "@type": "EntryPoint",
      "urlTemplate": "https://sitnezivotinje.com/pretraga?q={search_term_string}"
    },
    "query-input": "required name=search_term_string"
  }
}
```

---

## 4. Performanse — implementacioni checklist

| Zahtev | Implementacija |
|---|---|
| LCP < 2.5s | Hero slika `priority` na `<Image>`, preload preko `<link rel="preload">` |
| CLS < 0.1 | Sve slike sa eksplicitnim `width`/`height` ili `aspectRatio` |
| INP < 200ms | Bez sinhronih JS blokova u event handlers, debounce na pretragu |
| Lighthouse 90+ | Test `npm run build && npm run start` pa Chrome DevTools |
| Image format | AVIF + WebP fallback (next.config.ts → `images.formats`) |
| Font loading | `next/font` sa display: swap, subset latin + latin-ext (latinica) |
| ISR | `revalidate: 3600` na svim `[slug]` stranicama |
| Bundle size | Leaflet samo na /kalendar, lazy loaded |
| Third-party | Plausible (cookieless), bez GA, bez FB Pixel |

---

## 5. Migracije content-a iz Sanity-ja → Next.js

GROQ query primeri koje treba pripremiti u `/sanity/lib/queries.ts`:

```ts
// Sledeći featured event (za hero)
export const NEXT_FEATURED_EVENT = `*[_type == "event"
  && featuredOnHome == true
  && startDate >= now()]
  | order(startDate asc)[0]{
    _id, title, slug, startDate, endDate, shortDescription,
    location, eventType, category[]->{name, slug},
    poster, organizer->{name, slug, shortName}
  }`;

// Naredne manifestacije (do 4)
export const UPCOMING_EVENTS = `*[_type == "event"
  && startDate >= now()]
  | order(startDate asc)[0...4]{
    _id, title, slug, startDate, location, category[]->{name, slug, _id}, eventType, poster
  }`;

// Filterovani kalendar
export const FILTERED_EVENTS = `*[_type == "event"
  && ($country == "" || location.country->code == $country)
  && ($month == "" || (startDate >= $monthStart && startDate <= $monthEnd))
  && ($category == "" || $category in category[]->slug.current)
  && ($eventType == "" || eventType == $eventType)]
  | order(startDate asc)`;

// Featured kategorije za home (sve aktivne, redom)
export const HOME_CATEGORIES = `*[_type == "animalCategory"
  && !defined(parentCategory)]
  | order(displayOrder asc){
    _id, name, slug, shortDescription, icon,
    "breedCount": count(*[_type == "breed" && references(^._id)])
  }`;

// Najnoviji blog postovi (3)
export const RECENT_ARTICLES = `*[_type == "article"
  && publishedAt <= now()]
  | order(publishedAt desc)[0...3]{
    _id, title, slug, excerpt, publishedAt, readingTime,
    coverImage, author->{name, slug}, category->{name, slug}
  }`;
```

---

## 6. Sledeći korak — prelazak u implementaciju

Sve što ti treba pre `npm create next-app`:

- ✅ Sitemap (`design/01-sitemap.md`)
- ✅ Content modeli (`design/02-content-models.md`)
- ✅ Vizuelni pravac izabran — Varijanta C
- ✅ Tokens (`design/tokens.json`) — direktno se konzumira u `tailwind.config.ts`
- ✅ Wireframes (`design/04-wireframes.md`)
- ✅ HTML mockup (`design/mockup-home.html`) — otvori u browseru, vidi vizuelni jezik
- ✅ Komponentna mapa (66 komponenti, ovaj fajl)
- ✅ SEO odluke (URL, meta, JSON-LD, sitemap, robots — ovaj fajl)

Sledeća sesija: pratimo redosled iz `02-brief-claude-code.md` korak 1 — inicijalizacija Next.js 15 + TS + Tailwind + shadcn projekta sa pravim folder strukturom i `tailwind.config.ts` koji čita iz `tokens.json`.
