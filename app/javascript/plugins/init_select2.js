import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $("#buyer_types_new").select2();
  $("#buyer_types_edit").select2();
  $("#buyers_country_new").select2();
  $("#buyers_country_edit").select2();
  $("#data_type_new").select2();
  $("#data_type_edit").select2();
  $("#inquiry_edit").select2();
  $("#inquiry_new").select2();
  $("#seller_type_edit").select2();
  $("#seller_type_new").select2();
  $("#buyers_country").select2();
  $("#buyer_search_type").select2();
  $("#sellers_occupation").select2();
}


export { initSelect2 }
