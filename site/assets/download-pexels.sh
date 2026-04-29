#!/usr/bin/env bash
# Downloads breed photos from Pexels with Serbian filenames.
set -e

API="${PEXELS_API_KEY:?Set PEXELS_API_KEY env var first: export PEXELS_API_KEY=...}"
DEST="c:/source/repos/sitne-zivotinje/images/rase"
mkdir -p "$DEST"

download() {
  local query="$1"
  local fname="$2"
  if [ -f "$DEST/$fname" ]; then
    echo "SKIP (exists): $fname"
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
    echo "FAIL (no result): $query"
    return
  fi
  curl -s -L -o "$DEST/$fname" "$url"
  if [ -s "$DEST/$fname" ]; then
    echo "OK: $fname  <-  $query"
  else
    echo "FAIL (empty): $fname"
    rm -f "$DEST/$fname"
  fi
  sleep 0.2
}

# ===== Kunići =====
download "Belgian giant rabbit"       "belgijski-div.jpg"
download "Dutch rabbit"               "holandski-kunic.jpg"
download "Angora rabbit"              "angora-kunic.jpg"
download "Rex rabbit"                 "rex-kunic.jpg"
download "Holland Lop rabbit"         "patuljasti-ovan.jpg"
download "Californian rabbit"         "kalifornijski-kunic.jpg"
download "New Zealand White rabbit"   "novozelandski-beli.jpg"
download "Netherland Dwarf rabbit"    "hermelin.jpg"

# ===== Golubovi =====
download "tumbler pigeon"             "backi-prevrtac.jpg"
download "high flying pigeon"         "niski-visokoletac.jpg"
download "fancy pigeon"               "vrsacki-prevrtac.jpg"
download "pouter pigeon"              "pomeranski-gusan.jpg"
download "carrier pigeon"             "engleski-karier.jpg"
download "fantail pigeon"             "indijski-paun.jpg"
download "owl pigeon"                 "kineska-sovica.jpg"
download "racing pigeon"              "bosanski-prevrtac.jpg"

# ===== Živina =====
download "crested chicken"            "posavska-kukmasta.jpg"
download "bantam chicken"             "bosanska-dzudza.jpg"
download "sebright chicken"           "sebrajt.jpg"
download "brahma chicken"             "brama.jpg"
download "cochin chicken"             "kohinhina.jpg"
download "indian runner duck"         "indijska-trkacica.jpg"
download "chinese goose"              "kineska-guska.jpg"
download "golden pheasant"            "zlatni-fazan.jpg"

# ===== Ptice (kanarinci/papagaji) =====
download "harz roller canary"         "roller-kanarinac.jpg"
download "yellow canary bird"         "waterslager-kanarinac.jpg"
download "canary bird singing"        "timbrado-kanarinac.jpg"
download "gloster canary"             "glouster-kanarinac.jpg"
download "norwich canary"             "norwich-kanarinac.jpg"
download "yorkshire canary"           "yorkshire-kanarinac.jpg"
download "budgerigar"                 "tigrica.jpg"
download "cockatiel"                  "nimfa-kakadu.jpg"

# ===== Glodari =====
download "syrian hamster"             "sirijski-hrcak.jpg"
download "roborovski hamster"         "roborovski-hrcak.jpg"
download "chinese hamster"            "kineski-hrcak.jpg"
download "djungarian hamster"         "dzungarski-hrcak.jpg"
download "guinea pig"                 "zamorce.jpg"
download "chinchilla"                 "cincila.jpg"
download "degu rodent"                "degu.jpg"
download "gerbil"                     "mongolski-mis.jpg"

echo ""
echo "===== Sažetak ====="
ls -la "$DEST" | tail -n +2 | wc -l
echo "fajlova u $DEST"
