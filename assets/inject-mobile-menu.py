"""Inject hamburger button + drawer markup into all top-level HTML pages."""
import os
import re
import glob

DIR = "c:/source/repos/sitne-zivotinje"

HAMBURGER = (
    '<button class="hamburger" type="button" aria-label="Meni" aria-expanded="false">'
    '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round">'
    '<line x1="3" y1="6" x2="21" y2="6"/>'
    '<line x1="3" y1="12" x2="21" y2="12"/>'
    '<line x1="3" y1="18" x2="21" y2="18"/>'
    '</svg></button>'
)

DRAWER = (
    '<div class="drawer-backdrop" hidden></div>'
    '<aside class="drawer" hidden aria-label="Glavni meni">'
    '<div class="drawer-head">'
    '<a href="index.html" class="drawer-logo">malecki<span class="dot">.</span>rs</a>'
    '<button class="drawer-close" type="button" aria-label="Zatvori meni">&times;</button>'
    '</div>'
    '<nav class="drawer-nav">'
    '<a href="saveti.html">Saveti i nega</a>'
    '<a href="kalendar.html">Kalendar izložbi</a>'
    '<a href="sta-radimo.html">Šta radimo</a>'
    '<a href="ukljuci-se.html">Uključi se</a>'
    '<a href="prodavnica.html">Prodavnica</a>'
    '<hr class="sep">'
    '<a href="ukljuci-se.html">Pomoć</a>'
    '<a href="sta-radimo.html">Pronađi nas</a>'
    '<a href="ukljuci-se.html">Moj nalog</a>'
    '</nav>'
    '<a href="ukljuci-se.html" class="drawer-cta">Učlani se</a>'
    '</aside>'
)


def patch(path):
    with open(path, "r", encoding="utf-8") as fp:
        s = fp.read()

    if 'class="hamburger"' in s:
        return f"SKIP {path}"

    # Add hamburger right before .topbar-inner closing:
    # the closing pattern is utils </div> + topbar-inner </div> + topbar </div> + <nav class="nav">
    pat = re.compile(r"(</div>\s*</div>\s*</div>\s*<nav class=\"nav\">)")
    m = pat.search(s)
    if not m:
        return f"FAIL no anchor in {path}"
    block = m.group(1)
    # Insert hamburger after the FIRST </div> (which closes .utils)
    new_block = block.replace("</div>", "</div>" + HAMBURGER, 1)
    # Wait: we want hamburger INSIDE topbar-inner but AFTER utils.
    # </div> #1 closes .utils — we put hamburger right after it (still inside .topbar-inner).
    s = s.replace(block, new_block, 1)

    # Inject drawer right after </nav>
    s = s.replace("</nav>", "</nav>\n\n  " + DRAWER, 1)

    with open(path, "w", encoding="utf-8") as fp:
        fp.write(s)
    return f"OK   {path}"


def main():
    files = sorted(glob.glob(os.path.join(DIR, "*.html")))
    for f in files:
        print(patch(f))


if __name__ == "__main__":
    main()
