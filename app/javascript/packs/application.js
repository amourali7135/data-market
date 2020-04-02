import "bootstrap";
import { initSelect2 } from '../plugins/init_select2';
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initAutocomplete2 } from "../plugins/init_autocomplete2";
import { initAutocomplete3 } from "../plugins/init_autocomplete3";
import { initsellerindexchecks } from "../plugins/init_sellerindexchecks";
// import { initInfinitescroll} from "../plugins/init_infinitescroll";

initAutocomplete();
initAutocomplete2();
initAutocomplete3();
initSelect2();
initsellerindexchecks();
// initInfinitescroll();

import "controllers"
