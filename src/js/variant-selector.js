// Product page: update label, price and image when a variant radio is picked
// (shop/product.twig + shop/products/_includes/variant-selector.twig).
// Delegated, so it survives Sprig re-renders of the add-to-cart component.
const VARIANT_INPUT = 'input[name="purchasables[0][id]"]';

function syncVariant(radio) {
  const label = radio.closest('label');
  if (!label) return;

  const { variantTitle, price, salePrice, variantImage } = label.dataset;
  const onPromotion = label.dataset.onPromotion === 'true';

  const $label = document.getElementById('selected-variant-label');
  const $display = document.getElementById('price-display');
  const $original = document.getElementById('price-original');
  const $saleBadge = document.getElementById('sale-badge');
  const $img = document.getElementById('product-image');

  if ($label) $label.textContent = variantTitle;
  if ($img && variantImage) $img.src = variantImage;
  if (!$display || !$original) return;

  if (onPromotion) {
    $display.textContent = salePrice;
    $original.textContent = price;
    $original.classList.remove('hidden');
    $saleBadge?.classList.remove('hidden');
  } else {
    $display.textContent = price;
    $original.textContent = '';
    $original.classList.add('hidden');
    $saleBadge?.classList.add('hidden');
  }
}

export function initVariantSelector() {
  document.addEventListener('change', (e) => {
    if (e.target.matches(VARIANT_INPUT)) syncVariant(e.target);
  });

  // Re-sync price/image after Sprig swaps the component
  document.addEventListener('htmx:afterSwap', (e) => {
    const radio = e.target.querySelector(`${VARIANT_INPUT}:checked`);
    if (radio) syncVariant(radio);
  });
}
