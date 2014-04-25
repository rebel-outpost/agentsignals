//= require jquery
//= require jquery_ujs
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.mouse
//= require jquery.ui.draggable
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap3
//= require bootstrap
//= require select2
//= require_tree .


$(function() {
  $(".chosen-select").select2();
  $(".chosen-deselect").select2({ allowClear: true });
});
