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
  $("#sellers_income").select2();
  $('#sellers_country_edit').select2();
  $('#seller_index_sex').select2();
  $('#seller_index_occupation').select2();
  $('#seller_index_types').select2();
  $('#seller_index_incomes').select2();
  $('#inquiry_format').select2();
  $('#inquiry_tag_new').select2();
  $('#inquiry_tag_edit').select2();
  $('#seller_tag_new').select2();
  $('#seller_tag_edit').select2();
  $('#seller_tag_index').select2();

}


export { initSelect2 }
