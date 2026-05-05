<?php
require_once "../conexion.php";
if (session_status() === PHP_SESSION_NONE) { session_start(); }
?>
<link rel="stylesheet" href="../css/styles.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

<?php
$error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = trim($_POST["email"] ?? "");
    $password = trim($_POST["password"] ?? "");

    if ($email === "" || $password === "") {
        $error = "Todos los campos son obligatorios.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Introduce un email valido.";
    } elseif (strlen($email) > 255) {
        $error = "El email no puede superar 255 caracteres.";
    } else {
        $sql = "SELECT id, password FROM usuarios WHERE email = ?";
        $consulta = $con->prepare($sql);
        $consulta->bind_param("s", $email);
        $consulta->execute();
        $resultado = $consulta->get_result();

        if ($resultado->num_rows > 0) {
            $dato = $resultado->fetch_assoc();
            $passwordHasheado = $dato['password'];

            $passwordValida = password_verify($password, $passwordHasheado);
            $passwordAntiguaValida = password_get_info($passwordHasheado)['algo'] === 0
                && hash_equals($passwordHasheado, $password);

            if ($passwordValida || $passwordAntiguaValida) {
                if ($passwordAntiguaValida || password_needs_rehash($passwordHasheado, PASSWORD_DEFAULT)) {
                    $nuevoHash = password_hash($password, PASSWORD_DEFAULT);
                    $actualizar = $con->prepare("UPDATE usuarios SET password = ? WHERE id = ?");
                    $actualizar->bind_param("si", $nuevoHash, $dato['id']);
                    $actualizar->execute();
                    $actualizar->close();
                }

                $_SESSION["usuario"] = $email;
                header("Location: ../index.php");
                exit;
            } else {
                $error = "El usuario no existe o el password es incorrecto.";
            }
        } else {
            $error = "El usuario no existe o el password es incorrecto.";
        }

        $consulta->close();
    }
}
 require_once "../header2.php"
?>
<head>
    <title>Login</title>
</head>
<section class="auth-section">
    <div class="auth-card">
        <img src="../img/logoheader.png" alt="" class="logo2">
        <h1 class="auth-title">Iniciar sesión</h1>

        <?php if ($error !== ""): ?>
            <p style="color:red;"><?php echo htmlspecialchars($error); ?></p>
        <?php endif; ?>

        <form class="auth-form" action="" method="post">
            <input type="email" name="email" placeholder="Email" autocomplete="email" maxlength="255" required>
            <input type="password" name="password" placeholder="Password" autocomplete="current-password" required>
            <input type="submit" value="Entrar">
            <p>No estás registrado? <a href="registro.php">Regístrate</a></p>
        </form>
    </div>
</section>

<?php
require_once "../footer.php";
?>
