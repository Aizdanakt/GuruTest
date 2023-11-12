document.addEventListener('DOMContentLoaded', passwordConfirmation);
document.addEventListener('turbo:render', passwordConfirmation);

function passwordConfirmation() {
    const passwordInput = document.getElementById('user_password');
    const confirmPasswordInput = document.getElementById('user_password_confirmation');
    const matchIcon = document.getElementById('password-match-icon');

    function updateMatchIcon() {
        const password = passwordInput.value;
        const confirmPassword = confirmPasswordInput.value;

        if (password === confirmPassword && confirmPassword !== '') {
            matchIcon.innerHTML = '✔️';
            matchIcon.style.color = 'green';
        } else if (confirmPassword === '') {
            matchIcon.innerHTML = '';
        } else {
            matchIcon.innerHTML = '❌';
            matchIcon.style.color = 'red';
        }
    }

    if (passwordInput && confirmPasswordInput) {
        confirmPasswordInput.addEventListener('input', updateMatchIcon);
        passwordInput.addEventListener('input', updateMatchIcon);
    }
}
