<?php
session_start();
require_once "header2.php";
$usuario=$_SESSION['usuario'];

echo "<h1>$usuario</h1>"
?>