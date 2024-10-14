<?php
// Iniciar la sesión
session_start();

// Conexión a la base de datos
$conexion = mysqli_connect("localhost", "root", "", "sistema de tickets");
if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Verificar si se envió la solicitud de cierre o apertura
if (isset($_POST['cerrar'])) {
    $id_ticket = $_POST['id_ticket'];

    // Actualizar el estado del ticket a "Cerrado"
    $consulta = "UPDATE tickets 
                 SET estado_ticket = 'Cerrado' 
                 WHERE id_ticket = $id_ticket";
    mysqli_query($conexion, $consulta);

} elseif (isset($_POST['abrir'])) {
    $id_ticket = $_POST['id_ticket'];

    // Actualizar el estado del ticket a "Abierto"
    $consulta = "UPDATE tickets 
                 SET estado_ticket = 'Abierto' 
                 WHERE id_ticket = $id_ticket";
    mysqli_query($conexion, $consulta);
}


// Cerrar la conexión
mysqli_close(mysql: $conexion);
header("Location: verinfodeticket.html");
exit();
?>
