<?php
session_start();
require_once "header2.php";
$usuario=$_SESSION['usuario'];

echo "<h1>Hola $usuario</h1>"
?>