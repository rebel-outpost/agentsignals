//= require flatty/jquery/jquery.min
//= require flatty/jquery/jquery.mobile.custom.min
//= require flatty/jquery/jquery-migrate.min
//= require flatty/jquery/jquery-ui.min
//= require jquery_ujs
//= require lean-slider
//= require flatty/plugins/plugins
//= require flatty/bootstrap/bootstrap.min
//= require flatty/theme


$(function() {
  $(".chosen-select").select2();
  $(".chosen-deselect").select2({ allowClear: true });
});

$(document).ready(function() {
    $('#slider').leanSlider();
});