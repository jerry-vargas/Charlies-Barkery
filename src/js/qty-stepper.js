// +/- quantity buttons: <button type="button" data-qty-step="-1"> next to an <input type="number">.
// Clamps to the input's `min`, then fires `change` so reactive forms (e.g. the cart's
// s-trigger="change") submit. Delegated, so it keeps working after Sprig re-renders.
export function initQtyStepper() {
  document.addEventListener('click', (e) => {
    const btn = e.target.closest('[data-qty-step]');
    if (!btn) return;

    const input = btn.parentElement.querySelector('input[type="number"]');
    if (!input) return;

    const min = parseInt(input.min || 0, 10);
    const step = parseInt(btn.dataset.qtyStep, 10);
    input.value = Math.max(min, parseInt(input.value || min, 10) + step);
    input.dispatchEvent(new Event('change', { bubbles: true }));
  });
}
