# Brief za Claude — Design faza

## Projekat: sitnezivotinje.com

Sajt namenjen zajednici odgajivača sitnih životinja u Srbiji i regionu. Glavni fokus: **kalendar manifestacija**, edukativni sadržaj, blog, registar nacionalnih saveza.

---

## 📋 Prompt za Claude (kopiraj ovo direktno)

> Pravim sajt **sitnezivotinje.com** — informativni portal i zajednicu za odgajivače sitnih životinja u Srbiji i regionu (BHS prostor + Mađarska/Slovenija). Niša je hobistička, ali zajednica je tradicionalna i ozbiljna — odgajivači, sudije, klubovi, izložbe sa decenijskom tradicijom.
>
> **Tematske celine sajta:**
> - Golubarstvo (uzgoj rasnih golubova — visokoletači, prevrtači, gušani, ukrasni)
> - Živinarstvo (rasne kokoške, patuljaste rase, patke, guske, fazani, biserke)
> - Kunićarstvo (rasni kunići — od patuljastih do džinovskih)
> - Uzgoj ptica (kanarinci, papagaji, egzote)
> - Glodari i sitni ljubimci (zamorčići, hrčci)
>
> **Glavna funkcija sajta — kalendar manifestacija** (izložbe, berze, sajmovi, specijalke) u Srbiji i regionu, sa filterima po zemlji, kategoriji životinja i mesecu.
>
> **Sekundarne funkcije:**
> - Blog / vesti / izveštaji sa izložbi
> - Registar nacionalnih saveza i krovnih organizacija (Srbija — AOS, Hrvatska — HSUGPKPZ, Mađarska — MGKSZ, Slovenija — SDGPMŽ, BiH, Crna Gora, Makedonija, EE Evropa)
> - Edukativni članci po kategorijama (autohtone rase, standardi, ishrana, bolesti)
> - Galerija (rase + izveštaji sa izložbi)
> - Kontakt forma
>
> **Reference koje sam istraživao:**
> - https://aos.rs/ — zvanični sajt Asocijacije odgajivača sitnih životinja Srbije (jednostavan, WordPress, fokus na kalendar i sekcije po vrstama životinja)
> - https://hsugpkpz.hr/ — Hrvatski savez (popis svih izložbi je njihov najjači adut)
> - https://www.bdrg.de/termine — Nemački savez (najprofesionalniji izgled u branši, dobra struktura termina)
> - https://entente-ee.com/ — Evropski savez
>
> **Šta želim drugačije od konkurencije:** AOS i HSUGPKPZ izgledaju kao tipični WordPress sajtovi udruženja iz 2010-ih — funkcionalni ali zastareli, bez stvarnog UX rada, slabi filteri u kalendaru, nema mape, slaba mobilna verzija. Moj sajt treba da bude **modernan ali topao** — niša je tradicionalna, korisnici su često stariji odgajivači koji vole jasnoću, ali i mlađi entuzijasti koji očekuju savremen UX.
>
> **Ciljna publika:**
> 1. Odgajivači (40–70 god.) — vole jasnu navigaciju, čitljiv tekst, brz pristup kalendaru i prijavama
> 2. Mlađi entuzijasti i početnici (20–40 god.) — žele edukativni sadržaj, lepe fotografije, mobile-first
> 3. Posetioci izložbi (svi uzrasti, porodice) — traže gde i kada je sledeća manifestacija u njihovom kraju
>
> **Vizuelni pravac koji mi se sviđa:**
> - Topla, prirodna paleta — zemljani tonovi (terakota, maslinasto zelena, kremasta, topla bež), eventualno akcent boja golubije plave ili bakarne
> - Tipografija sa karakterom — serif za naslove (npr. nešto kao Fraunces, EB Garamond, ili Lora), sans-serif za telo teksta (Inter, Source Sans 3)
> - Mnogo vazduha (whitespace), ne pretrpati
> - Fotografije životinja kao centralni vizuelni element — visokokvalitetne, ne stock
> - Suptilne ilustracije/ikone za rase i kategorije
> - Izbegavati: korporativni plavi/sivi vibe, generičke stock fotke, previše widgeta i bannera
>
> **Šta NE želim:**
> - Da liči na WordPress template iz 2015.
> - Da bude previše "agritech startup" — niša je hobistička i topla, ne industrijska
> - Da bude previše "lifestyle blog" — mora da deluje kao ozbiljan stručni resurs
>
> **Molim te da mi napraviš:**
> 1. **Moodboard / vizuelni koncept** — paleta, tipografija, hijerarhija, atmosfera
> 2. **Sitemap** sa svim glavnim i podstranama
> 3. **Wireframe homepage-a** sa svim ključnim sekcijama (hero, najavljeni event, kalendar preview, kategorije, blog preview, savezi, footer)
> 4. **Wireframe za stranicu kalendara** sa filterima — ovo je najvažnija stranica sajta
> 5. **Wireframe za detalj jedne manifestacije** (event page)
> 6. **Wireframe za blog post** i **kategorijsku stranicu** (npr. /golubarstvo)
> 7. **High-fidelity dizajn za homepage** kao demonstraciju vizuelnog jezika — neka bude HTML/CSS artifact koji mogu da vidim
>
> Sajt mora da podržava **CMS edit-flow** — klijent će dodavati evente, blog postove, slike, opise rasa. Imaj to u vidu kad praviš strukturu (svaka kartica/sekcija mora biti template-ski rešena, ne hardkodirana).
>
> Pišem na srpskom (latinica) primarno, ali sajt treba da podrži i ćirilicu kao opciju kasnije.

---

## 📐 Tehnički brief (dodatak)

Posle završene design faze, prebacujem u Claude Code za implementaciju. Stack koji razmatram (može da se razmeni u razgovoru sa Claude-om):

- **Next.js 15 + App Router** (SSG/ISR za blog i evente — odlično za SEO)
- **Sanity / Payload CMS / Directus** (klijent edit-flow) — Sanity je najjednostavniji za netehničke korisnike
- **Tailwind CSS + shadcn/ui** za komponente
- **Vercel** hosting

Alternativa: **WordPress sa kvalitetnom temom (npr. Blocksy ili Kadence)** + custom polja preko ACF — jeftinije za održavanje ako klijent voli WP backend, ali manje fleksibilno.

---

## 🎨 Smernice za diskusiju sa Claude-om u design fazi

Pitaj Claude da:

1. **Predloži 2-3 različita vizuelna pravca** sa moodboard opisom pre nego što fokusira na jedan
2. **Skicira strukturu kalendara** — najvažniji deo sajta — sa razmišljanjem o filterima (zemlja, mesec, kategorija životinje, tip događaja: izložba/berza/specijalka), prikazu (lista vs kalendar grid vs mapa), o povezivanju sa Google Calendar / iCal eksportom
3. **Predloži kako organizovati registar rasa** — autohtone vs međunarodne, po kategorijama, sa standardima
4. **Razmotri komponentu "Najbliža izložba u tvom kraju"** — automatska geolokacija, jako korisno
5. **Skicira member/community deo** — da li hoćeš da odgajivači mogu da se registruju, prijave svoja udruženja, postavljaju izveštaje

---

## ✅ Output design faze koji mi treba pre Code faze

Pre nego što pređemo u Claude Code, iz design faze izvlačim:

- [ ] Sitemap (.md ili dijagram)
- [ ] Lista svih content tipova sa poljima (Event, Blog Post, Rasa, Savez, Kategorija…)
- [ ] Color palette + typography (tačni kodovi, font fajlovi)
- [ ] Wireframes za 5–7 ključnih stranica
- [ ] HTML mockup homepage-a (artifact)
- [ ] Lista komponenti koje ću graditi (EventCard, RaseCard, FilterBar, CalendarGrid…)
- [ ] SEO odluke (URL struktura, slug pravila, meta template)

Sa ovim u rukama, prelazim u **02-brief-claude-code.md** za implementaciju.
