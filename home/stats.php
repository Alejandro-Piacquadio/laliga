<?php
$res = $con->query("SELECT COUNT(*) AS n FROM equipos");
$totalEquipos = $res ? (int)$res->fetch_assoc()['n'] : 0;

$res = $con->query("SELECT COUNT(*) AS n FROM jugadores");
$totalJugadores = $res ? (int)$res->fetch_assoc()['n'] : 0;

$res = $con->query("SELECT COALESCE(SUM(goles),0) AS n FROM jugadores");
$totalGoles = $res ? (int)$res->fetch_assoc()['n'] : 0;
?>
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
