document.addEventListener('turbo:render', test);
document.addEventListener('DOMContentLoaded', test);

function test() {
    const timeLeftElement = document.getElementById('time-left');
    let timeLeftInSeconds = parseInt(timeLeftElement.getAttribute('data-time-left'), 10);

    function updateTimer() {
        if (timeLeftInSeconds <= 0) {
            window.location.href = timeLeftElement.getAttribute('data-redirect-path');
        } else {
            const minutes = Math.floor(timeLeftInSeconds / 60);
            const seconds = timeLeftInSeconds % 60;

            const formattedTime = `${minutes} минут ${seconds} секунд`;

            timeLeftElement.textContent = 'Оставшееся время: ' + formattedTime;
            timeLeftInSeconds -= 1;

            setTimeout(updateTimer, 1000);
        }
    }
    updateTimer();
}
