document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault();

    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;

    // Aquí puedes agregar la lógica para verificar el usuario y contraseña
    // Por ahora, simplemente mostraremos un mensaje de error si los campos están vacíos
    if (username.trim() === '' || password.trim() === '') {
        document.getElementById('error-message').textContent = 'Por favor, ingresa un nombre de usuario y contraseña.';
    } else {
        // Aquí puedes realizar la autenticación utilizando AJAX o fetch
        // Por ejemplo, puedes enviar los datos del formulario a un servidor para la autenticación
        // y mostrar un mensaje de error o redirigir al usuario según la respuesta del servidor
        console.log('Usuario:', username);
        console.log('Contraseña:', password);
    }
});