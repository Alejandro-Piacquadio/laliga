<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tiki Data</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>

<body>
    <?php
    require_once "header2.php";

    require_once "conexion.php";
    $orden = "SELECT id, nombre, escudo FROM equipos";
    $resultado = $con->query($orden);
    if ($resultado->num_rows > 0) {

        echo "<div class='grid-container'>";

        while ($fila = $resultado->fetch_assoc()) {
            echo "<a class='aa' href='jugadores.php?id=$fila[id]'><div class='tarjeta-equipo'>
            <div class='escudo'><img src='img/$fila[escudo]' alt='Logo $fila[nombre]'></div>
            <div class='equipo link_logo'>$fila[nombre]</div>
            </div></a>";
        }
        echo "</div>";
    }



    require_once "footer.php";
    ?>
</body>

</html>