// Toggle between estimate fields and shipping method results (shop/cart/_includes/shipping-estimator.twig)
export function initShippingEstimator() {
  const showBtn = document.getElementById('js-show-estimate-fields');
  const fields = document.getElementById('js-estimate-fields');
  const methods = document.getElementById('js-estimate-methods');

  // If methods are showing, hide fields initially
  if (methods && fields) {
    fields.classList.add('hidden');
  }

  showBtn?.addEventListener('click', (e) => {
    e.preventDefault();
    fields?.classList.toggle('hidden');
    methods?.classList.toggle('hidden');
  });
}
