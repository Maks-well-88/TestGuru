document.addEventListener('turbolinks:load', function() {

  var passwordField = this.querySelector('.password_field')
  var confirmationField = this.querySelector('.password_confirmation_field')
  var keyWarning = this.querySelector('.octicon-key')

  if (passwordField && confirmationField) {
    confirmationField.addEventListener('input', checkField)
  }

  function checkField () {
    var password = passwordField.value
    var confirmation = confirmationField.value

    if (confirmation != password) {
      keyWarning.classList.add('invalid-password')
      keyWarning.classList.remove('valid-password')
      keyWarning.classList.remove('hide')
    } else {
      keyWarning.classList.add('valid-password')
      keyWarning.classList.remove('invalid-password')
      keyWarning.classList.remove('hide')
    }
  }
})
