<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$isLogged = isset($_SESSION['usuario']);

$currentScriptDir = dirname($_SERVER['SCRIPT_FILENAME'] ?? __FILE__);
$relativeDir = trim(str_replace('\\', '/', substr($currentScriptDir, strlen(__DIR__))), '/');
$rootPath = $relativeDir === ''
    ? ''
    : str_repeat('../', count(explode('/', $relativeDir)));
$logoHref = $rootPath . 'index.php';

$menuItems = [
    ['label' => 'Inicio', 'href' => $logoHref],
];

if ($isLogged) {
    $menuItems[] = ['label' => 'Equipos', 'href' => $rootPath . 'equipos.php'];
    $menuItems[] = ['label' => 'Jugadores', 'href' => $rootPath . 'jugadores.php'];
    $menuItems[] = ['label' => 'Clasificacion', 'href' => $rootPath . 'clasificacion.php'];
    $menuItems[] = ['label' => 'Cerrar Sesion', 'href' => $rootPath . 'auth/logout.php'];
} else {
    $menuItems[] = ['label' => 'Login', 'href' => $rootPath . 'auth/login.php'];
    $menuItems[] = ['label' => 'Registro', 'href' => $rootPath . 'auth/registro.php'];
}
?>
<link rel="stylesheet" href="<?php echo $rootPath; ?>css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

<header class="site-header">
    <nav class="desktop-nav" aria-label="Navegacion principal">
        <?php foreach ($menuItems as $item): ?>
            <a class="desktop-nav__link" href="<?php echo htmlspecialchars($item['href']); ?>">
                <?php echo htmlspecialchars($item['label']); ?>
            </a>
        <?php endforeach; ?>
    </nav>

    <div class="menu-btn mobile-menu">
        <div class="dropdown">
            <button class="btn btn-secondary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="<?php echo $rootPath; ?>img/menu.png" alt="Menu" class="menu-icon">
            </button>
            <ul class="dropdown-menu">
                <?php foreach ($menuItems as $item): ?>
                    <li>
                        <a class="dropdown-item" href="<?php echo htmlspecialchars($item['href']); ?>">
                            <?php echo htmlspecialchars($item['label']); ?>
                        </a>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>

    <div class="logo">
        <a href="<?php echo $logoHref; ?>">
            <img src="<?php echo $rootPath; ?>img/logoheader.png" alt="Logo" class="logo-img">
        </a>
    </div>
</header>
