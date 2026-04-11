<?php
require_once "conexion.php";
require_once "header2.php";

$equipo_id = '';
if (isset($_POST['equipos'])) {
    $equipo_id = $_POST['equipos'];
}

// CONSULTA EQUIPOS
$sql_equipos = "SELECT id, nombre FROM equipos";
$resultado_equipos = $con->query($sql_equipos);

// CONSULTA JUGADORES
$jugadores = [];

if (!empty($equipo_id)) {
    $stmt = $con->prepare("SELECT id, nombre FROM jugadores WHERE equipo_id = ?");
    $stmt->bind_param("i", $equipo_id);
    $stmt->execute();
    $resultado_jugadores = $stmt->get_result();

    while ($fila = $resultado_jugadores->fetch_assoc()) {
        $jugadores[] = $fila;
    }
}
?>

<form method="POST">
    <select name="equipos" onchange="this.form.submit()">
        <option value="">Equipos</option>
        <?php while ($fila = $resultado_equipos->fetch_assoc()): ?>
            <?php
            $selected = '';
            if ($equipo_id == $fila['id']) {
                $selected = 'selected';
            }
            ?>
            <option value="<?= $fila['id'] ?>" <?= $selected ?>>
                <?= htmlspecialchars($fila['nombre']) ?>
            </option>
        <?php endwhile; ?>
    </select>
    <div>
        0
    </div>
    <select name="jugadores">
        <option value="">Jugadores</option>

        <?php foreach ($jugadores as $jugador): ?>
            <option value="<?php echo $jugador['id']; ?>">
                <?php echo htmlspecialchars($jugador['nombre']); ?>
            </option>
        <?php endforeach; ?>
    </select>
</form>