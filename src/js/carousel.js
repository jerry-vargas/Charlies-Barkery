// Prev/next buttons for the product carousel (_includes/productCarousel.twig)
const SCROLL_AMOUNT = 300;

export function initCarousel() {
  const track = document.getElementById('carousel-track');
  const prev = document.getElementById('carousel-prev');
  const next = document.getElementById('carousel-next');
  if (!track) return;

  prev?.addEventListener('click', () => track.scrollBy({ left: -SCROLL_AMOUNT, behavior: 'smooth' }));
  next?.addEventListener('click', () => track.scrollBy({ left: SCROLL_AMOUNT, behavior: 'smooth' }));
}
