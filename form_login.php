<?php
// Iniciar la sesión al comienzo del archivo
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['nombre_usuario']) && isset($_POST['contraseña'])) {
        $nombre = $_POST['nombre_usuario'];
        $contraseña = $_POST['contraseña'];

        // CADENA DE CONEXION
        $hostname = "localhost";
        $username = "root";
        $password = "";
        $basedatosname = "sistema de tickets";
        $tablaname = "usuario";

        // Crear conexión
        $conexion = mysqli_connect($hostname, $username, $password, $basedatosname);

        // Verificar si la conexión fue exitosa
        if (!$conexion) {
            die("Conexión fallida: " . mysqli_connect_error());
        }

        // Consultar para verificar el login y obtener el rol del usuario
        $consulta = "SELECT * FROM $tablaname WHERE nombre_usuario='$nombre' AND contraseña='$contraseña'";
        $resultado = mysqli_query(mysql: $conexion, query: $consulta);

        if (mysqli_num_rows(result: $resultado) > 0) {
            // Obtener los datos del usuario y guardarlos en la sesión
            $row = mysqli_fetch_assoc($resultado);
            $_SESSION['id_usuario'] = $row['id_usuario']; // Guardar el ID del usuario en la sesión
            $_SESSION['nombre_usuario'] = $row['nombre_usuario']; // Guardar el nombre de usuario en la sesión
            $_SESSION['email_usuario'] = $row['email_usuario']; // Guardar el email del usuario en la sesión
            $_SESSION['rol_usuario'] = $row['rol_usuario']; // Guardar el rol del usuario en la sesión

            // Redirigir al sistema después del login exitoso
            if ($_SESSION['rol_usuario'] === 'Administrador') {
                header(header: "Location: dashboard.html");
            } else {
                header(header: "Location: dashboard.html");
            }
            exit(); // Asegurar que el script se detenga después de la redirección
        } else {
            echo "Usuario o contraseña incorrectos.";
        }

        // Cerrar la conexión
        mysqli_close(mysql: $conexion);
    } else {
        echo "Por favor, ingrese su nombre de usuario y contraseña.";
    }
} else {
    echo "Método de solicitud no válido.";
}
?>
