<?php
session_start();
$_SESSION['numero']=43;
$usuario = $_POST['usuario'];
$password = $_POST['password'];

require_once "conexion.php";

$sql = "SELECT * FROM usuarios WHERE usuario = '$usuario' AND password = '$password'";
$resultado=$con->query($sql);
if ($resultado->num_rows>0){
    $_SESSION['usuario']=$usuario;
    header("Location:menu.php");
} else {
    die("El usuario no existe o el password es incorrecto");
}
?>