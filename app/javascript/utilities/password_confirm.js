document.addEventListener('DOMContentLoaded', test)
document.addEventListener('turbo:render', test)
function test() {
    const passwordInput = document.getElementById('user_password');
    const confirmPasswordInput = document.getElementById('user_password_confirmation');
    const matchIcon = document.getElementById('password-match-icon');
    if (passwordInput && confirmPasswordInput) {
        confirmPasswordInput.addEventListener('input', function() {
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
        });
    }
}

