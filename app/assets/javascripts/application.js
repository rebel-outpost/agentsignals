//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .


$(function() {
  $(".chosen-select").select2();
  $(".chosen-deselect").select2({ allowClear: true });
});
