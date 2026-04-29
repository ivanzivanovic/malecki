# Brief za Claude Code (Sonnet) — Implementacija

## Projekat: sitnezivotinje.com

Implementacija sajta nakon završene design faze. Ovaj brief koristiš u **Claude Code** terminalu (ili u VS Code ekstenziji) — odgovara dužim agentskim sesijama gde Claude radi kroz fajlove.

---

## 📋 Početni prompt za Claude Code

> Implementiraj sajt **sitnezivotinje.com** na osnovu design materijala koje ću ti dati u repo-u (folder `/design/` sadrži wireframes, color palette, typography, sitemap, content modele).
>
> **Tech stack — koristi tačno ovo:**
> - **Next.js 15** sa App Router, TypeScript
> - **Tailwind CSS** + **shadcn/ui** komponente
> - **Sanity v3** kao CMS (headless) — schema definiši u `/sanity/schemas/`
> - **next-sanity** za fetch
> - **next-intl** za i18n (latinica/ćirilica/engleski)
> - **next-seo** + JSON-LD strukturirani podaci
> - **Vercel** deployment, ISR za stranice eventa i bloga
> - **Resend** ili **Brevo** za kontakt formu i newsletter
> - **Plausible** ili **Umami** analitika (privacy-friendly, bez kolačića — niša ne voli GDPR pop-up)
>
> **Svrha sajta:** kalendar manifestacija sitnih životinja u Srbiji i regionu + edukativni sadržaj o uzgoju (golubarstvo, živinarstvo, kunićarstvo, ptice, glodari).
>
> **Klijent će sam ažurirati sadržaj** — Sanity Studio mora biti maksimalno jednostavan, na srpskom, sa jasnim labelama i help tekstovima.

---

## 🗂️ Sitemap i URL struktura

```
/                              # Homepage
/kalendar                      # Glavni kalendar (najvažnija stranica!)
/kalendar/[slug]               # Detalj manifestacije
/kategorije                    # Pregled svih kategorija životinja
/kategorije/golubarstvo
/kategorije/zivinarstvo
/kategorije/kunicarstvo
/kategorije/ptice
/kategorije/glodari            # zamorčići, hrčci
/rase                          # Registar rasa
/rase/[slug]                   # Detalj rase (npr. /rase/srpski-visokoletac)
/savezi                        # Nacionalni savezi i krovne org.
/savezi/[slug]
/blog                          # Blog index
/blog/[slug]                   # Blog post
/o-nama
/kontakt
/uslovi-koriscenja
/politika-privatnosti
```

**Slug pravila:**
- Latinica, sve malim slovima, crtica umesto razmaka
- Bez dijakritika (š→s, č→c, ć→c, ž→z, đ→dj)
- Maks 60 karaktera
- Auto-generisanje iz naslova ali editor mora moći da menja

---

## 📦 Content modeli (Sanity schemas)

### 1. Event (manifestacija) — najvažniji tip

```
title: string                          # Naziv manifestacije
slug: slug (auto iz title)
startDate: datetime (required)
endDate: datetime (required)
location: object {
  city: string
  country: reference → Country
  venue: string                        # naziv hale/objekta
  address: string
  coordinates: geopoint                # za mapu
}
category: array of references → AnimalCategory  # multi-select
eventType: string (enum: izlozba|berza|specijalka|sajam|kongres)
isInternational: boolean
description: portableText              # rich text
organizer: reference → Organization
contactPhone: string
contactEmail: email
website: url
registrationDeadline: datetime
registrationUrl: url
poster: image (sa alt text)
gallery: array of images
expectedExhibitors: number
expectedAnimals: number
featuredOnHome: boolean                # da li ide na homepage
seo: seo object (meta title, meta desc, og image)
```

### 2. Article / Blog Post

```
title, slug, excerpt
publishedAt: datetime
updatedAt: datetime
author: reference → Author
category: reference → AnimalCategory
tags: array of references → Tag
coverImage: image
body: portableText (sa custom blokovima: image, embed, callout, table)
relatedArticles: array of references
readingTime: number (auto-calc)
seo: seo object
```

### 3. Breed / Rasa

```
name: string                           # Srpski visokoletač
slug
category: reference → AnimalCategory   # golub
origin: reference → Country
isAutochthonous: boolean               # autohtona za Srbiju
recognitionStatus: string (enum: priznata|u-radu|neprriznata)
shortDescription: text
fullDescription: portableText
characteristics: object {
  size: string
  weight: string
  flightPattern: string                # za golubove
  temperament: string
}
images: array of images
standardDocument: file (PDF)
relatedBreeds: array of references
```

### 4. Organization / Savez

```
name: string
slug
type: enum (krovna-nacionalna|regionalna|gradska|specijalisticka|evropska)
country: reference → Country
logo: image
description: portableText
president: string
address, phone, email, website
socialMedia: object {fb, ig, yt}
memberAssociations: array of references
recognizedBreeds: array of references → Breed
```

### 5. AnimalCategory (taksonomija)

```
name: string                           # Golubarstvo
slug                                   # golubarstvo
icon: image (SVG)
shortDescription: string
heroImage: image
parentCategory: reference (self)       # za podkategorije
```

### 6. Country, Author, Tag — standardni helper modeli

---

## 🎯 Stranice — implementacioni prioriteti

### Prioritet 1 (MVP, prva 2 sprinta)

1. **Homepage** — hero, sledeća velika manifestacija, kalendar preview (3-5 najbližih), kategorije grid, blog preview (3 posta), savezi
2. **/kalendar** — lista + grid + map view, filteri (zemlja, mesec, kategorija, tip), pretraga, paginacija
3. **/kalendar/[slug]** — pun event sa mapom, dugme "Dodaj u kalendar" (.ics download), share, slični eventi
4. **/blog i /blog/[slug]** — bazičan blog
5. **/kategorije/[slug]** — kategorijska stranica sa rasama + blog filter
6. **Sanity Studio** — sve šeme, srpske labele, help tekstovi
7. **SEO osnove** — sitemap.xml, robots.txt, meta tagovi, OG slike

### Prioritet 2

8. **/rase i /rase/[slug]** — registar rasa
9. **/savezi i /savezi/[slug]** — savezi
10. **Kontakt forma** sa Resend
11. **Newsletter signup** (Brevo)
12. **i18n** — latinica + ćirilica (engleska verzija opciono)

### Prioritet 3 (kasnije)

13. **User accounts** — odgajivači mogu da prijave svoje udruženje, postave izveštaj
14. **Submit event** forma — frontend forma koja klijent odobrava u Sanity-ju
15. **Galerija** sa lightbox-om
16. **PWA** za mobilni
17. **RSS feed**

---

## 🔍 SEO — detaljan brief

SEO je **kritičan** jer je niša mala i traffic dolazi pretežno organski (Google "izlozba sitnih zivotinja Srbija", "uzgoj kunica", "rasni golubovi"). Čine se sledeće stvari:

### Tehnički SEO

- **Static generation (SSG)** za sve evente i blog postove → ISR sa revalidate 3600s
- **sitemap.xml** auto-generisan iz Sanity-ja, dnevno osvežavan
- **robots.txt** dozvoljava sve osim `/admin`, `/api`, `/studio`
- **Canonical URLs** na svim stranicama
- **hreflang** tagovi za sr-Latn, sr-Cyrl, en
- **Strukturirani podaci (JSON-LD):**
  - Event schema na svakoj manifestaciji (location, startDate, endDate, organizer, offers)
  - Article schema na blog postovima
  - BreadcrumbList na svim stranicama osim homepage-a
  - Organization schema u footeru
- **Web Vitals** — LCP < 2.5s, CLS < 0.1, INP < 200ms (testiraj na PageSpeed)
- **Image optimization** — Next.js `<Image>` svuda, AVIF + WebP, lazy load
- **Font loading** — `next/font` sa display: swap, subset za latinicu

### On-page SEO

- **Title template:** `{Naziv stranice} | sitnezivotinje.com`
- **Meta description:** 150–160 karaktera, generisan iz excerpt-a + CTA
- **H1** uvek tačno jedan po stranici, sadrži glavnu ključnu reč
- **Alt text** obavezan za sve slike u Sanity-ju (validacija)
- **Internal linking** — svaki event linkuje na kategoriju + savez + grad; svaki blog post linkuje na 2-3 srodna posta
- **URL slug** — kratak, čitljiv, sa ključnom rečju

### Ključne reči (research već urađen)

Glavne (high intent):
- "izložba sitnih životinja [grad]"
- "berza golubova [grad]"
- "uzgoj kunića"
- "rasni golubovi prodaja"
- "sajam peradarstva sombor"
- "kalendar izložbi srbija"

Long-tail (edukativni):
- "kako gajiti rasne kokoške"
- "srpski visokoletač karakteristike"
- "patuljasta rasa kunića"
- "ishrana mladih golubova"
- "bosanska džudža"

### Lokalni SEO

- **Google Business Profile** (ako klijent ima fizičku adresu udruženja)
- **Schema LocalBusiness** za organizatore
- **NAP konzistentnost** (Name, Address, Phone) na svim platformama

### Sadržaj-SEO sinergija

- Predloži klijentu blog kalendar od 2-3 posta nedeljno tokom izložbene sezone (oktobar–februar)
- Auto-generisani izveštaji posle svake izložbe (template u Sanity-ju)
- Stranice "Najbolje izložbe u [mesec]" — evergreen sadržaj koji se osvežava godišnje

---

## 🎨 UI komponente koje treba napraviti

```
/components
  /ui                    # shadcn primitives
  /layout
    Header.tsx
    Footer.tsx
    Navigation.tsx       # desktop + mobile drawer
    LanguageSwitcher.tsx
  /event
    EventCard.tsx        # za grid i list view
    EventCalendarGrid.tsx
    EventListView.tsx
    EventMapView.tsx     # Leaflet ili Mapbox
    EventFilters.tsx     # multi-select country, category, type, date range
    EventCountdown.tsx   # za hero "Sledeća izložba"
    AddToCalendarButton.tsx  # generates .ics
  /breed
    BreedCard.tsx
    BreedGallery.tsx
    BreedStandardSheet.tsx
  /blog
    ArticleCard.tsx
    ArticleBody.tsx      # sa custom Sanity blokovima
    AuthorByline.tsx
    RelatedArticles.tsx
    TableOfContents.tsx
  /shared
    Hero.tsx
    SectionTitle.tsx
    NewsletterSignup.tsx
    SearchBar.tsx
    ShareButtons.tsx
    Breadcrumbs.tsx
```

---

## ✅ Definition of Done po feature-u

Svaki feature je gotov tek kad:

1. ✅ Implementiran u kodu sa TypeScript tipovima
2. ✅ Responzivan (mobile 375px, tablet 768px, desktop 1280px)
3. ✅ Dostupan keyboard-only (focus rings, skip links, ARIA)
4. ✅ Lighthouse score 90+ na svim metrikama
5. ✅ SEO meta tagovi i strukturirani podaci validirani na schema.org/validator
6. ✅ Sanity schema sa srpskim labelama i help tekstom
7. ✅ Klijent može sam da uredi sadržaj (test sa demo podacima)
8. ✅ Loading i error stanja pokrivena
9. ✅ Tested na Chrome, Firefox, Safari (desktop + iOS)

---

## 🚀 Deployment workflow

```
main branch        → production (sitnezivotinje.com) na Vercel
staging branch     → staging.sitnezivotinje.com
feature branches   → preview deploys

Sanity:
production dataset → live sajt
staging dataset    → staging sajt
```

GitHub Actions: lint + typecheck + build na svaki PR.

---

## 📝 Pitaj Claude Code da uradi prvo:

1. **Inicijalizuj Next.js 15 + TS + Tailwind + shadcn/ui** projekat
2. **Postavi Sanity Studio** sa svim šemama iznad, srpski labelovan
3. **Napravi seed data** sa 5 demo eventa, 3 blog posta, 2 rase, 2 saveza
4. **Implementuj layout** (Header, Footer, Nav) na osnovu design tokena iz `/design/tokens.json`
5. **Implementuj homepage** sa svim sekcijama
6. **Implementuj `/kalendar`** sa filterima i list view-om — pa onda dodaj grid i map view
7. **Implementuj event detail** sa AddToCalendar i mapom
8. **SEO setup** — sitemap, robots, JSON-LD na event i blog stranicama
9. **Deploy na Vercel** sa staging environmentom
10. **Predaj klijentu Sanity Studio** sa kratkim Loom video tutorijalom (ovo radim ja, ne ti)

---

## 💡 Saveti za rad sa Claude Code

- **Čitaj postojeće fajlove pre pisanja** — klauzula koja Claude-u retko treba podsećanje, ali pomaže
- **Radi inkrementalno** — jedan commit po feature-u, ne pravi mega-PR-ove
- **Testiraj Sanity schema-e** sa demo sadržajem pre nego što gradiš UI nad njima
- **Drži CLAUDE.md u root-u repo-a** sa pravilima projekta (naming convention, kako se dodaje nova stranica, kako se dodaje nova rasa u Sanity)
- **Koristi `npm run dev` paralelno sa Sanity Studio-om** (`npm run sanity` na portu 3333)
