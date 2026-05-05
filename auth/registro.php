<?php
require_once "../conexion.php";
if (session_status() === PHP_SESSION_NONE) {
  session_start();
}
?>
<link rel="stylesheet" href="../css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

<?php
$error = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $email = trim($_POST['email'] ?? '');
  $password = trim($_POST['password'] ?? '');
  $plan = trim($_POST['plan'] ?? 'gratis');
  $equipo = (int)($_POST['equipo_favorito'] ?? 0);
  $planesValidos = ['gratis', '5', '10'];

  if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $error = "Introduce un email valido.";
  } elseif (strlen($email) > 255) {
    $error = "El email no puede superar 255 caracteres.";
  } elseif ($password === "") {
    $error = "La contrasena es obligatoria.";
  } elseif (strlen($password) < 6) {
    $error = "La contrasena debe tener al menos 6 caracteres.";
  } elseif (!in_array($plan, $planesValidos, true)) {
    $error = "Selecciona un plan valido.";
  } elseif ($equipo <= 0) {
    $error = "Selecciona un equipo favorito valido.";
  } else {
    $sqlEquipo = "SELECT id FROM equipos WHERE id = ?";
    $consultaEquipo = $con->prepare($sqlEquipo);
    $consultaEquipo->bind_param('i', $equipo);
    $consultaEquipo->execute();
    $resultadoEquipo = $consultaEquipo->get_result();

    if ($resultadoEquipo->num_rows === 0) {
      $error = "Selecciona un equipo favorito valido.";
    } else {
      $hash = password_hash($password, PASSWORD_DEFAULT);

      $sql = "INSERT INTO usuarios (email, password, plan, equipo_favorito_id)
                VALUES (?, ?, ?, ?)";

      $consulta = $con->prepare($sql);
      $consulta->bind_param('sssi', $email, $hash, $plan, $equipo);

      if ($consulta->execute()) {
        $_SESSION['usuario'] = $email;
        header("Location: ../index.php");
        exit;
      }

      $error = $con->errno === 1062
        ? "Ese email ya esta registrado."
        : "No se pudo completar el registro.";
      $consulta->close();
    }

    $consultaEquipo->close();
  }
}

$sql_equipos = "SELECT id, nombre FROM equipos";
$resultado = $con->query($sql_equipos);
require_once "../header2.php"
  ?>

<head>
  <title>Registro</title>
</head>
<section class="auth-section">
  <div class="auth-card">
    <img src="../img/logoheader.png" alt="" class="logo2">
    <h1 class="auth-title">Registro</h1>
    <?php if ($error !== ""): ?>
      <p style="color:red;"><?php echo htmlspecialchars($error); ?></p>
    <?php endif; ?>
    <form class="auth-form" action="registro.php" method="post">
      <input type="email" name="email" placeholder="Email" autocomplete="email" maxlength="255" required>
      <input type="password" name="password" placeholder="Password" autocomplete="new-password" minlength="6" required>
      <input type="hidden" name="plan" id="plan" value="gratis">
      <select name="equipo_favorito" required>
        <option value="">-- Elige tu equipo --</option>
        <?php while ($fila = $resultado->fetch_assoc()): ?>
          <option value="<?= $fila['id'] ?>">
            <?= htmlspecialchars($fila['nombre']) ?>
          </option>
        <?php endwhile; ?>
      </select>
      <div class="plan-options" role="radiogroup" aria-label="Selecciona un plan">
        <div class="plan-option selected" role="radio" aria-checked="true" tabindex="0" data-value="gratis">
          Plan Gratis
        </div>
        <div class="plan-option" role="radio" aria-checked="false" tabindex="0" data-value="5">
          Plan Pro
        </div>
        <div class="plan-option" role="radio" aria-checked="false" tabindex="0" data-value="10">
          Plan Premium
        </div>
      </div>
      <input type="submit" value="Registrarse">
      <p>¿Ya estás registrado? <a href="login.php">Inicia sesión</a></p>
    </form>
  </div>
</section>

<script>
  const planInput = document.querySelector("#plan");
  const planOptions = document.querySelectorAll(".plan-option");

  function selectPlan(option) {
    planOptions.forEach((item) => {
      item.classList.remove("selected");
      item.setAttribute("aria-checked", "false");
    });

    option.classList.add("selected");
    option.setAttribute("aria-checked", "true");
    planInput.value = option.dataset.value;
  }

  planOptions.forEach((option) => {
    option.addEventListener("click", () => selectPlan(option));

    option.addEventListener("keydown", (event) => {
      if (event.key === "Enter" || event.key === " ") {
        event.preventDefault();
        selectPlan(option);
      }
    });
  });
</script>

<?php require_once "../footer.php"; ?>
