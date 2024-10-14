<?php
// Iniciar la sesión al comienzo del archivo
session_start();

date_default_timezone_set('America/Argentina/Buenos_Aires');

// Verificar si el usuario está logueado
if (!isset($_SESSION['id_usuario'])) {
    header("Location: index.html");
    exit(); 
}

// Obtener el ID del usuario desde la sesión
$idusuario = $_SESSION['id_usuario'];
$nombreusuario = $_SESSION['nombre_usuario'];
$emailusuario = $_SESSION['email_usuario'];

// Recibir los datos del formulario
$descripcion = $_POST['descripcion_ticket'];
$fecha = date('Y-m-d H:i');  // Generar la fecha actual en formato YYYY-MM-DD
$prioridad = $_POST['prioridad_ticket'];

// CADENA DE CONEXION
$hostname = "localhost";
$username = "root";
$password = "";
$basedatosname = "sistema de tickets";
$tablaname = "tickets";

// Crear conexión
$conexion = mysqli_connect($hostname, $username, $password, $basedatosname);

// Chequeando la conexión
if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Insertar datos
$consulta = "INSERT INTO tickets (id_usuario, nombre_usuario, email_usuario, descripcion_ticket, fecha_reporte_ticket, prioridad_ticket) 
VALUES ('$idusuario', '$nombreusuario', '$emailusuario', '$descripcion', '$fecha', '$prioridad')";

if (mysqli_query($conexion, $consulta)) {
    header("Location: ticketenviadoexitosamente.html");
    exit(); 
} else {
    echo "ERROR: " . $consulta . "<br>" . mysqli_error($conexion);
}

// Cerrar la conexión
mysqli_close($conexion);
?>