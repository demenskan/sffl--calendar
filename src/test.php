<?php
    require_once ('tools_mysql.php');
    $iSeason="2022";
    $iTotalWeeks=1;
    echo ("season ".$iSeason."...\n");
    for($i=1;$i<=$iTotalWeeks;$i++) {
        //$asPartidos=tools_mysql_consulta("SELECT * FROM temp_matches WHERE season_id=".$iSeason." AND week=".$i." ORDER BY week",'default');
        $asPartidos=tools_mysql_consulta("SELECT * FROM matches WHERE season_id=".$iSeason." AND week=".$i." ORDER BY week",'default');
        var_dump($asPartidos);
        /*$iCol=1;
        foreach ($asPartidos['DATOS'] as $asPartido) {
            $asPartidos['DATOS'];
        }*/
    
    
    
    
    }
    /*foreach ($asPartidos['DATOS'] as $asPartido) {
        $sEspacio=(strlen($asPartido['guest_team'])<3) ? " " : "";
        echo ($asPartido['guest_team'].$sEspacio." @ ".$asPartido['home_team']."\t");
        if ($iCol%8==0) echo ("\n");
        $iCol++;
    }*/
