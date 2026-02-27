<?php
require_once "header2.php";
?>

<section class="auth-section">
    <div class="auth-card">
        <img src="img/logoheader.png" alt="" class="logo2">
        <h1 class="auth-title">Iniciar sesion</h1>
        <form class="auth-form" action="logcheck.php" method="post">
            <input type="email" name="email" placeholder="Email" autocomplete="email" required>
            <input type="password" name="password" placeholder="Password" autocomplete="current-password" required>
            <input type="submit" value="Entrar">
            <p>No estás registrado? <a href="registro.php">Registrate</a></p>
        </form>
    </div>
</section>

<?php
require_once "footer.php";
?>