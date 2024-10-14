<?php
// Iniciar la sesión al comienzo del archivo
session_start();

// Verificar si el usuario ha iniciado sesión y tiene rol asignado
if (!isset($_SESSION['id_usuario']) || !isset($_SESSION['rol_usuario'])) {
    die("Acceso denegado. Por favor, inicie sesión.");
}

// Conexión a la base de datos
$conexion = mysqli_connect("localhost", "root", "", "sistema de tickets");
if (!$conexion) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Determinar el rol del usuario
$rol_usuario = $_SESSION['rol_usuario'];
$id_usuario = $_SESSION['id_usuario'];

// Consulta según el rol
if ($rol_usuario === 'Administrador') {
    $consulta = "SELECT * FROM vista_tickets_admin";
} else {
    $consulta = "SELECT * FROM vista_tickets_usuario WHERE id_usuario = $id_usuario";
}

$resultado = mysqli_query($conexion, $consulta);

// Mostrar los datos en una tabla HTML
if (mysqli_num_rows($resultado) > 0) {
    echo "<table border='1'>
            <tr>
                <th>Fecha de Alta</th>
                <th>Ticket N°</th>
                <th>Nombre</th>
                <th>eMail</th>
                <th>Descripción</th>
                <th>Estado</th>
                <th>Devolución</th>";

    // Solo mostrar "Acciones" si es Administrador
    if ($rol_usuario === 'Administrador') {
        echo "<th>Acciones</th>";
    }

    echo "</tr>";

    while ($fila = mysqli_fetch_assoc($resultado)) {
        echo "<tr>
                <td>{$fila['Fecha de Alta']}</td>
                <td>{$fila['Ticket N°']}</td>
                <td>{$fila['Nombre']}</td>
                <td>{$fila['eMail']}</td>
                <td>{$fila['Descripción']}</td>
                <td>{$fila['Estado']}</td>
                <td>";

        // Mostrar la devolución existente o permitir ingresar una nueva (solo Administradores)
        if ($rol_usuario === 'Administrador' && $fila['Estado'] !== 'Cerrado') {
            echo "<form action='actualizar_devolucion.php' method='POST'>
                    <input type='hidden' name='id_ticket' value='{$fila['Ticket N°']}'>
                    <input type='text' name='devolucion_ticket' value='{$fila['Devolución']}' placeholder='Escribir Devolución'>
                    <input type='submit' value='Guardar'>
                  </form>";
        } else {
            echo htmlspecialchars($fila['Devolución']); // Mostrar la devolución como texto plano para usuarios estándar
        }

        echo "</td>";

        // Acciones solo si es Administrador y el ticket no está cerrado
        if ($rol_usuario === 'Administrador' && $fila['Estado'] !== 'Cerrado') {
            echo "<td>
                    <form action='actualizar_estado.php' method='POST'>
                        <input type='hidden' name='id_ticket' value='{$fila['Ticket N°']}'>
                        <input type='submit' name='abrir' value='Abrir'>
                        <input type='submit' name='cerrar' value='Cerrar'>
                    </form>
                  </td>";
        }

        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "No posee tickets cargados.";
}

// Cerrar la conexión
mysqli_close($conexion);
?>
