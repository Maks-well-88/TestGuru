document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.timer');
  const cleanStorage = document.querySelector('.clean-storage');
  const sadMessage = document.querySelector('.sad-message');
  const clock = document.querySelector('.clock');

  if (control) {
    let timeLeft = control.dataset.time;
    control.classList.remove('hide')
    clock.classList.remove('hide')
    startTimer(timeLeft, control, clock, sadMessage);
  }

  if (cleanStorage) {
    localStorage.clear('time');
  }
})

function startTimer(timeLeft, control, clock, sadMessage) {
  let time = localStorage.getItem('time') || timeLeft * 60;
  let timeDown = setInterval(countDown, 1000);

  countDown();

  function countDown() {
    localStorage.setItem('time', time);

    let minutes = Math.floor(time / 60);
    let seconds = time % 60;
    seconds = seconds < 10 ? '0' + seconds : seconds;
    minutes = minutes < 10 ? '0' + minutes : minutes;

    control.innerHTML = `${minutes}:${seconds}`;
    --time;

    if (time < 30) {
      control.style.color = 'red';
      clock.style.color = 'red';
    }

    if (time < 0) {
      localStorage.clear('time');
      control.classList.add('hide');
      clock.classList.add('hide')
      sadMessage.classList.remove('hide');
      sadMessage.style.color = 'red';
      control.innerHTML = "00:00";
      clearInterval(timeDown);
    }
  }
}
