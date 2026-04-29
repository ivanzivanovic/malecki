#!/usr/bin/env bash
# Inject hamburger button into topbar and drawer markup after </nav>
# in all top-level HTML files.
set -e

DIR="c:/source/repos/sitne-zivotinje"
cd "$DIR"

HAMBURGER='<button class="hamburger" type="button" aria-label="Meni" aria-expanded="false"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="18" x2="21" y2="18"/></svg></button>'

DRAWER='<div class="drawer-backdrop" hidden></div><aside class="drawer" hidden aria-label="Glavni meni"><div class="drawer-head"><a href="index.html" class="drawer-logo">malecki<span class="dot">.</span>rs</a><button class="drawer-close" type="button" aria-label="Zatvori meni">&times;</button></div><nav class="drawer-nav"><a href="saveti.html">Saveti i nega</a><a href="kalendar.html">Kalendar izložbi</a><a href="sta-radimo.html">Šta radimo</a><a href="ukljuci-se.html">Uključi se</a><a href="prodavnica.html">Prodavnica</a><hr class="sep"><a href="ukljuci-se.html">Pomoć</a><a href="sta-radimo.html">Pronađi nas</a><a href="ukljuci-se.html">Moj nalog</a></nav><a href="ukljuci-se.html" class="drawer-cta">Učlani se</a></aside>'

for f in *.html; do
  # Skip if already injected
  if grep -q 'class="hamburger"' "$f"; then
    echo "SKIP $f (already has hamburger)"
    continue
  fi

  # 1. Add hamburger after .utils closing </div>
  # The pattern is: utils closing </div> followed by topbar-inner closing </div>
  # We add hamburger right before the topbar-inner closing.
  python -c "
import sys, re
fn = '$f'
with open(fn, 'r', encoding='utf-8') as fp:
    s = fp.read()
# Insert hamburger after the .utils </div> but before .topbar-inner </div>
# Topbar structure: <div class=\"topbar\"><div class=\"topbar-inner\">...<div class=\"utils\">...</div></div></div>
# We want it inside topbar-inner, after utils.
ham = '''$HAMBURGER'''
drw = '''$DRAWER'''
# Find </div> that closes .utils, then immediate </div> closes topbar-inner
# Easiest: replace '      </div>\n    </div>\n  </div>\n\n  <nav class=\"nav\">' with insertion
# More flexible: insert hamburger right before the closing of topbar-inner div pattern
# Use the </nav> as anchor: insert hamburger right before </nav>'s opening, drawer right after </nav>
# Hamburger: insert before <nav class=\"nav\"> as part of topbar (one </div> back)
# Clean approach: replace closing of utils + closing of topbar-inner
pattern = re.compile(r'(</div>\s*</div>\s*</div>\s*<nav class=\"nav\">)')
m = pattern.search(s)
if m:
    full = m.group(1)
    # split: first </div> closes .utils, second closes .topbar-inner, third closes .topbar
    # we want hamburger between .utils close and .topbar-inner close
    new = full.replace('</div>', ham + '</div>', 1)  # hamburger inside .topbar-inner, after utils
    s = s.replace(full, new, 1)
# Insert drawer after </nav>
s = s.replace('</nav>', '</nav>\n\n  ' + drw, 1)
with open(fn, 'w', encoding='utf-8') as fp:
    fp.write(s)
print('OK', fn)
"
done

echo "done"
