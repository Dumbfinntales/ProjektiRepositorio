document.addEventListener('DOMContentLoaded', function() {
    const modal = document.getElementById('login-form');
    const loginButtons = document.querySelectorAll('.login-button');
    const closeButton = document.querySelector('.close-button');
    const form = document.querySelector('#login-form form');
    const error = document.querySelector('#login-form .error');

   
    loginButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            modal.style.display = 'block';
        });
    });

    
    closeButton.addEventListener('click', function() {
        modal.style.display = 'none';
    });

    
    window.addEventListener('click', function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });

    
    form.addEventListener('submit', function(event) {
        event.preventDefault();
        const username = form.username.value;
        const password = form.password.value;

        // Here you would typically make an AJAX request to your server to verify the credentials
        // For this example, let's just hardcode a username and password
        if (username === 'user' && password === 'password') {
            // Redirect to dashboard or some other page
            window.location.href = 'index.html';
        } else {
            error.textContent = 'Invalid username or password';
        }
    });
});
