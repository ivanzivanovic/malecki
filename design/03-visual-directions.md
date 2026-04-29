# Vizuelni pravci — 3 varijante

Cilj: predložiti 3 različite estetike koje sve odgovaraju brief-u ("topla, prirodna, ozbiljna ali ne korporativna"), ali sa različitim akcentima. Biraš jednu (ili kombinaciju), na osnovu nje pravim `tokens.json` i HTML mockup.

Svaka varijanta ima: paletu (sa hex-ovima i ulogama), tipografiju (sa Google Fonts linkovima), atmosferu i primere upotrebe.

---

## Varijanta A — "Stara škola, topla zemlja"

**Glavna ideja:** terakota i maslina, papir-bež pozadina, klasični serif za naslove. Liči na monografiju o autohtonim rasama, ali sa modernim mrežnim dizajnom. Najbliže brief-u "topla i tradicionalna".

### Paleta

| Uloga | Hex | Naziv |
|---|---|---|
| Background (primary) | `#FAF7F2` | Papir-bež |
| Background (alt sekcije) | `#F0E9DC` | Topla krem |
| Surface (kartice) | `#FFFFFF` | Belo |
| Border / divider | `#E2D9C7` | Bež-siva |
| Text (primary) | `#2A2520` | Tamna kafa (bolje od pure black za topli vibe) |
| Text (muted) | `#6B6359` | Siva-zemljana |
| Brand (primary CTA) | `#B5532A` | Terakota |
| Brand (hover) | `#9A4422` | Tamna terakota |
| Accent (sekundarni) | `#5C6B3D` | Maslinasto zelena |
| Accent (highlight) | `#C9A24A` | Senf-zlatna (za badge-ove "novo", "featured") |
| Success | `#5C6B3D` | (ista kao accent) |
| Warning | `#C9A24A` | (ista kao highlight) |
| Error | `#9A4422` | (tamna terakota) |

### Tipografija

- **Naslovi (H1-H3):** `Fraunces` 700, slight optical sizing — moderan serif sa karakterom, varijabilan font
  - Google Fonts: `https://fonts.google.com/specimen/Fraunces`
- **Telo teksta i UI:** `Inter` 400/500 — neutralan, čitljiv, ćirilica podržana
  - Google Fonts: `https://fonts.google.com/specimen/Inter`
- **Akcenat / quote / brojevi (npr. "1.700+ eksponata"):** `Fraunces` 400 italic

### Atmosfera

- Mnogo whitespace-a, ne pretrpati
- Tanki border-i (1px `#E2D9C7`) umesto box-shadow-a
- Fotografije bez border-radius-a (oštri uglovi) za "ozbiljan resurs" feel
- CTA dugme: terakota fill, beli tekst, mali border-radius (4px)
- Hover stanja: laganu pomeranje senke ili boje, bez animacija "wow"

### Kad biraš ovo

- Ako hoćeš da sajt ima karakter "stručne monografije", da odgajivači stariji od 50 odmah osete da je "ovo neko ko zna"
- Ako voliš serif tipografiju za naslove
- Ako želiš najmanju distancu od konkurencije (AOS/HSUGPKPZ) — oni su već u toplim tonovima, ali nemaju konzistentnost; mi je donosimo

### Rizik

- Može da deluje "prestaro" ako se preteže serif. Mora se balansirati sa modernim layout-om (grid, kartice, jasni razmaci).

---

## Varijanta B — "Moderna evropska, golubije plavo"

**Glavna ideja:** golubije plava + bakarna kao akcent, kremasta pozadina, savremeni grotesque sans za naslove. Bliska estetici nemačkog BDRG sajta (`bdrg.de`), ali toplije i sa više karaktera. Više "EE Evropa, profesionalno".

### Paleta

| Uloga | Hex | Naziv |
|---|---|---|
| Background (primary) | `#F7F5F0` | Krem-belo |
| Background (alt sekcije) | `#EAE6DD` | Tamniji krem |
| Surface (kartice) | `#FFFFFF` | Belo |
| Border / divider | `#D9D3C5` | Bež-siva |
| Text (primary) | `#1F2937` | Tamno antracit (skoro crna) |
| Text (muted) | `#6B7280` | Neutralna siva |
| Brand (primary CTA) | `#3B5C7A` | Golubije plava |
| Brand (hover) | `#2C4660` | Tamna golubije plava |
| Accent (sekundarni) | `#A8743D` | Bakarna |
| Accent (highlight) | `#D4A574` | Svetla bakarna (za badge-ove) |
| Success | `#4A7C59` | Maslinasto zelena |
| Warning | `#D4A574` | Bakarna svetla |
| Error | `#A0392B` | Tamno crvena |

### Tipografija

- **Naslovi (H1-H3):** `Manrope` 700/800 — moderan grotesque sa toplinom
  - Google Fonts: `https://fonts.google.com/specimen/Manrope`
- **Telo teksta i UI:** `Manrope` 400/500 ILI `Source Sans 3` 400/500 (više tradicionalan)
- **Akcenat (datumi, brojevi):** `JetBrains Mono` 500 — dodaje "data-driven" osećaj kalendaru

### Atmosfera

- Karte sa box-shadow-om (`shadow-sm`/`shadow-md`), sa border-radius-om 8px
- Fotografije sa malim border-radius-om (8px), suptilni overlay sa gradijentom za naslov
- CTA dugme: plava fill, beli tekst, border-radius 6px, hover: pomera 1px gore + tamnija plava
- Više interaktivnih mikro-animacija (200ms ease)

### Kad biraš ovo

- Ako želiš da sajt deluje "evropski moderno" i "profesionalno"
- Ako voliš sans-serif tipografiju
- Ako planiraš dosta podataka u kalendaru (filteri, brojevi izlagača) — sans + mono kombinacija odlično podržava data-heavy UI
- Ako misliš da će sajt rasti ka B2B (sponzori, oglašivači, partneri)

### Rizik

- Može da bude "previše hladno" ili "korporativno" ako se ne pazi na fotografije i tekst
- Bliže je BDRG/HSUGPKPZ vibe-u — ne diferencira se toliko

---

## Varijanta C — "Editorial monografija, magazinski"

**Glavna ideja:** dvojna tipografija (visoki kontrast: serif display + sans body), velike fotografije kao centralni element, dosta belog. Liči na editorial sajt ili magazin (npr. *Cereal*, *Kinfolk*, *The Marginalian*) — ali sa funkcionalnim kalendarom umesto eseja. Najsavremenija od tri varijante.

### Paleta

| Uloga | Hex | Naziv |
|---|---|---|
| Background (primary) | `#FFFFFF` | Belo |
| Background (alt sekcije) | `#F4F1EC` | Topli krem |
| Surface (kartice) | `#FFFFFF` | Belo |
| Border / divider | `#E5E1D8` | Bež |
| Text (primary) | `#0F0E0C` | Skoro crna |
| Text (muted) | `#73706A` | Topla siva |
| Brand (primary CTA) | `#1F2A1A` | Tamna šuma-zelena |
| Brand (hover) | `#0F1A0A` | Tamnija šuma |
| Accent (sekundarni) | `#B8763E` | Topla cigla |
| Accent (highlight) | `#E8DFC9` | Bež-zlatna (subtle) |
| Success | `#1F2A1A` | (ista kao brand) |
| Warning | `#B8763E` | (ista kao accent) |
| Error | `#8B2E1F` | Tamna cigla |

### Tipografija

- **H1 / display:** `EB Garamond` 500 italic — klasični serif sa eleganciom (samo za hero-e)
  - Google Fonts: `https://fonts.google.com/specimen/EB+Garamond`
- **H2-H4:** `Fraunces` 600 (kontrast prema italic display-u)
- **Telo teksta:** `Source Sans 3` 400/600 — čitljiv, neutralan, ne otima pažnju od fotografija
  - Google Fonts: `https://fonts.google.com/specimen/Source+Sans+3`
- **Eyebrow / kategorija (mali capslock tekst iznad naslova):** `Source Sans 3` 600 uppercase, 11px, letter-spacing 0.1em

### Atmosfera

- Velike fotografije edge-to-edge ili sa generoznim margin-ima
- Naslovi sa italic display fontom — emocionalniji, manje "javna ustanova" više "magazin za stručnjake"
- Kartice bez border-shadow-a — samo razmak i suptilan border-bottom
- Mnogo whitespace-a oko hero sekcija
- CTA: tamno zelena, beli tekst, bez border-radius-a (oštri pravougaonici), uppercase tekst sa letter-spacing-om

### Kad biraš ovo

- Ako hoćeš da sajt bude "vizuelno najambiciozniji" u branši
- Ako klijent može da obezbedi **odlične fotografije** (ovo je *uslov*; sa stock-om ne radi)
- Ako voliš editorial estetiku i veruješ da ona privlači mlađe entuzijaste
- Ako misliš da je "lep dizajn" diferencijator (jer u branši to niko ne radi)

### Rizik

- **Najveći rizik:** zavisi od kvaliteta fotografija. Bez njih izgleda prazno
- Stariji odgajivači mogu osećati "ovo nije za mene" — italic naslovi su odvažniji
- Više rada na finalnom polishingu

---

## Sve tri u tabeli — uporedi brzo

| | A — Stara škola | B — Moderna EU | C — Editorial |
|---|---|---|---|
| Naslovni font | Fraunces (serif) | Manrope (sans) | EB Garamond italic + Fraunces |
| Body font | Inter | Manrope ili Source Sans | Source Sans 3 |
| Brand boja | Terakota `#B5532A` | Golubije plava `#3B5C7A` | Tamna šuma `#1F2A1A` |
| Akcent | Maslina `#5C6B3D` | Bakarna `#A8743D` | Cigla `#B8763E` |
| Pozadina | Papir-bež `#FAF7F2` | Krem `#F7F5F0` | Belo `#FFFFFF` |
| Vibe | Stručna monografija | Profesionalan EU portal | Magazin / editorial |
| Risk | Može delovati staro | Može delovati hladno | Zavisi od fotografija |
| Diferencijacija od AOS/HSUGPKPZ | Velika | Srednja | Najveća |
| Pristupačnost stariji odgajivači | Najveća | Srednja | Najmanja |

---

## Moja preporuka

**Varijanta A** kao baza, sa **jednom pozajmicom iz C** (editorial eyebrow tekst — mali uppercase tag iznad naslova, npr. "MEĐUNARODNA IZLOŽBA • SRBIJA"). Razlozi:

1. Brief eksplicitno traži "topla, prirodna paleta" + "serif za naslove" (Fraunces, EB Garamond, Lora) — A ovo direktno isporučuje
2. Ciljna grupa #1 (odgajivači 40-70) se najbolje osećaju u A, najmanje u C
3. Diferencijacija od konkurencije je velika (oni nemaju karakter, mi imamo)
4. Eyebrow tekst iz C dodaje moderan funkcionalni element (kategorizacija, scan-nability) bez razbijanja toplog vibe-a
5. Najlakša implementacija — Tailwind + jedan serif font + jedan sans font, bez ekstremnog kontrasta

**Šta biraš?** Reci A, B, C, ili "A + nešto iz B/C" pa idem na `tokens.json` i HTML mockup. Ako nemaš jako mišljenje, idem sa A + eyebrow iz C.
