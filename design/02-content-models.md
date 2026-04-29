# Content modeli — Sanity v3 schemas

Definicije svih content tipova sa poljima, validacijama i UX napomenama za klijenta. Ovo je **izvor istine** za `/sanity/schemas/*.ts` fajlove.

Konvencije:
- Sva polja imaju srpski `title` i srpski `description` (help tekst)
- Sve validacione poruke su na srpskom
- Slike obavezno imaju `alt` (validation: required)
- Svaki tip sa public stranicom ima `slug` + `seo` polje
- `preview` definicija da editor vidi smisleno u listi

---

## 1. `event` — Manifestacija (najvažniji tip)

| Polje | Tip | Validacija | Help tekst |
|---|---|---|---|
| `title` | string | required, max 120 | "Pun naziv manifestacije, npr. 'Međunarodna izložba sitnih životinja Vršac 2026'" |
| `slug` | slug (source: title) | required, unique | "URL deo. Auto-generisan, ali možeš menjati. Latinica, bez kvačica." |
| `startDate` | datetime | required | "Datum i vreme početka. Vremenska zona Europe/Belgrade." |
| `endDate` | datetime | required, ≥ startDate | "Datum i vreme kraja. Za jednodnevne — isti dan, kraj radnog vremena." |
| `eventType` | string (enum) | required | "Tip događaja." |
| `category` | array<reference→AnimalCategory> | min 1 | "Koje kategorije životinja su zastupljene. Možeš birati više." |
| `isInternational` | boolean | default false | "Da li je izložba međunarodnog karaktera (učesnici iz više zemalja)." |
| `location` | object | required | (objekat ispod) |
| `description` | portableText | required | "Detaljan opis. Koristi naslove, liste, slike. Ovo se vidi na stranici eventa." |
| `shortDescription` | text (rows 3) | required, max 200 | "Kratak opis za karticu i meta opis. Maks 200 karaktera." |
| `organizer` | reference→Organization | required | "Glavni organizator. Bira se iz registra saveza/udruženja." |
| `coOrganizers` | array<reference→Organization> | optional | "Suorganizatori, ako postoje." |
| `contactPhone` | string | optional, format | "Telefon za informacije. Format: +381 11 234 5678" |
| `contactEmail` | email | optional | "Email za informacije." |
| `website` | url | optional | "Zvanični sajt manifestacije ili FB stranica." |
| `registrationDeadline` | datetime | optional | "Rok za prijavu izlagača. Ako ne postoji, ostavi prazno." |
| `registrationUrl` | url | optional | "Link ka prijavnoj formi/PDF prijavi." |
| `poster` | image | required, alt required | "Glavni plakat. Min 1200×1500. Vertikalno." |
| `gallery` | array<image> | optional, alt po slici | "Galerija sa prošlogodišnjeg izdanja, ako postoji." |
| `expectedExhibitors` | number | optional, min 0 | "Procena broja izlagača (za info na stranici)." |
| `expectedAnimals` | number | optional, min 0 | "Procena broja životinja." |
| `featuredOnHome` | boolean | default false | "Označi ako želiš da se ovaj event istakne na početnoj. Sajt automatski bira sledeći featured event." |
| `seo` | seo (object) | required | (deljeni objekat ispod) |

### `eventType` enum

| value | label (srpski) |
|---|---|
| `izlozba` | Izložba |
| `berza` | Berza |
| `specijalka` | Specijalka (klupska izložba) |
| `sajam` | Sajam |
| `kongres` | Kongres / skupština |

### `location` — embedded object

| Polje | Tip | Validacija | Help tekst |
|---|---|---|---|
| `city` | string | required | "Grad održavanja." |
| `country` | reference→Country | required | "Zemlja održavanja." |
| `venue` | string | required | "Naziv objekta (npr. 'Sportska hala Hemijsko-medicinske škole')." |
| `address` | string | optional | "Pun adresa, ako je dostupna." |
| `coordinates` | geopoint | optional | "Geo-koordinate za prikaz na mapi. Klikni 'Pin on map' u Sanity-ju." |

### Preview

```
title: title
subtitle: `${eventType} • ${city}, ${country.name} • ${formatDate(startDate)}`
media: poster
```

### Validacije specifične za event

- `endDate` mora biti `>=` `startDate`
- `registrationDeadline` mora biti `<` `startDate` (ako postoji)
- Ako `isInternational=true`, mora postojati `coOrganizers` ILI poseban tag (provera u UI)

---

## 2. `article` — Blog post

| Polje | Tip | Validacija | Help tekst |
|---|---|---|---|
| `title` | string | required, max 120 | "Naslov posta. Mora sadržati glavnu ključnu reč." |
| `slug` | slug (source: title) | required, unique | "URL deo." |
| `excerpt` | text (rows 3) | required, max 200 | "Kratak opis za listu i meta description." |
| `publishedAt` | datetime | required | "Datum objave. Postovi sa datumom u budućnosti se ne prikazuju." |
| `updatedAt` | datetime | auto | "Auto-postavljeno na vreme zadnje izmene." |
| `author` | reference→Author | required | "Autor posta." |
| `category` | reference→AnimalCategory | required | "Glavna kategorija (jedan post = jedna kategorija)." |
| `tags` | array<reference→Tag> | optional | "Dodatni tagovi za pretragu/filtere." |
| `coverImage` | image | required, alt required | "Naslovna slika. Min 1600×900. Horizontalna." |
| `body` | portableText | required | "Telo posta. Custom blokovi: slika, video embed, callout, tabela." |
| `relatedArticles` | array<reference→Article> | max 3 | "Srodni postovi (do 3). Ako prazno, automatski se biraju iz iste kategorije." |
| `readingTime` | number | auto | "Auto-izračunato u minutima (200 reči/min)." |
| `seo` | seo (object) | required | |

### Custom Portable Text blokovi

- `image` — sa caption-om i alt-om
- `videoEmbed` — YouTube/Vimeo URL → `<iframe>` sa lazy load
- `callout` — info/warning/success box
- `table` — jednostavna tabela (header row + data rows)

### Preview

```
title: title
subtitle: `${category.name} • ${formatDate(publishedAt)} • ${readingTime} min`
media: coverImage
```

---

## 3. `breed` — Rasa

| Polje | Tip | Validacija | Help tekst |
|---|---|---|---|
| `name` | string | required, max 80 | "Naziv rase, npr. 'Srpski visokoletač'." |
| `slug` | slug (source: name) | required, unique | |
| `category` | reference→AnimalCategory | required | "Kojoj kategoriji pripada." |
| `origin` | reference→Country | required | "Zemlja porekla rase." |
| `isAutochthonous` | boolean | default false | "Označi ako je rasa autohtona za zemlju porekla." |
| `recognitionStatus` | string (enum) | required | "Status priznavanja u krovnoj organizaciji." |
| `shortDescription` | text (rows 3) | required, max 250 | "Kratak opis za karticu i pretragu." |
| `fullDescription` | portableText | required | "Pun opis: istorija, namena, posebnosti." |
| `characteristics` | object | required | (objekat ispod) |
| `images` | array<image> | min 1, alt po slici | "Slike rase. Prva slika je glavna. Min 1200×800." |
| `standardDocument` | file (PDF) | optional | "Zvanični standard rase (PDF)." |
| `relatedBreeds` | array<reference→Breed> | max 4 | "Srodne rase (npr. različiti visokoletači)." |
| `seo` | seo (object) | required | |

### `recognitionStatus` enum

| value | label |
|---|---|
| `priznata` | Priznata |
| `u-radu` | U radu na priznavanju |
| `nepriznata` | Nije priznata |

### `characteristics` — embedded object

| Polje | Tip | Help tekst |
|---|---|---|
| `size` | string | "Veličina (npr. 'Srednja, 32-35 cm')." |
| `weight` | string | "Težina (npr. '450-550 g')." |
| `flightPattern` | string | "Način leta (samo za golubove). Npr. 'Visoki let, 4-6h'." |
| `temperament` | string | "Temperament (mirna, živahna, plašljiva...)." |
| `colorVarieties` | array<string> | "Varijeteti boja koji su priznati." |

### Preview

```
title: name
subtitle: `${category.name} • ${origin.name}${isAutochthonous ? ' • autohtona' : ''}`
media: images[0]
```

---

## 4. `organization` — Savez / udruženje

| Polje | Tip | Validacija | Help tekst |
|---|---|---|---|
| `name` | string | required | "Pun naziv organizacije." |
| `shortName` | string | optional | "Skraćenica (npr. 'AOS', 'HSUGPKPZ')." |
| `slug` | slug (source: shortName ?? name) | required, unique | |
| `type` | string (enum) | required | "Tip organizacije." |
| `country` | reference→Country | required | |
| `logo` | image | optional, alt required if present | "Logo organizacije. PNG sa transparentnom pozadinom." |
| `description` | portableText | required | "Opis organizacije, istorija, misija." |
| `president` | string | optional | "Ime i prezime predsednika." |
| `address` | string | optional | |
| `phone` | string | optional | |
| `email` | email | optional | |
| `website` | url | optional | |
| `socialMedia` | object | optional | "Linkovi ka FB, IG, YouTube." |
| `memberAssociations` | array<reference→Organization> | optional | "Članice (samo za krovne saveze)." |
| `recognizedBreeds` | array<reference→Breed> | optional | "Rase koje organizacija priznaje/standardizuje." |
| `seo` | seo (object) | required | |

### `type` enum

| value | label |
|---|---|
| `krovna-nacionalna` | Krovna nacionalna |
| `regionalna` | Regionalna |
| `gradska` | Gradska / lokalna |
| `specijalisticka` | Specijalistička (jedna rasa/kategorija) |
| `evropska` | Evropska / međunarodna |

### Preview

```
title: shortName ?? name
subtitle: `${type} • ${country.name}`
media: logo
```

---

## 5. `animalCategory` — Kategorija životinja

| Polje | Tip | Validacija | Help tekst |
|---|---|---|---|
| `name` | string | required | "Naziv kategorije, npr. 'Golubarstvo'." |
| `slug` | slug | required, unique | |
| `icon` | image (SVG) | required, alt required | "Ikona kategorije. SVG, jednoboja, 64×64." |
| `shortDescription` | text (rows 2) | required, max 160 | "Kratak opis za karticu na homepage-u." |
| `longDescription` | portableText | optional | "Duži opis za stranicu kategorije." |
| `heroImage` | image | required, alt required | "Hero slika za stranicu kategorije. Min 1920×800." |
| `parentCategory` | reference→AnimalCategory | optional | "Roditeljska kategorija (za podkategorije)." |
| `displayOrder` | number | required, default 0 | "Redosled prikaza. Manji broj = ranije." |
| `seo` | seo (object) | required | |

### Predefinisane kategorije (seed)

1. Golubarstvo (`golubarstvo`)
2. Živinarstvo (`zivinarstvo`)
3. Kunićarstvo (`kunicarstvo`)
4. Ptice (`ptice`)
5. Glodari i sitni ljubimci (`glodari`)

---

## 6. `country` — Zemlja

| Polje | Tip | Validacija |
|---|---|---|
| `name` | string | required |
| `code` | string (2 karaktera, ISO 3166-1) | required, unique |
| `flag` | image (SVG) | required |
| `displayOrder` | number | default 0 |

### Predefinisane (seed)

`rs, hr, si, ba, me, mk, hu, de, at, ro, eu` (eu = "Evropa" za EE-ove događaje)

---

## 7. `author` — Autor

| Polje | Tip | Validacija | Help tekst |
|---|---|---|---|
| `name` | string | required | |
| `slug` | slug | required | |
| `bio` | text | optional | "Kratka biografija." |
| `avatar` | image | optional, alt required if present | |
| `email` | email | optional | |
| `socialLinks` | object | optional | |

---

## 8. `tag` — Tag

| Polje | Tip | Validacija |
|---|---|---|
| `name` | string | required, unique |
| `slug` | slug | required, unique |

---

## 9. `page` — Statička stranica (singleton po slug-u)

Za `/o-nama`, `/kontakt`, `/uslovi-koriscenja`, `/politika-privatnosti`.

| Polje | Tip | Validacija |
|---|---|---|
| `title` | string | required |
| `slug` | slug | required, unique |
| `body` | portableText | required |
| `seo` | seo (object) | required |

---

## 10. `siteSettings` — Globalne postavke (singleton)

Jedan dokument za ceo sajt — header, footer, default OG slika, social linkovi.

| Polje | Tip | Help tekst |
|---|---|---|
| `siteName` | string | "Naziv sajta (default 'sitnezivotinje.com')." |
| `tagline` | string | "Slogan ispod naslova." |
| `logo` | image | "Logo. SVG preferirano." |
| `defaultOgImage` | image | "OG slika koja se koristi kad stranica nema svoju." |
| `mainNavigation` | array<object{label, url}> | "Stavke glavne navigacije." |
| `footerColumns` | array<object{title, links[]}> | "Footer kolone." |
| `socialLinks` | object{fb, ig, yt} | |
| `contactEmail` | email | "Default kontakt email (footer)." |
| `featuredEventOverride` | reference→Event | "Ručno biraj featured event za hero. Ako prazno, sistem bira sledeći featured." |

---

## 11. `seo` — Deljeni objekat (ne tip, već reusable)

| Polje | Tip | Validacija | Help tekst |
|---|---|---|---|
| `metaTitle` | string | max 60 | "Title tag. Ako prazno, koristi se title stranice. Maks 60 karaktera." |
| `metaDescription` | text | max 160 | "Meta description. 150-160 karaktera idealno." |
| `ogImage` | image | optional, alt required if present | "Slika za deljenje na društvenim mrežama. 1200×630." |
| `noIndex` | boolean | default false | "Označi da bi Google ignorisao ovu stranicu." |

---

## 12. Sažetak — broj tipova i odnosi

```
event ──→ organization (organizer)
event ──→ animalCategory (multi)
event ──→ country (preko location)
event ──→ siteSettings (featuredEventOverride)

article ──→ author
article ──→ animalCategory
article ──→ tag (multi)
article ──→ article (relatedArticles)

breed ──→ animalCategory
breed ──→ country (origin)
breed ──→ breed (relatedBreeds)

organization ──→ country
organization ──→ organization (memberAssociations)
organization ──→ breed (recognizedBreeds)

animalCategory ──→ animalCategory (parentCategory)

page (singleton po slug-u)
siteSettings (singleton)
```

11 content tipova ukupno: `event, article, breed, organization, animalCategory, country, author, tag, page, siteSettings` + reusable `seo` object.
