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
        $sql = "SELECT id, password FROM usuarios WHERE email = ?";
        $consulta = $con->prepare($sql);
        $consulta->bind_param("s", $email);
        $consulta->execute();
        $resultado = $consulta->get_result();

        if ($resultado->num_rows > 0) {
            $dato = $resultado->fetch_assoc();
            $passwordHasheado = $dato['password'];
            if (password_verify($password, $passwordHasheado)) {
                $_SESSION["usuario"] = $email;
                header("Location: index.php");
                exit;
            } else {
                $error = "El usuario no existe o el password es incorrecto.";
            }
        } else {
            $error = "El usuario no existe o el password es incorrecto.";
        }
    }
    $consulta->close();
    $con->close();
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
            <p style="color:red;"><?php htmlspecialchars($error) ?></p>
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