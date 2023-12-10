document.addEventListener('turbo:render', test)
document.addEventListener('DOMContentLoaded', test)

function test() {
    const timeLeftElement = document.getElementById('time-left');
    let timeLeft = parseInt(timeLeftElement.getAttribute('data-time-left'), 10);

    // function updateTimer() {
    //     if (timeLeft <= 0) {
    //         window.location.href = timeLeftElement.getAttribute('data-redirect-path');
    //     } else {
    //         timeLeftElement.innerHTML = 'Оставшееся время: ' + Math.floor(timeLeft / 60) + ' минут';
    //         timeLeft -= 1;
    //         setTimeout(updateTimer, 1000);
    //     }
    // }

    updateTimer();
}
