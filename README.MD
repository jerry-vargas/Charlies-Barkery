# Charlie's Barkery

Website for Charlie's Barkery — a handmade dog treat bakery based in the Charlotte Metro Area, NC. Built on Craft CMS 5 with Craft Commerce, served locally via DDEV, and styled with Tailwind CSS 4.

> Currently in development. Production site is on Wix pending migration.

---

## Tech Stack

| Layer | Technology |
|---|---|
| CMS | Craft CMS 5 |
| E-commerce | Craft Commerce 5 |
| Forms | Formie 3 |
| Rich Text | CKEditor (craftcms/ckeditor) |
| Asset Storage | AWS S3 (craftcms/aws-s3) |
| Frontend Build | Vite 7 via nystudio107/craft-vite |
| CSS | Tailwind CSS 4 |
| Local Dev | DDEV |

---

## Local Development Setup

### Prerequisites

- [DDEV](https://ddev.readthedocs.io/) installed
- Docker running

### First-time setup

```bash
npm run up
```

This runs `ddev start && ddev npm install && ddev composer install`.

### Start the dev server

Vite must run **inside** the DDEV container, not on the host machine. Always use:

```bash
ddev npm run dev
```

> **Do not** run `npm run dev` directly on your host. Vite needs to serve from inside the container so DDEV can proxy it correctly on port 3001.

### Access the site

| URL | Purpose |
|---|---|
| `https://charlies.ddev.site` | Main site |
| `https://charlies.ddev.site/admin` | Craft CMS control panel |
| `https://charlies.ddev.site:3001` | Vite dev server (HMR) |

### If node_modules becomes incompatible

If you see a Rollup native module error, node_modules was installed on the host OS and does not match the DDEV container (Linux). Fix with:

```bash
rm -rf node_modules package-lock.json
ddev npm install
ddev npm run dev
```

---

## Project Config

This project uses Craft's Project Config. After pulling changes that modify YAML files under `config/project/`, apply them with:

```bash
ddev craft project-config/apply
```

---

## Frontend Architecture

### CSS

Styles live in `src/css/main.css`. Brand color tokens are defined there and used throughout all templates:

```css
--color-charcoal: #29323d;
--color-teal:     #0ed3c8;
--color-bronze:   #b67236;
--color-white:    #ffffff;
```

### Templates

```
templates/
├── _layout.twig              # Base layout (nav, footer)
├── _partials/
│   └── blockLoader.twig      # Dynamically loads page blocks by blockType handle
├── _includes/                # Page block components (one per block type)
│   ├── hero.twig
│   ├── splitSection.twig
│   ├── cardGrid.twig
│   ├── callToAction.twig
│   ├── productCarousel.twig
│   ├── timeline.twig
│   ├── banner.twig
│   ├── contactSection.twig
│   ├── subscribe.twig
│   ├── instagram.twig
│   ├── nav.twig
│   └── footer.twig
├── _components/              # Reusable sub-components
│   ├── cardGridCard.twig
│   └── pageHero.twig
├── index.twig
├── about.twig
├── contact.twig
├── events.twig
├── shop/index.twig
└── pages/_entry.twig         # Generic page template
```

### Block System

Pages are built from a stack of blocks managed in the Craft CP. The `blockLoader.twig` partial loops over a `blockPicker` Matrix field and includes the matching template from `_includes/` based on the block's `blockType` handle.

To add a new block type:
1. Create the field in Craft CP with a ContentBlock field type
2. Add the block type option to the `blockType` dropdown field
3. Add a condition to the `pageBlocksEntry` field layout
4. Create `templates/_includes/{blockTypeHandle}.twig`

### Theming

Block components that support background color theming (`splitSection`, `cardGrid`) use a shared `color` Dropdown field with these options:

| Option | Value | Background |
|---|---|---|
| White | `white` | #ffffff |
| Charcoal | `charcoal` | #29323d |
| Teal | `teal` | #0ed3c8 |
| Bronze | `bronze` | #b67236 |

Each template defines an internal `themes` map keyed to these values, controlling section background, text colors, card styles, and icon colors.

---

## Craft CMS Fields Reference

### Shared Fields

| Handle | Type | Purpose |
|---|---|---|
| `color` | Dropdown | Theme/background color selector |
| `images` | Assets | Image uploads |
| `richTextEditor` | CKEditor | Rich text content |
| `linkField` | Link | CTA links |
| `plainText` | Plain Text | Short text fields |
| `lighswitch` | Lightswitch | Boolean toggles |

### Block Fields

| Handle | Type | Block |
|---|---|---|
| `heroBlock` | ContentBlock | Hero |
| `splitSectionBlock` | ContentBlock | Split Section |
| `cardGridBlock` | ContentBlock | Card Grid |
| `cardsMatrix` | Matrix | Card Grid (nested cards) |
| `callToActionBlock` | ContentBlock | Call To Action |
| `productCarouselBlock` | ContentBlock | Product Carousel |
| `timelineBlock` | ContentBlock | Timeline |
| `timelineMatrix` | Matrix | Timeline (nested items) |
| `contactBlock` | ContentBlock | Contact Section |
| `contactMatrix` | Matrix | Contact (nested items) |
| `subscribeblock` | ContentBlock | Subscribe |

---

## Plugins

| Plugin | Purpose |
|---|---|
| `craftcms/commerce` | E-commerce (products, orders, variants) |
| `craftcms/ckeditor` | Rich text editing |
| `craftcms/aws-s3` | Asset volume on S3 |
| `nystudio107/craft-vite` | Vite integration for HMR and asset bundling |
| `verbb/formie` | Forms (contact, subscribe) |

---

## Commerce Product Structure

| Product Type | Shippable | Variants |
|---|---|---|
| Cakes | No (pickup only) | Small, Medium, Large |
| Birthday Cookie Package | Yes | None |
| Treats | Yes | Flavor x Size (Small/Large) |
| Cookies | Yes | Individual / Package |

---

## Sales Channels

- Online store (shipping available)
- Charlotte-area farmers markets
- Pop-up events
- Consignment at local retail partners

---

## Further Reading

- [VITE_DDEV_NOTES.md](VITE_DDEV_NOTES.md) — Vite + DDEV setup details and common issues
- [DOCS/TODO.MD](DOCS/TODO.MD) — Outstanding tasks and planned work