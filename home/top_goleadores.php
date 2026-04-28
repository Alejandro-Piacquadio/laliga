<?php
$topGoleadores = $con->query("
    SELECT j.nombre, j.goles, e.nombre AS equipo, e.escudo
    FROM jugadores j
    JOIN equipos e ON e.id = j.equipo_id
    ORDER BY j.goles DESC
    LIMIT 3
");
?>
<section class="home-section">
    <div class="home-section__head">
        <h2>Pichichis de la temporada</h2>
        <a href="jugadores.php" class="link-more">Ver jugadores →</a>
    </div>
    <div class="cards-row">
        <?php $pos = 1; while ($j = $topGoleadores->fetch_assoc()): ?>
            <div class="player-card">
                <div class="player-card__rank">#<?php echo $pos; ?></div>
                <img src="img/<?php echo htmlspecialchars($j['escudo']); ?>" alt="<?php echo htmlspecialchars($j['equipo']); ?>" class="player-card__shield">
                <div class="player-card__info">
                    <h3><?php echo htmlspecialchars($j['nombre']); ?></h3>
                    <p class="player-card__team"><?php echo htmlspecialchars($j['equipo']); ?></p>
                    <p class="player-card__goals"><strong><?php echo (int)$j['goles']; ?></strong> goles</p>
                </div>
            </div>
        <?php $pos++; endwhile; ?>
    </div>
</section>
