<?php
require_once "conexion.php";
$email = $_POST['email'];
$password = $_POST['password'];
$plan = $_POST['plan'];
$equipo = $_POST['equipo_favorito'];

$sql = "INSERT INTO usuarios (email, password, plan, equipo_favorito_id) VALUES ('$email', '$password', '$plan', '$equipo')";
$con->query($sql);
$con->close();

header("Location:index.php")
?>
