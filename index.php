<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['usuario'])) {
    header("Location: login.php");
    exit();
}

require_once "conexion.php";
require_once "header2.php";

// Estadísticas globales
$totalEquipos = 0;
$totalJugadores = 0;
$totalGoles = 0;

$res = $con->query("SELECT COUNT(*) AS n FROM equipos");
if ($res) { $totalEquipos = (int)$res->fetch_assoc()['n']; }

$res = $con->query("SELECT COUNT(*) AS n FROM jugadores");
if ($res) { $totalJugadores = (int)$res->fetch_assoc()['n']; }

$res = $con->query("SELECT COALESCE(SUM(goles),0) AS n FROM jugadores");
if ($res) { $totalGoles = (int)$res->fetch_assoc()['n']; }

// Top 3 equipos por goles
$topEquipos = $con->query("
    SELECT e.nombre, e.escudo, COALESCE(SUM(j.goles),0) AS goles
    FROM equipos e
    LEFT JOIN jugadores j ON j.equipo_id = e.id
    GROUP BY e.id, e.nombre, e.escudo
    ORDER BY goles DESC
    LIMIT 3
");

// Top 3 goleadores
$topGoleadores = $con->query("
    SELECT j.nombre, j.goles, e.nombre AS equipo, e.escudo
    FROM jugadores j
    JOIN equipos e ON e.id = j.equipo_id
    ORDER BY j.goles DESC
    LIMIT 3
");
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tiki-Data — LaLiga</title>
</head>
<body>

<main class="home-main">

    <section class="hero-new hero-new--logged">
        <div class="hero-new__overlay"></div>
        <div class="hero-new__content">
            <span class="hero-new__badge">Bienvenido de nuevo</span>
            <h1 class="hero-new__title">
                Hola, <span class="accent"><?php echo htmlspecialchars(explode('@', $_SESSION['usuario'])[0]); ?></span>
            </h1>
            <p class="hero-new__subtitle">
                Explora todos los datos de LaLiga: equipos, jugadores y clasificación.
            </p>
            <div class="hero-new__cta">
                <a href="equipos.php" class="btn-primary-new">Ver equipos</a>
                <a href="jugadores.php" class="btn-secondary-new">Ver jugadores</a>
                <a href="clasificacion.php" class="btn-secondary-new">Clasificación</a>
            </div>
        </div>
    </section>

    <section class="stats-grid">
        <div class="stat-card">
            <div class="stat-card__num"><?php echo $totalEquipos; ?></div>
            <div class="stat-card__label">Equipos</div>
        </div>
        <div class="stat-card">
            <div class="stat-card__num"><?php echo $totalJugadores; ?></div>
            <div class="stat-card__label">Jugadores</div>
        </div>
        <div class="stat-card">
            <div class="stat-card__num"><?php echo $totalGoles; ?></div>
            <div class="stat-card__label">Goles totales</div>
        </div>
        <div class="stat-card">
            <div class="stat-card__num">38</div>
            <div class="stat-card__label">Jornadas</div>
        </div>
    </section>

    <section class="home-section">
        <div class="home-section__head">
            <h2>Equipos más goleadores</h2>
            <a href="clasificacion.php" class="link-more">Ver clasificación →</a>
        </div>
        <div class="cards-row">
            <?php
            $pos = 1;
            if ($topEquipos):
                while ($e = $topEquipos->fetch_assoc()):
            ?>
                <div class="podio-card podio-card--<?php echo $pos; ?>">
                    <div class="podio-card__rank">#<?php echo $pos; ?></div>
                    <img src="img/<?php echo htmlspecialchars($e['escudo']); ?>" alt="<?php echo htmlspecialchars($e['nombre']); ?>" class="podio-card__img">
                    <h3 class="podio-card__name"><?php echo htmlspecialchars($e['nombre']); ?></h3>
                    <div class="podio-card__stat"><strong><?php echo (int)$e['goles']; ?></strong> goles</div>
                </div>
            <?php
                    $pos++;
                endwhile;
            endif;
            ?>
        </div>
    </section>

    <section class="home-section">
        <div class="home-section__head">
            <h2>Pichichis de la temporada</h2>
            <a href="jugadores.php" class="link-more">Ver jugadores →</a>
        </div>
        <div class="cards-row">
            <?php
            $pos = 1;
            if ($topGoleadores):
                while ($j = $topGoleadores->fetch_assoc()):
            ?>
                <div class="player-card">
                    <div class="player-card__rank">#<?php echo $pos; ?></div>
                    <img src="img/<?php echo htmlspecialchars($j['escudo']); ?>" alt="<?php echo htmlspecialchars($j['equipo']); ?>" class="player-card__shield">
                    <div class="player-card__info">
                        <h3><?php echo htmlspecialchars($j['nombre']); ?></h3>
                        <p class="player-card__team"><?php echo htmlspecialchars($j['equipo']); ?></p>
                        <p class="player-card__goals"><strong><?php echo (int)$j['goles']; ?></strong> goles</p>
                    </div>
                </div>
            <?php
                    $pos++;
                endwhile;
            endif;
            ?>
        </div>
    </section>

</main>

<?php require_once "footer.php"; ?>
</body>
</html>
