<?php
session_start();
$email = $_POST['email'];
$password = $_POST['password'];

require_once "conexion.php";

$sql = "SELECT * FROM usuarios WHERE email = '$email' AND password = '$password'";
$resultado=$con->query($sql);
if ($resultado->num_rows>0){
    $_SESSION['usuario']=$email;
    header("Location:index.php");
} else {
    die("El usuario no existe o el password es incorrecto");
}
?>2 