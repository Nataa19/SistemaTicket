<?php
// Conexión a la base de datos
$conexion = mysqli_connect('localhost', 'root', '', 'sistema de tickets');

// Verificar los tickets con estado 'Pendiente' que fueron creados hace más de 10 minutos
$consulta = "UPDATE tickets SET estado_ticket = 'En Espera' 
             WHERE estado_ticket = 'Pendiente' 
             AND TIMESTAMPDIFF(MINUTE, fecha_reporte_ticket, NOW()) >= 10";

mysqli_query($conexion, $consulta);

// Cerrar la conexión
mysqli_close($conexion);
?>
