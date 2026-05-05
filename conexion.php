<?php
define('servidor', 'localhost');
define('usuario', 'root');
define('password', '');
define('baseDeDatos', 'laliga2');
$con = new mysqli(servidor, usuario, password, baseDeDatos);

if ($con->connect_error) {
    die("Error de conexion: " . $con->connect_error);
}

$con->set_charset("utf8mb4");
?>
