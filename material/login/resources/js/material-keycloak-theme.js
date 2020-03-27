window.onload = function () {

  // Add ripple effect to all material buttons on the page
  document.querySelectorAll('.mdc-button').forEach(function (e) {
    mdc.ripple.MDCRipple.attachTo(e);
  });

  // Initialize all text fields
  document.querySelectorAll('.mdc-text-field').forEach(function (e) {
    new mdc.textField.MDCTextField(e);
  });

  // Initialize all icons
  document.querySelectorAll('.mdc-text-field__icon').forEach(function (e) {
    new mdc.textField.MDCTextFieldIcon(e);
  });


  // Initialize the language select box
  var languageSelect = new mdc.select.MDCSelect(document.querySelector('.mdc-select'));

  languageSelect.listen('MDCSelect:change', function() {
    console.debug('Selected url: ' + languageSelect.value);
    window.location.href = languageSelect.value;
  });

};
