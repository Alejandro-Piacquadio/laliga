<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
if (!isset($_SESSION['usuario'])) {
    header("Location: auth/login.php");
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
    $basePlayerImageUrl = "img";
    $defaultPlayerImage = "unknow.webp";
    $playerImageExtensions = ['jpg', 'jpeg', 'png', 'webp'];
    $teamImageFolders = [
        1 => ['madrid', 'Real Madrid'],
        2 => ['barcelona', 'FCBarcelona'],
        3 => ['villareal', 'Villareal'],
        4 => ['atm', 'ATM'],
        5 => ['betis', 'Betis'],
        6 => ['espanyol', 'RCD Espanyol'],
        7 => ['getafe', 'Getafe'],
        8 => ['alaves', 'Alavés'],
        9 => ['elche', 'Elche'],
        10 => ['rayovallecano', 'Rayo vallecano'],
        11 => ['bilbao', 'Athetic de Bilbao'],
        12 => ['celtavigo', 'Celta de vigo'],
        13 => ['sevilla', 'Sevilla'],
        14 => ['realsociedad', 'Real Sociedad'],
        15 => ['osasuna', 'Osasuna'],
        16 => ['levante', 'Levante'],
        17 => ['mallorca', 'Mallorca'],
        18 => ['valencia', 'Valencia CF'],
        19 => ['oviedo', 'Real Oviedo'],
    ];

    function buildPlayerImageUrl($basePath, $teamFolders, $teamId, $imageName, $defaultImage, $extensions) {
        $imageName = trim($imageName ?? '');

        if ($imageName === '') {
            return $basePath . '/' . rawurlencode($defaultImage);
        }

        if (!isset($teamFolders[$teamId])) {
            return $basePath . '/' . rawurlencode($defaultImage);
        }

        $fileName = $imageName;
        $teamPathParts = array_merge([$basePath], $teamFolders[$teamId]);
        $teamPath = implode(DIRECTORY_SEPARATOR, $teamPathParts);

        if (pathinfo($fileName, PATHINFO_EXTENSION) === '') {
            $fileName = $defaultImage;

            foreach ($extensions as $extension) {
                $candidate = $imageName . '.' . $extension;
                $candidatePath = $teamPath . DIRECTORY_SEPARATOR . $candidate;

                if (file_exists($candidatePath)) {
                    $fileName = $candidate;
                    break;
                }
            }
        }

        $pathParts = array_merge($teamPathParts, [$fileName]);

        return implode('/', array_map('rawurlencode', $pathParts));
    }

    if ($id === 0) {
        $jugadores = $con->query("SELECT nombre, posicion, imagen, equipo_id FROM jugadores");
    } else {
        $stmt = $con->prepare("SELECT nombre, posicion, imagen, equipo_id FROM jugadores WHERE equipo_id = ?");
        $stmt->bind_param('i', $id);
        $stmt->execute();
        $jugadores = $stmt->get_result();
    }

    if ($jugadores && $jugadores->num_rows > 0) {
        echo "<div class='grid-container'>";
        while ($fila = $jugadores->fetch_assoc()) {
            $nombre = htmlspecialchars($fila['nombre']);
            $posicion = htmlspecialchars($fila['posicion']);
            $imagenSrc = htmlspecialchars(buildPlayerImageUrl(
                $basePlayerImageUrl,
                $teamImageFolders,
                (int)$fila['equipo_id'],
                $fila['imagen'],
                $defaultPlayerImage,
                $playerImageExtensions
            ));

            echo "<div class='tarjeta-equipo'>
            <div class='escudo'><img src='{$imagenSrc}' alt='Foto {$nombre}'></div>
            <div class='equipo link_logo'>{$nombre}</div>
            <div class='posicion link_logo'>{$posicion}</div>
            </div>";
        }
        echo "</div>";
    }

    require_once "footer.php";
    ?>
</body>

</html>
