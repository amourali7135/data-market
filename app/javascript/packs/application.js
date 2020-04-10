import "bootstrap";
import { initSelect2 } from '../plugins/init_select2';
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initAutocomplete2 } from "../plugins/init_autocomplete2";
import { initAutocomplete3 } from "../plugins/init_autocomplete3";
import { initSellerindexchecks } from "../plugins/init_sellerindexchecks";
import { initMapbox } from "../plugins/init_mapbox";


initAutocomplete();
initAutocomplete2();
initAutocomplete3();
initSelect2();
initSellerindexchecks();
initMapbox();


document.addEventListener('turbolinks:load', () => {
  initMapbox();
})


import "controllers"
