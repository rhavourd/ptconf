// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('.name-element').each(function() {
    //$(this).css("border","1px solid red")

    var firstname = $('input[name$="first_name]"]')
    saveAndBind(firstname)

    var lastname = $('input[name$="last_name]"]')
    saveAndBind(lastname)

    var fullname = $('input[name$="full_name]"]')

    /*** This was my original way to collect the name components. I gave it up for the simple way :-(
    $('input[name$="_name]"]', this).not('[name*="full_name"]').each(function() {
      alert($(this).attr('name') + " value=" + $(this).val());
      saveAndBind($(this))
    });
    ***/

    function saveAndBind(el) {
      //alert("saveAndBind " + el.attr('name'));
      // Save current value of element
      el.data('oldVal', el.val());

      // Look for changes in the value
      el.bind("propertychange keyup input paste", function(event){
        // If value has changed...
        if ($(this).data('oldVal') != $(this).val()) {
          // Updated stored value
          $(this).data('oldVal', $(this).val());
          // Update the full name
          setFullName();
        }
      });
    }

    function setFullName() {
      fullname.val(lastname.val() + (lastname.val().length > 0 ? ", " : "") + firstname.val())
    }

  });

});
