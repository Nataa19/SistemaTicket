<?php
$codigo=$_POST['id_usuario'];
$nombre=$_POST['nombre_usuario'];
$contraseña=$_POST['contraseña'];
$correo=$_POST['email_usuario'];
$rol=$_POST['rol_usuario'];



//CADENA DE CONEXION
$hostname="localhost";
$username="root";
$password="";
$basedatosname="sistema de tickets";
$tablaname="usuario";

//crear cadename conexion
$conexion = mysqli_connect (hostname: $hostname, username: $username, password: $password, database: $basedatosname);

//chequeando la conexion
if (!$conexion){	
	die("eerror" . mysql_connect_error ());		
}
echo "Conectado correctamente";

//insertar datos

$consulta="INSERT INTO usuario (nombre_usuario,contraseña,email_usuario,rol_usuario) VALUES ('$nombre','$contraseña','$correo','$rol')";

if (mysqli_query (mysql: $conexion,query: $consulta))
{
	echo "Registrado correctamente";
	header (header: "Location: registradoexitosamente.html");
}	
else {
	echo "ERROR" .$consulta . "<br>" .mysqli_error (mysql: $consulta);
}

  


?>