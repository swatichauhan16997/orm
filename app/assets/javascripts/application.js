// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap.min
//= require bootstrap/modal
//= require popper.min
//= require jquery.easy-autocomplete
//= require active
//= require easing.min
//= require hoverIntent
//= require jquery.ajaxchimp.min
//= require jquery.magnific-popup
//= require jquery.nice-select.min
//= require jquery.sticky
//= require mail-script
//= require main
//= require parallax.min
//= require plugins
//= require slick
//= require superfish
//= require swiper.min
//= require turbolinks
//= require jquery.raty
//= require ratyrate

$(document).ready(function(){

$input = $("[data-behavior='autocomplete-1']")
$input2 = $("[data-behavior='autocomplete-2']")

 var options = {
 getValue: "name",
 url: function(phrase) {
 return "/search.json?term=" + phrase;
 },
 categories: [
 {
 listLocation: "restaurants",
 header: "<center><strong> -- RESTAURANTS -- </strong></center>",
 },
 {
 listLocation: "fooditems",
 header: "<center><strong> -- DISHES -- </strong></center>",
 }
 ],
 list: {
 onChooseEvent: function( ) {
 var url = $input.getSelectedItemData().url
 $input.val("")
 Turbolinks.visit(url)
 }
 }
 }

var options2 = {
    getValue: "name",
    url: function(phrase) {
      return "/location.json?loc=" + phrase;
    },
    categories: [
      {
        listLocation: "addresses",
        header: "<strong> -- Places -- </strong>",
      }
    ],
    list: {
      onChooseEvent: function( ) {
        var url = $input2.getSelectedItemData().url
        $input2.val("")
        Turbolinks.visit(url)
      }
    }
  }

  $input.easyAutocomplete(options);
  $input2.easyAutocomplete(options2);

});


