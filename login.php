<?php
require_once "conexion.php";
require_once "header2.php";

$error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = trim($_POST["email"]);
    $password = trim($_POST["password"]);

    if ($email === "" || $password === "") {
        $error = "Todos los campos son obligatorios.";
    } else {
        $sql = "SELECT * FROM usuarios WHERE email = ? AND password = ?";
        $consulta = $con->prepare($sql);
        $consulta->bind_param("ss", $email, $password);
        $consulta->execute();
        $resultado = $consulta->get_result();

        if ($resultado->num_rows > 0) {
            $_SESSION["usuario"] = $email;
            header("Location: index.php");
        } else {
            $error = "El usuario no existe o el password es incorrecto.";
        }
    }
}

?>
<head>
    <title>Login</title>
</head>
<section class="auth-section">
    <div class="auth-card">
        <img src="img/logoheader.png" alt="" class="logo2">
        <h1 class="auth-title">Iniciar sesión</h1>

        <?php if ($error !== ""): ?>
            <p style="color:red;"><?= htmlspecialchars($error) ?></p>
        <?php endif; ?>

        <form class="auth-form" action="" method="post">
            <input type="email" name="email" placeholder="Email" autocomplete="email">
            <input type="password" name="password" placeholder="Password" autocomplete="current-password">
            <input type="submit" value="Entrar">
            <p>No estás registrado? <a href="registro.php">Regístrate</a></p>
        </form>
    </div>
</section>

<?php
require_once "footer.php";
?>