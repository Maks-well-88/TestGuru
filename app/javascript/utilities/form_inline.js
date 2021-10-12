document.addEventListener('turbolinks:load', function() {
  const controls = document.querySelectorAll('.form-inline-link');

  if(controls) {
    for (let i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHendler)
    }
  }

  const errors = document.querySelector('.resource-errors')

  if (errors && controls.length) {
    const resourceId = errors.dataset.resourceId
    formInlineHendler(resourceId)
  }
})

function formInlineLinkHendler(event) {
  event.preventDefault()

  const testId = this.dataset.testId
  formInlineHendler(testId)
}

function formInlineHendler(testId) {
  const link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
  const testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`)
  const formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`)

  if (formInline.classList.contains('hide')) {
    link.textContent = 'Отменить';
    testTitle.classList.add('hide')
    formInline.classList.remove('hide')
  } else {
    link.textContent = 'Изменить';
    testTitle.classList.remove('hide')
    formInline.classList.add('hide')
  }
}
