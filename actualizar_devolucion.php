<?php
// Iniciar la sesión
session_start();

// Conexión a la base de datos
$conexion = mysqli_connect("localhost", "root", "", "sistema de tickets");
if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Verificar si el formulario fue enviado correctamente
if (isset($_POST['id_ticket']) && isset($_POST['devolucion_ticket'])) {
    $id_ticket = $_POST['id_ticket'];
    $devolucion = mysqli_real_escape_string($conexion, $_POST['devolucion_ticket']); // Sanitizar el input

    // Actualizar la devolución del ticket en la base de datos
    $consulta = "UPDATE tickets SET devolucion_ticket = '$devolucion', estado_ticket = 'Abierto' WHERE id_ticket = $id_ticket";

    if (mysqli_query($conexion, $consulta)) {
        echo "Devolución actualizada correctamente.";
    } else {
        echo "Error al actualizar la devolución: " . mysqli_error($conexion);
    }

    // Redirigir de nuevo a la consulta después de 2 segundos
    header("Refresh:2; url=verinfodeticket.html");
    exit;
} else {
    echo "Datos incompletos.";
}

// Cerrar la conexión
mysqli_close($conexion);
?>
