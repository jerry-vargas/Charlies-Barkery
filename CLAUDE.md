# Charlies Barkery

## About the Business

Charlies Barkery is a dog barkery (bakery for dogs) based in the Charlotte Metro Area, NC. We sell handmade dog treats and products through multiple channels:

- **Online store** (primary sales channel, includes shipping)
- **Farmers markets** (local Charlotte area)
- **Events** (pop-ups, dog-friendly events)
- **Consignment** (partner retail locations in Charlotte Metro)

We previously had a physical storefront in Boston, MA but relocated to Charlotte. We still ship to loyal customers in Massachusetts.

## Brand & Design Direction

We draw inspiration from these pet brands for our web and visual identity:

- [Scrumbles](https://scrumbles.co.uk/) — playful, clean, colorful pet brand
- [Beco Pets](https://www.becopets.com/) — modern, eco-conscious, warm tones
- [Gunner](https://gunner.com/) — bold, premium, strong photography
- [About a Dog](https://www.aboutadog.co/) — approachable, lifestyle-driven, editorial feel

**Design principles:** Clean layouts, strong product photography, playful but not childish, warm and approachable, premium feel without being stuffy.

## Tech & Development Notes

- When building UI components, prefer a warm, friendly color palette
- use the colors defined from the `src/main.css` file for the primary color of the site
- Typography should feel approachable and modern
- Mobile-first — many customers browse from phones at markets/events
- E-commerce functionality is a priority
- Consider SEO for local Charlotte searches and dog treat shipping keywords
- this project is using tailwind 4.0

## Products

### Craft Commerce Product Types & Structure

**Cakes** (pickup only — cannot be shipped)
- Birthday Cake — 3 size variants: Small, Medium, Large
- Gender Reveal Cake — 3 size variants: Small, Medium, Large

**Birthday Cookie Package** (can ship — shippable alternative to cakes)
- Assortment of decorated, customized cookies
- Offered as a cake substitute for online/shipping orders

**Treats** (can ship)
- 4 flavors: Peanut Butter, Bacon, Sweet Potato, Carrot & Oat
- 2 size variants per flavor: Small and Large

**Cookies** (can ship)
- Decorated Seasonal Individual Cookie — single cookie
- Decorated Seasonal Cookie Package — assorted cookie set

### Recommended Craft Commerce Setup
- One product type per category above (Cakes, Treats, Cookies)
- Use variants for size/flavor differences within a product
- Custom fields to add: `canShip` (lightswitch), `featuredImage` (asset), `shortDescription` (plain text)
- Cakes should be flagged as pickup only via `canShip = false`

## Tone of Voice

Friendly, fun, dog-loving. We talk to pet parents like friends, not customers. Light humor is welcome. Think "your dog's favorite bakery" energy.