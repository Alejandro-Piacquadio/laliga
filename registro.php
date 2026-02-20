<?php
require_once "conexion.php";
require_once "header2.php";

$sql = "SELECT id, nombre FROM equipos";
$resultado = $con->query($sql);
?>

<form action="registrar_usuario.php" method="post">
  <input type="email" name="email" placeholder="Email">
  <input type="password" name="password" placeholder="Password">
  <select name="plan" id="">
    <option value="gratis">Gratis</option>
    <option value="5">5€</option>
    <option value="10">10€</option>
  </select>
  <select name="equipo_favorito" id="">
    <option value="">--Elige tu equipo--</option>
    <?php
    while ($fila = $resultado->fetch_assoc()) {
      echo "<option value='$fila[id]'>$fila[nombre]</option>";
    }
    ?>
  </select>
  <input type="submit" value="Registrarse">
</form>
<?php
require_once "footer.php";
?>