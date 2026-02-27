<?php
require_once "header2.php";

if (!isset($_SESSION['usuario'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jugadores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>

<body>
    <?php
    require_once "conexion.php";

    $id = isset($_GET['id']) ? $_GET['id'] : "";

    $todos = "SELECT nombre, posicion FROM jugadores";
    $jugadores = $con->query($todos);
    if ($id == "" and $jugadores->num_rows > 0) {
        echo "<div class='grid-container'>";
        while ($fila = $jugadores->fetch_assoc()) {
            echo "<div class='tarjeta-equipo'>
            <div class='escudo'><img src='img/unknow.webp'></div>
            <div class='equipo link_logo'>$fila[nombre]</div>
            <div class='posicion link_logo'>$fila[posicion]</div>
            </div>";
        }
        echo "</div>";
    } elseif (!empty($id)) {
        $porEquipo = "SELECT nombre, posicion FROM jugadores WHERE equipo_id = $id";
        $resultado = $con->query($porEquipo);
        if ($resultado->num_rows > 0) {
            echo "<div class='grid-container'>";
            while ($fila = $resultado->fetch_assoc()) {
                echo "<div class='tarjeta-equipo'>
                <div class='escudo'><img src='img/unknow.webp'></div>
                <div class='equipo link_logo'>$fila[nombre]</div>
                <div class='posicion link_logo'>$fila[posicion]</div>
                </div>";
            }
            echo "</div>";
        }
    }

    require_once "footer.php";
    ?>
</body>

</html>
