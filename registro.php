<?php
require_once "conexion.php";
require_once "header2.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $email = trim($_POST['email']);
  $password = trim($_POST['password']);
  $plan = trim($_POST['plan']);
  $equipo = trim($_POST['equipo_favorito']);

  $sql = "INSERT INTO usuarios (email, password, plan, equipo_favorito_id)
            VALUES (?, ?, ?, ?)";

  $consulta = $con->prepare($sql);
  $consulta->bind_param('ssss', $email, $password, $plan, $equipo);
  $consulta->execute();
  $con->close();

  header("Location:index.php");
}

$sql_equipos = "SELECT id, nombre FROM equipos";
$resultado = $con->query($sql_equipos);
?>
<head>
    <title>Registro</title>
</head>
<section class="auth-section">
  <div class="auth-card">
    <img src="img/logoheader.png" alt="" class="logo2">
    <h1 class="auth-title">Registro</h1>
    <form class="auth-form" action="registro.php" method="post">
      <input type="email" name="email" placeholder="Email" autocomplete="email" required>
      <input type="password" name="password" placeholder="Password" autocomplete="new-password" required>
      <select name="plan" required>
        <option value="gratis">Plan Gratis</option>
        <option value="5">Plan 5EUR</option>
        <option value="10">Plan 10EUR</option>
      </select>
      <select name="equipo_favorito" required>
        <option value="">-- Elige tu equipo --</option>
        <?php while ($fila = $resultado->fetch_assoc()): ?>
          <option value="<?= $fila['id'] ?>"><?= htmlspecialchars($fila['nombre']) ?></option>
        <?php endwhile; ?>
      </select>
      <input type="submit" value="Registrarse">
      <p>¿Ya estás registrado? <a href="login.php">Inicia sesión</a></p>
    </form>
  </div>
</section>

<?php require_once "footer.php"; ?>