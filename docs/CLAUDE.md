# CLAUDE.md — sitnezivotinje.com

Pravila projekta. Čitaj pre svake sesije. Za pun kontekst (sitemap, content modeli, SEO plan) vidi `docs/brief-design.md` i `docs/brief-implementation.md`. Za sadržajni research (izložbe, savezi) vidi `docs/izlozbe-sitnih-zivotinja.md`.

---

## Stack (zaključano)

- Next.js 15 + App Router + TypeScript (strict mode)
- Tailwind CSS + shadcn/ui
- Sanity v3 (CMS) + `next-sanity` za fetch
- next-intl (i18n)
- next-seo + JSON-LD
- Vercel deploy, ISR `revalidate: 3600` za event i blog stranice
- Resend (kontakt forma) + Brevo (newsletter)
- Plausible analitika (bez kolačića, bez GDPR pop-up-a)

Ne menjaj stack bez izričitog pitanja.

---

## Jezik i lokalizacija

- Primarni jezik sajta: **srpski, latinica (sr-Latn)**
- Sekundarni: srpski ćirilica (sr-Cyrl), engleski (en)
- **Sve Sanity labele, help tekstovi i validacione poruke su na srpskom (latinica)**
- Klijent je netehnički — svaki Sanity field mora imati `description` koji jasno objašnjava šta unosi
- UI tekst, dugmad, prazna stanja: srpski, latinica
- Komentari u kodu: engleski (standard)
- Commit poruke: engleski, imperativ ("add event filters", ne "added filters")

---

## Slug konvencije

- Latinica, sve malim slovima, crtica umesto razmaka
- Bez dijakritika: š→s, č→c, ć→c, ž→z, đ→dj
- Maks 60 karaktera
- Auto-generisanje iz `title`/`name` polja, ali editor mora moći ručno da menja
- Koristi jedan slugify util u `/lib/slugify.ts` — ne duplikati po fajlovima

---

## Folder struktura

```
/app                  Next.js App Router
/components
  /ui                 shadcn primitives (ne diraj rukom — koristi CLI)
  /layout             Header, Footer, Navigation, LanguageSwitcher
  /event              EventCard, EventFilters, EventMapView, AddToCalendarButton...
  /breed              BreedCard, BreedGallery, BreedStandardSheet
  /blog               ArticleCard, ArticleBody, RelatedArticles, TableOfContents
  /shared             Hero, NewsletterSignup, SearchBar, Breadcrumbs, ShareButtons
/lib                  utils (slugify, date, ics generator, sanity client)
/sanity
  /schemas            content modeli — jedan fajl po tipu
  /lib                queries (GROQ), client config
/messages             i18n stringovi (sr-Latn.json, sr-Cyrl.json, en.json)
/public
```

Komponenta ide u domenski folder, ne u `/components` root. Ako se koristi na 3+ mesta i nije domenski, idi u `/shared`.

---

## Content tipovi (Sanity)

Sve šeme su definisane u `/sanity/schemas/`. Glavni tipovi:
**Event, Article, Breed, Organization, AnimalCategory, Country, Author, Tag**

Pri kreiranju **bilo kog** novog tipa (ili polja) obavezno:

1. `title` polje na srpskom: `title: 'Naziv manifestacije'`
2. `description` polje (help tekst za klijenta) na srpskom
3. `slug` polje gde god ima public URL, sa source-om i slugify util-om
4. `seo` polje (object: metaTitle, metaDescription, ogImage) na svim tipovima koji imaju javnu stranicu
5. `image` polja **moraju** imati `alt` (validation: required, custom poruka na srpskom)
6. Validation pravila sa srpskim porukama: `Rule.required().error('Naslov je obavezan')`
7. `preview` definicija da editor vidi smisleno u listi

---

## SEO — non-negotiable

- Svaka public stranica ima: `<title>`, meta description (150-160 char), canonical URL, OG tagove
- Title template: `{Naziv stranice} | sitnezivotinje.com`
- Tačno **jedan H1** po stranici, sadrži glavnu ključnu reč
- Strukturirani podaci (JSON-LD):
  - `Event` schema na `/kalendar/[slug]` (location, startDate, endDate, organizer, offers)
  - `Article` schema na `/blog/[slug]`
  - `BreadcrumbList` na svim stranicama osim homepage-a
  - `Organization` schema u footeru (globalno)
- `sitemap.xml` auto-generisan iz Sanity, dnevno revalidiran
- `robots.txt` blokira `/admin`, `/api`, `/studio`
- `hreflang` tagovi za sr-Latn, sr-Cyrl, en gde god postoji prevod
- Alt text obavezan na **svakoj** slici (validacija u Sanity-ju)

---

## Performanse — non-negotiable

- Lighthouse 90+ na Performance, Accessibility, Best Practices, SEO
- LCP < 2.5s, CLS < 0.1, INP < 200ms
- Slike: uvek `next/image`, AVIF + WebP, lazy load (osim hero LCP slike)
- Fontovi: `next/font`, `display: swap`, subset za latinicu (i ćirilicu kad se uključi)
- Bez client-side data fetchinga za stvari koje mogu biti SSG/ISR
- `dynamic = 'force-static'` gde god ima smisla, ISR `revalidate: 3600` za content stranice

---

## Pristupačnost (a11y)

- Keyboard-only navigacija mora raditi svuda (Tab, Enter, Escape)
- Focus rings vidljivi (ne `outline: none` bez zamene)
- ARIA labele za ikone-only dugmad
- Skip-to-content link u Header-u
- Kontrast minimum WCAG AA (4.5:1 za tekst)
- Forme: `<label>` povezan sa input-om, error poruke `aria-describedby`

---

## Responsive breakpoints

Testiraj svaki feature na **3 širine pre commita**:
- 375px (mobile, iPhone SE)
- 768px (tablet)
- 1280px (desktop)

Mobile-first u Tailwind klasama. Ne piši desktop-first pa "fixaj" mobile.

---

## Definition of Done (po feature-u)

Feature nije gotov dok nije:

1. TypeScript bez `any`, bez `@ts-ignore`
2. Responzivan (375 / 768 / 1280)
3. Keyboard-accessible, focus rings, ARIA
4. Lighthouse 90+ (testiraj lokalno: `npm run build && npm run start` pa Lighthouse u Chrome DevTools)
5. SEO meta + JSON-LD validirani na schema.org/validator (gde aplicira)
6. Sanity schema sa srpskim labelama + help tekstom + preview
7. Loading state i error state pokriveni
8. Demo podaci (seed) da klijent vidi kako izgleda
9. Testirano u Chrome, Firefox, Safari (desktop) + iOS Safari (mobile)

---

## Pre commita (svaki put)

```bash
npm run lint
npm run typecheck
npm run build
```

Sva tri moraju proći. Ne commit-uj `console.log`, `TODO` bez issue broja, ili zakomentarisan kod.

---

## Git workflow

- `main` → production (sitnezivotinje.com)
- `staging` → staging.sitnezivotinje.com
- Feature grane: `feat/event-filters`, `fix/calendar-mobile`, `chore/deps-update`
- **Jedan feature = jedan PR**, ne mega-PR-ovi
- Commit poruke: engleski, imperativ, kratko (`add map view to calendar`, ne `Added the map view`)

---

## Šta NE raditi

- Ne menjaj stack bez pitanja (Next 15, Sanity, Tailwind, shadcn — zaključano)
- Ne dodaji nove dependency-je bez razmišljanja (proveri da li `lib/` već ima util)
- Ne hardkoduj sadržaj koji bi trebalo da je u Sanity-ju (lista kategorija, naslovi sekcija → Sanity ili `/messages` JSON)
- Ne pravi komponente sa 200+ linija — razdvoji
- Ne koristi `any` u TS
- Ne piši inline stilove osim za dinamičke vrednosti (CSS var, transform iz JS)
- Ne dodaji GDPR pop-up — niša ga ne voli, koristimo Plausible (cookieless)
- Ne koristi stock fotografije sa watermark-om ili niskoreyolucijskim — slike rasa moraju biti kvalitetne (klijent obezbeđuje)

---

## Kad nešto nije jasno

Pre nego što pretpostaviš — **pitaj**. Bolje 30 sekundi pojašnjenja nego 30 minuta refaktorisanja.

Ako moraš da pretpostaviš (mali detalj, blocker za nastavak): napiši pretpostavku eksplicitno u PR opisu, da se vidi i potvrdi.
