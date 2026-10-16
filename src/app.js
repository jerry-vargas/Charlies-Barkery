import "./css/main.css";

import { initNav } from "./js/nav.js";
import { initCarousel } from "./js/carousel.js";
import { initQtyStepper } from "./js/qty-stepper.js";
import { initVariantSelector } from "./js/variant-selector.js";
import { initShippingEstimator } from "./js/shipping-estimator.js";

// app.js loads as a module (deferred), so the DOM is parsed by the time this runs
initNav();
initCarousel();
initQtyStepper();
initVariantSelector();
initShippingEstimator();
