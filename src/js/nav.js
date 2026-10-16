// Mobile menu toggle (_includes/nav.twig)
export function initNav() {
  const toggle = document.getElementById('mobile-menu-toggle');
  const menu = document.getElementById('mobile-menu');
  if (!toggle || !menu) return;

  toggle.addEventListener('click', () => {
    const hidden = menu.classList.toggle('hidden');
    toggle.setAttribute('aria-expanded', String(!hidden));
  });
}
