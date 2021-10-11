document.addEventListener('turbolinks:load', function() {

  var passwordField = this.querySelector('.password_field')
  var confirmationField = this.querySelector('.password_confirmation_field')
  var keyWarning = this.querySelector('.octicon-key')

  if (passwordField && confirmationField) {
    confirmationField.addEventListener('input', checkField)
    passwordField.addEventListener('input', checkField)
  }

  function checkField () {
    var password = passwordField.value
    var confirmation = confirmationField.value

    if (confirmation == password && password != '') {
      keyWarning.classList.add('valid-password')
      keyWarning.classList.remove('invalid-password')
      keyWarning.classList.remove('hide')
      return
    }

    if (confirmation != password && confirmation != '') {
      keyWarning.classList.add('invalid-password')
      keyWarning.classList.remove('valid-password')
      keyWarning.classList.remove('hide')
    } else {
      keyWarning.classList.remove('valid-password')
      keyWarning.classList.remove('invalid-password')
      keyWarning.classList.add('hide')
    }
  }
})
