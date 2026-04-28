<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
if (!isset($_SESSION['usuario'])) {
    header("Location: /auth/login.php");
    exit();
}
require_once "header2.php";
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

    $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

    if ($id === 0) {
        $jugadores = $con->query("SELECT nombre, posicion FROM jugadores");
    } else {
        $stmt = $con->prepare("SELECT nombre, posicion FROM jugadores WHERE equipo_id = ?");
        $stmt->bind_param('i', $id);
        $stmt->execute();
        $jugadores = $stmt->get_result();
    }

    if ($jugadores && $jugadores->num_rows > 0) {
        echo "<div class='grid-container'>";
        while ($fila = $jugadores->fetch_assoc()) {
            echo "<div class='tarjeta-equipo'>
            <div class='escudo'><img src='img/unknow.webp'></div>
            <div class='equipo link_logo'>" . htmlspecialchars($fila['nombre']) . "</div>
            <div class='posicion link_logo'>" . htmlspecialchars($fila['posicion']) . "</div>
            </div>";
        }
        echo "</div>";
    }

    require_once "footer.php";
    ?>
</body>

</html>
