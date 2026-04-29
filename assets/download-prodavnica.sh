#!/usr/bin/env bash
# Downloads product photos from Pexels for the shop.
set -e

API="${PEXELS_API_KEY:?Set PEXELS_API_KEY env var first: export PEXELS_API_KEY=...}"
DEST="c:/source/repos/sitne-zivotinje/images/prodavnica"
mkdir -p "$DEST"

download() {
  local query="$1"
  local fname="$2"
  if [ -f "$DEST/$fname" ]; then
    echo "SKIP: $fname"
    return
  fi
  local enc
  enc=$(echo "$query" | sed 's/ /+/g')
  local resp
  resp=$(curl -s -H "Authorization: $API" \
    "https://api.pexels.com/v1/search?query=${enc}&per_page=1&orientation=landscape")
  local url
  url=$(echo "$resp" | grep -oE '"large":"[^"]+"' | head -1 \
    | sed 's/"large":"//;s/"$//;s/\\u0026/\&/g;s|\\/|/|g')
  if [ -z "$url" ]; then
    echo "FAIL: $query"
    return
  fi
  curl -s -L -o "$DEST/$fname" "$url"
  if [ -s "$DEST/$fname" ]; then
    echo "OK: $fname"
  else
    rm -f "$DEST/$fname"
    echo "FAIL empty: $fname"
  fi
  sleep 0.2
}

# ===== Knjige i katalozi (12) =====
download "old leather book"           "standardi-golubova.jpg"
download "rabbit book illustration"   "standardi-kunica.jpg"
download "chicken book farm"          "rasna-zivina-vodic.jpg"
download "bird songbook canary"       "pevanje-kanarinaca.jpg"
download "hamster guide book"         "hrcci-vodic.jpg"
download "vintage hardcover book"     "katalog-golubova.jpg"
download "antique book stack"         "autohtone-rase-srbije.jpg"
download "old monograph book"         "backi-prevrtac-monografija.jpg"
download "anatomy textbook"           "anatomija-kunica.jpg"
download "guinea pig pet book"        "vodic-zamorci.jpg"
download "veterinary medicine book"   "bolesti-golubova.jpg"
download "ornithology bird book"      "standardi-fazani.jpg"

# ===== Oprema za izlaganje (12) =====
download "leather notebook journal"   "knjiga-rodoslova.jpg"
download "metal rings craft"          "markirice-noge.jpg"
download "metal wire cage"            "izlozbeni-kavez-golubovi.jpg"
download "rabbit cage hutch"          "izlozbeni-kavez-kunici.jpg"
download "bird leg ring tag"          "sidrisne-markirice.jpg"
download "bird feeder seed"           "hranilica.jpg"
download "pet water dispenser"        "pojilica.jpg"
download "wooden crate transport"     "drveni-transport.jpg"
download "plastic carrier box"        "plasticni-transport.jpg"
download "blank index cards"          "kartice-ocenjivanje.jpg"
download "colored plastic straws"     "slamke-markiranje.jpg"
download "wood shavings sawdust"      "higijenska-podloga.jpg"

# ===== Klupski paketi (8) =====
download "gift box wrapped present"   "starter-paket.jpg"
download "gift basket pet supplies"   "paket-golubovi.jpg"
download "wrapped present box"        "paket-kunici.jpg"
download "gift basket country"        "paket-zivina.jpg"
download "small gift package"         "paket-hrcci.jpg"
download "gift package ribbon"        "paket-kanarinci.jpg"
download "premium luxury gift box"    "profi-paket.jpg"
download "professional gift set"      "mentor-paket.jpg"

# ===== Suveniri (8) =====
download "blank white t-shirt"        "majica.jpg"
download "hoodie sweatshirt"          "duks.jpg"
download "baseball cap"               "kapa.jpg"
download "knitted scarf"              "sal.jpg"
download "enamel pin badge"           "bedz.jpg"
download "ceramic coffee mug"         "tegla-kafa.jpg"
download "spiral notebook"            "notes.jpg"
download "fridge magnet souvenir"     "magnet.jpg"

echo ""
echo "===== Sažetak ====="
ls -la "$DEST" | tail -n +2 | wc -l
echo "fajlova u $DEST"
