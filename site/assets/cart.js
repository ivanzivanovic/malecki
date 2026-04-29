// Cart with full item state shared across all pages.
// State persists in localStorage as a map of id -> {name, price, img, alt, qty}.
(function () {
  var KEY = 'malecki-cart';

  function getCart() {
    try {
      var raw = localStorage.getItem(KEY);
      return raw ? JSON.parse(raw) : {};
    } catch (e) {
      return {};
    }
  }

  function setCart(c) {
    localStorage.setItem(KEY, JSON.stringify(c));
    renderBadge(getTotalCount(c));
    renderCartPage(c);
  }

  function getTotalCount(c) {
    c = c || getCart();
    var n = 0;
    for (var k in c) n += c[k].qty;
    return n;
  }

  function getTotalPrice(c) {
    c = c || getCart();
    var n = 0;
    for (var k in c) n += c[k].qty * c[k].price;
    return n;
  }

  function fmtPrice(n) {
    return n.toLocaleString('sr-RS') + ' RSD';
  }

  // ---- Header badge ----
  function renderBadge(n) {
    var badge = document.querySelector('.cart-count');
    if (!badge) return;
    badge.textContent = n;
    if (n > 0) badge.removeAttribute('hidden');
    else badge.setAttribute('hidden', '');
  }

  // ---- Read product info from a .prod card on the shop page ----
  function readCard(card) {
    var img = card.querySelector('.img img');
    var nameEl = card.querySelector('h4');
    var priceEl = card.querySelector('.price');
    var tagEl = card.querySelector('.cat-tag');
    if (!img || !nameEl || !priceEl) return null;
    var src = img.getAttribute('src');
    var id = src.split('/').pop().replace(/\.[^.]+$/, '');
    var price = parseInt(priceEl.textContent.replace(/[^\d]/g, ''), 10);
    return {
      id: id,
      name: nameEl.textContent.trim(),
      price: price,
      img: src,
      alt: img.getAttribute('alt') || '',
      tag: tagEl ? tagEl.textContent.trim() : ''
    };
  }

  // ---- Inject "Dodaj u korpu" buttons on shop ----
  function attachShopButtons() {
    var products = document.querySelectorAll('.prod');
    products.forEach(function (p) {
      if (p.querySelector('.add-cart')) return;
      var btn = document.createElement('button');
      btn.className = 'add-cart';
      btn.type = 'button';
      btn.setAttribute('aria-label', 'Dodaj u korpu');
      btn.innerHTML =
        '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" ' +
        'stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" ' +
        'width="11" height="11">' +
        '<circle cx="9" cy="21" r="1"/>' +
        '<circle cx="20" cy="21" r="1"/>' +
        '<path d="M1 1h4l2.7 13.4a2 2 0 0 0 2 1.6h9.7a2 2 0 0 0 2-1.6L23 6H6"/>' +
        '</svg> Dodaj u korpu';
      p.appendChild(btn);
    });
  }

  // ---- Click handler for "Add to cart" ----
  document.addEventListener('click', function (e) {
    var btn = e.target.closest('.add-cart');
    if (!btn) return;
    e.preventDefault();
    e.stopPropagation();
    var card = btn.closest('.prod');
    if (!card) return;
    var p = readCard(card);
    if (!p) return;
    var c = getCart();
    if (c[p.id]) c[p.id].qty += 1;
    else { c[p.id] = p; c[p.id].qty = 1; }
    setCart(c);

    var orig = btn.innerHTML;
    btn.innerHTML =
      '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" ' +
      'stroke-width="3" stroke-linecap="round" stroke-linejoin="round" ' +
      'width="11" height="11"><polyline points="20 6 9 17 4 12"/></svg> Dodato';
    btn.classList.add('added');
    setTimeout(function () {
      btn.innerHTML = orig;
      btn.classList.remove('added');
    }, 1100);
  });

  // ---- Cart page rendering ----
  function renderCartPage(c) {
    var list = document.getElementById('cart-list');
    if (!list) return; // not on the cart page
    c = c || getCart();
    var ids = Object.keys(c);
    var empty = document.getElementById('cart-empty');
    var foot = document.getElementById('cart-foot');

    if (ids.length === 0) {
      list.innerHTML = '';
      if (empty) empty.style.display = 'block';
      if (foot) foot.style.display = 'none';
      return;
    }
    if (empty) empty.style.display = 'none';
    if (foot) foot.style.display = '';

    var html = '';
    ids.forEach(function (id) {
      var p = c[id];
      var sub = p.qty * p.price;
      html +=
        '<div class="cart-row" data-id="' + id + '">' +
          '<div class="thumb"><img src="' + p.img + '" alt="' + (p.alt || '') + '"></div>' +
          '<div class="name">' + p.name +
            (p.tag ? '<small>' + p.tag + '</small>' : '') +
          '</div>' +
          '<div class="qty" role="group" aria-label="Količina">' +
            '<button type="button" data-act="dec" aria-label="Smanji">−</button>' +
            '<span class="num">' + p.qty + '</span>' +
            '<button type="button" data-act="inc" aria-label="Povećaj">+</button>' +
          '</div>' +
          '<div class="unit">' + fmtPrice(p.price) + '</div>' +
          '<div class="sub">' + fmtPrice(sub) + '</div>' +
          '<button class="rm" type="button" data-act="rm" aria-label="Ukloni">×</button>' +
        '</div>';
    });
    list.innerHTML = html;

    var totalEl = document.getElementById('cart-total-amt');
    var totalCntEl = document.getElementById('cart-total-cnt');
    if (totalEl) totalEl.textContent = fmtPrice(getTotalPrice(c));
    if (totalCntEl) totalCntEl.textContent = getTotalCount(c);
  }

  // ---- Cart page interactions ----
  document.addEventListener('click', function (e) {
    var act = e.target.closest('[data-act]');
    if (!act) return;
    var row = act.closest('.cart-row');
    if (!row) return;
    var id = row.dataset.id;
    var c = getCart();
    if (!c[id]) return;
    var a = act.dataset.act;
    if (a === 'inc') c[id].qty += 1;
    else if (a === 'dec') {
      c[id].qty -= 1;
      if (c[id].qty <= 0) delete c[id];
    } else if (a === 'rm') {
      delete c[id];
    }
    setCart(c);
  });

  // Empty entire cart
  document.addEventListener('click', function (e) {
    var btn = e.target.closest('#cart-clear');
    if (!btn) return;
    if (confirm('Isprazniti celu korpu?')) setCart({});
  });

  // Submit order (mock)
  document.addEventListener('click', function (e) {
    var btn = e.target.closest('#cart-submit');
    if (!btn) return;
    var c = getCart();
    if (Object.keys(c).length === 0) return;
    alert('Hvala! Vaša narudžbina (' + getTotalCount(c) +
          ' artikala — ' + fmtPrice(getTotalPrice(c)) + ') je primljena.');
    setCart({});
  });

  // Init
  renderBadge(getTotalCount());
  attachShopButtons();
  renderCartPage();
})();
