/**********************************************************************
 These functions are used to track changes to the name fields and keep
 the full_name field in sync
 **********************************************************************/

/* Add a method to our string class for easily removing spaces */
String.prototype.clean = function () {
  var s = this.replace(/\s+/g," ");
  return s.replace(/^\s*|\s*$/,"");
}

/* Clean the element and return its new value */
function getNamePiece(element) {
  return $(element).value = $(element).value.clean();
}

/* Keep the full_name in sync w/ its components */
function setFullName() {
  //var suffix = getNamePiece('name_suffix');
  //suffix = suffix ? " " + suffix : "";
  alert("setFullName");
  $('full_name').value = getNamePiece('last_name')
      // + suffix + ", "
      + getNamePiece('first_name') + " "
      + getNamePiece('middle_name');
}

/* Keep track of individual chars w/ keyup; handle paste w/ change */
function observeChanges(element) {
  $(element).keypress(function(e) {
    setFullName();
  })
  //Event.observe(element, 'keyup', setFullName);
  //Event.observe(element, 'change', setFullName);
}

/* Track changes to the various components of the name */
function loadObservers() {
  alert("LoadObservers!");
  observeChanges('first_name');
  observeChanges('middle_name');
  observeChanges('last_name');
  //observeChanges('name_suffix');
}
