//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .


$(function() {
  $(".chosen-select").select2();
  $(".chosen-deselect").select2({ allowClear: true });
});

$(document).ready(function() {
    $('#banner-fade').bjqs({
      height        : 320,
      width         : 620,
      responsive    : true,
      randomstart   : true,
      showcontrols  : false
    });
});