<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['usuario'])) {
    header("Location: auth/login.php");
    exit();
}

require_once "conexion.php";

$consulta = "
    SELECT
        e.id,
        e.nombre,
        e.escudo,
        COALESCE(SUM(j.goles), 0) AS goles_totales
    FROM equipos e
    LEFT JOIN jugadores j ON j.equipo_id = e.id
    GROUP BY e.id, e.nombre, e.escudo
    ORDER BY goles_totales DESC
    LIMIT 10
";

$resultado = $con->query($consulta);
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clasificación</title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
    <?php require_once "header2.php"; ?>

    <main class="container mt-4 mb-4 flex-grow-1">
        <div class="dashboard-banner p-4">
            <h1 class="fw-bold mb-4 nombre-banner">Clasificación</h1>

            <?php if ($resultado && $resultado->num_rows > 0): ?>
                <div class="table-responsive">
                    <table class="table table-striped table-hover align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Posición</th>
                                <th scope="col">Equipo</th>
                                <th scope="col">Goles totales</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $posicion = 1;
                            while ($fila = $resultado->fetch_assoc()):
                            ?>
                                <tr>
                                    <td><?php echo htmlspecialchars($posicion); ?></td>
                                    <td>
                                        <a class="classification-team-link" href="jugadores.php?id=<?php echo (int) $fila['id']; ?>">
                                            <img
                                                class="classification-team-logo"
                                                src="img/<?php echo htmlspecialchars($fila['escudo']); ?>"
                                                alt="Logo <?php echo htmlspecialchars($fila['nombre']); ?>"
                                            >
                                            <span><?php echo htmlspecialchars($fila['nombre']); ?></span>
                                        </a>
                                    </td>
                                    <td><?php echo htmlspecialchars($fila['goles_totales']); ?></td>
                                </tr>
                            <?php
                                $posicion++;
                            endwhile;
                            ?>
                        </tbody>
                    </table>
                </div>
            <?php else: ?>
                <p class="mb-0">No hay equipos para mostrar.</p>
            <?php endif; ?>
        </div>
    </main>

    <?php require_once "footer.php"; ?>
</body>

</html>
