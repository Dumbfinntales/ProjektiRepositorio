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
        const kayttajatunnus = form.kayttajatunnus.value;
        const salasana = form.salasana.value;

        // Make AJAX request to a PHP file for authentication
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'authenticate.php', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText);
                    if (response.success) {
                        // Redirect to dashboard or some other page
                        window.location.href = 'index.html';
                    } else {
                        error.textContent = response.message;
                    }
                } else {
                    error.textContent = 'Virheellinen palvelinpyyntö';
                }
            }
        };
        xhr.send('kayttajatunnus=' + encodeURIComponent(kayttajatunnus) + '&salasana=' + encodeURIComponent(salasana));
        console.log(xhr.responseText);
    });
});