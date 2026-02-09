<?php
$id = $_POST['poblacion'];
require_once "conexion.php";

$sql = "SELECT nombre, nacionalidad FROM jugadores WHERE id = $id";
$con->query($sql);


?>