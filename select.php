<?php
require_once "conexion.php";
$sql = "SELECT id, nombre FROM jugadores";
$resultado = $con->query($sql);
$lista = [];
while ($fila = $resultado->fetch_assoc()) {
    $lista[] = [$fila['id'], $fila['nombre']];
}
?>


<form method="post" action="nombre.php">
    <input id="sexo" type="hidden" name="sexo" value="">
    <select name="equipos">
        <option value="0">Escoje tu equipo</option>
        <?php
        foreach ($lista as $jugador) {
            echo "<option value='{$jugador[0]}'>{$jugador[1]}</option>";
        }
        ?>
    </select>
    <div class="equipos">
        <img id="hombre" src="./img/AtleticClub.png" alt="" height="250">
        <img id="mujer" src="./img/Barcelona.png" alt="" height="250">
    </div>
    <input type="submit">
</form>
<script src="js/select.js"></script>