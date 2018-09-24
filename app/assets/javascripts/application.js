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
//= require jquery
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .

function ready(event) {
  $('input[type=radio][name=searchRadio]').change(function() {
    if (this.value === 'simple') {
      $('.simple-form').show();
      $('.advanced-form').hide();
      $('#results').show();
      $('#results').html("");
    } else if (this.value === 'advanced') {
      $('.simple-form').hide();
      $('.advanced-form').show();
      $('#results').hide();
    }
  });

  $('#search-btn').click(function() {

    var data = JSON.stringify({ drink_name: $('#drink_name').val()});
    $.ajax({
        async: false,
        timeout: 4000,
        type: 'POST',
        url: '/search_drink',
        data: data,
        contentType: 'application/json; charset=utf-8'
    });
  });

  $( "#advancedSearch" ).change(function() {
    
    var isAdvancedSearchChecked = $('#advancedSearch:checked').length == 1 ? true : false;
    if (advancedSearch) {
      $('#drink_name').val('');
      var data = JSON.stringify({ load_form: true});
      $.ajax({
        async: false,
        timeout: 4000,
        type: 'POST',
        url: '/load_preferences_form',
        data: data,
        contentType: 'application/json; charset=utf-8'
      });  
    }
  });
}



$(document).on('turbolinks:load', ready);
