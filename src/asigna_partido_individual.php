<?php
require_once ('tools_mysql.php');
    $asAssign=tools_mysql_ejecuta("UPDATE temp_matches SET week=$argv[3] WHERE home_team='$argv[1]' AND guest_team='$argv[2]' AND season_id=2022 ","default");
    echo ("Asignando $argv[1] @ $argv[2] a la semana $argv[3]\n");





?>
