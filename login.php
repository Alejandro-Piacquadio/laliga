<?php
require_once "header2.php"

    ?>
<section class="section_login">
    <form action="logcheck.php" method="post">
        <input type="text" name="usuario" placeholder="Usuario">
        <input type="password" name="password" placeholder="Password">
        <input type="submit" value="Enviar">
    </form>
</section>

<?php
require_once "footer.php";
?>