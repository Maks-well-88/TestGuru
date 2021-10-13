document.addEventListener('turbolinks:load', function() {
  const progressBar = document.querySelector('.myBar')

  if (progressBar) {
    let percentage = progressBar.dataset.percentage

    if(percentage == 0) {
      progressBar.style.width = '40px'
      progressBar.style.backgroundColor = 'red'
    } else {
      progressBar.style.width = percentage + '%'
    }
  }
})
