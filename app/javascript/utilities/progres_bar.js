document.addEventListener('turbo:render', function() {
    const testPassingPresent = document.getElementById('progress-bar')

    if (testPassingPresent) {

    const progressBar = document.getElementById('progress-bar');
    const progressData = document.getElementById('progress-data');

    const totalQuestions = parseInt(progressData.dataset.totalQuestions);
    const currentQuestionNumber = parseInt(progressData.dataset.currentQuestionNumber);

    const percentage = Math.floor(((currentQuestionNumber - 1) / totalQuestions) * 100);
    progressBar.style.width = percentage + '%';
    progressBar.innerText = percentage + '%';
    }
});
