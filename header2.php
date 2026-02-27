<?php
session_start();

$isLogged = isset($_SESSION['usuario']);
?>
<link rel="stylesheet" href="css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

<header class="site-header">
    <div class="menu-btn">
        <div class="dropdown">
            <button class="btn btn-secondary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="img/menu.png" alt="Menu" class="menu-icon">
            </button>
            <ul class="dropdown-menu">
                <?php if ($isLogged): ?>
                <li><a class="dropdown-item" href="equipos.php">Equipos</a></li>
                <li><a class="dropdown-item" href="jugadores.php">Jugadores</a></li>
                <li><a class="dropdown-item" href="logout.php">Cerrar Sesión</a></li>
                <?php else: ?>
                <li><a class="dropdown-item" href="login.php">Login</a></li>
                <li><a class="dropdown-item" href="registro.php">Registro</a></li>
                <?php endif; ?>
            </ul>
        </div>
    </div>

    <div class="logo">
        <a href="index.php"><img src="img/logoheader.png" alt="Logo" class="logo-img"></a>
    </div>
</header>
