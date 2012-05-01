// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap
//= require_tree .

/* Update datepicker plugin so that MM/DD/YYYY format is used. */
/********************
$.extend($.fn.datepicker.defaults, {
  parse: function (string) {
    var matches;
    if ((matches = string.match(/^(\d{2,2})\/(\d{2,2})\/(\d{4,4})$/))) {
      return new Date(matches[3], matches[1] - 1, matches[2]);
    } else {
      return null;
    }
  },
  format: function (date) {
    var
      month = (date.getMonth() + 1).toString(),
      dom = date.getDate().toString();
    if (month.length === 1) {
      month = "0" + month;
    }
    if (dom.length === 1) {
      dom = "0" + dom;
    }
    return month + "/" + dom + "/" + date.getFullYear();
  }
});
***********************/

// This links up with app/inputs/date_picker_input.rb
$(document).ready(function() {
  $('input.date_picker').datepicker();

  $('input.time_picker').timePicker({
    show24Hours: false,
    step: 5
  });

  $('.nameElement').each(function() {
    // alert("setup observer");
    // Save current value of element
    $(this).data('oldVal', $(this).val());

    // Look for changes in the value
    $(this).bind("propertychange keyup input paste", function(event){
      // If value has changed...
      if ($(this).data('oldVal') != $(this).val()) {
        // Updated stored value
        $(this).data('oldVal', $(this).val());

        // Do action
        //alert("change event!" + $(this).val());
        setFullName();
      }
    });

    function setFullName() {
      //alert("setFullName " + $('#parent_last_name').val() + ", " + $('#parent_first_name').val());
      $('#parent_full_name').val($('#parent_last_name').val() + ", " + $('#parent_first_name').val());
    }

  });


});
