<?php
require_once(__DIR__ . '/../conexion.php');
$topEquipos = $con->query("
    SELECT e.nombre, e.escudo, COALESCE(SUM(j.goles),0) AS goles
    FROM equipos e
    LEFT JOIN jugadores j ON j.equipo_id = e.id
    GROUP BY e.id, e.nombre, e.escudo
    ORDER BY goles DESC
    LIMIT 3
");
?>
<section class="home-section">
    <div class="home-section__head">
        <h2>Equipos más goleadores</h2>
        <a href="clasificacion.php" class="link-more">Ver clasificación →</a>
    </div>
    <div class="cards-row">
        <?php $pos = 1;
        while ($e = $topEquipos->fetch_assoc()): ?>
            <div class="podio-card podio-card--<?php echo $pos; ?>">
                <div class="podio-card__rank">#<?php echo $pos; ?></div>
                <img src="img/<?php echo htmlspecialchars($e['escudo']); ?>"
                    alt="<?php echo htmlspecialchars($e['nombre']); ?>" class="podio-card__img">
                <h3 class="podio-card__name"><?php echo htmlspecialchars($e['nombre']); ?></h3>
                <div class="podio-card__stat"><strong><?php echo (int) $e['goles']; ?></strong> goles</div>
            </div>
            <?php $pos++; endwhile; ?>
    </div>
</section>