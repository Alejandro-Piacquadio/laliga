<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!isset($_SESSION['usuario'])) {
    header("Location: auth/login.php");
    exit();
}

require_once "conexion.php";
require_once "header2.php";
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tiki-Data — LaLiga</title>
    <link rel="stylesheet" href="css/styles.css">
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

    <?php require "home/stats.php"; ?>
    <?php require "home/top_equipos.php"; ?>
    <?php require "home/top_goleadores.php"; ?>

</main>

<?php require_once "footer.php"; ?>
</body>
</html>
