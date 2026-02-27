<?php
require_once "header2.php";
require_once "conexion.php";

if (!isset($_SESSION['usuario'])) {
    echo "<div class='container mt-4 hero'>
    <div class='custom-banner p-5 text-center'>
        <h1 class='fw-bold mb-3'>Bienvenido a <span class='nombre-banner'>Tiki-Data</span></h1>
        <p class='lead mb-4'>
            Explora todos los equipos y jugadores de LaLiga.
            Inicia sesión para acceder a toda la información.
        </p>

        <div class='d-flex justify-content-center gap-3'>
            <a href='login.php' class='btn btn-dark px-4'>Iniciar sesión</a>
            <a href='registro.php' class='btn btn-dark btn-lgr px-4'>Registrarse</a>
        </div>
    </div>
</div>";
} else {
    echo "<div class='container mt-4 hero-lgin'>
    <div class='dashboard-banner p-4'>
        <div class='row align-items-center'>
            
            <div class='col-md-8'>
                <h2 class='fw-bold mb-2'>
                    Hola
                </h2>
                <p class='mb-3'>
                    Bienvenido de nuevo. Explora equipos y jugadores de LaLiga.
                </p>

                <a href='equipos.php' class='btn btn-lgr me-2'>Ver equipos</a>
                <a href='jugadores.php' class='btn btn-outline-dark'>Ver jugadores</a>
            </div>

            <div class='col-md-4 text-md-end mt-3 mt-md-0'>
                <div class='mini-stats'>
                    <div><strong>20</strong> Equipos</div>
                    <div><strong>315</strong> Jugadores</div>
                </div>
            </div>

        </div>
    </div>
</div>";
}
require_once "footer.php";
?>