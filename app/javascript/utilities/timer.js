document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.timer');
  const cleanStorage = document.querySelector('.clean-storage');
  const clockTimer = document.querySelector('.awesome_timer');

  if (control) {
    let timeLeft = control.dataset.time;
    startTimer(timeLeft, control, clockTimer);
  }

  if (cleanStorage) {
    localStorage.clear('time');
  }
})

function startTimer(timeLeft, control, clockTimer) {
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
      clockTimer.style.color = 'red';
    }

    if (time < 0) {
      localStorage.clear('time');
      document.querySelector('.end-passage').click()
      control.innerHTML = "00:00";
      clearInterval(timeDown);
    }
  }
}
