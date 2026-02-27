<?php
require_once "conexion.php";
require_once "header2.php";

$sql = "SELECT id, nombre FROM equipos";
$resultado = $con->query($sql);
?>

<section class="auth-section">
  <div class="auth-card">
    <img src="img/logoheader.png" alt="" class="logo2">
    <h1 class="auth-title">Registro</h1>
    <form class="auth-form" action="registrar_usuario.php" method="post">
      <input type="email" name="email" placeholder="Email" autocomplete="email" required>
      <input type="password" name="password" placeholder="Password" autocomplete="new-password" required>
      <select name="plan" required>
        <option value="gratis">Plan Gratis</option>
        <option value="5">Plan 5EUR</option>
        <option value="10">Plan 10EUR</option>
      </select>
      <select name="equipo_favorito" required>
        <option value="">--Elige tu equipo--</option>
        <?php
        while ($fila = $resultado->fetch_assoc()) {
          echo "<option value='$fila[id]'>$fila[nombre]</option>";
        }
        ?>
      </select>
      <input type="submit" value="Registrarse">
      <p>Ya estás registrado? <a href="login.php">Inicia sesión</a></p>
    </form>
  </div>
</section>

<?php
require_once "footer.php";
?>
