<?php
    require_once ('tools_mysql.php');
    $iSeason=$argv[1];
    $iTotalWeeks=14;
    echo ("season ".$iSeason."...\n");
    echo ("Symbology:  [+] Divisional; [-]Conference; [.] ExtraConference\n");
    $asCalendar=[];
    for($i=1;$i<=$iTotalWeeks;$i++) {
        $asPartidos=tools_mysql_consulta("SELECT * FROM temp_matches WHERE season_id=".$iSeason." AND week=".$i." ORDER BY week",'default');
        foreach ($asPartidos['DATOS'] as $key => $asPartido) {
            $asCalendar[$key][$i]['guest']=$asPartido['guest_team'];
            $asCalendar[$key][$i]['home']=$asPartido['home_team'];
            $asCalendar[$key][$i]['scope']=$asPartido['scope'];
        }
    }
  //      var_dump($asCalendar);
    for ($iVuelta=0;$iVuelta<2;$iVuelta++) {
        for ($i=1;$i<=7;$i++) {
            echo ("    ".strval($iVuelta*7+$i)."       \t");
        }
        echo ("\n");
        for ($iLinea=0;$iLinea<8;$iLinea++) {
            for ($iWeek=1;$iWeek<=7;$iWeek++) {
                if (isset($asCalendar[$iLinea][$iVuelta*7+$iWeek])) {
                    switch ($asCalendar[$iLinea][$iVuelta*7+$iWeek]['scope']) {
                    case 'D' : $sType='+'; break;
                    case 'C' : $sType='-'; break;
                    case 'L' : $sType='.'; break;
                    }
                    $sEspacioGuest=(strlen($asCalendar[$iLinea][$iVuelta*7+$iWeek]['guest'])<3) ? " " : "";
                    $sEspacioHome=(strlen($asCalendar[$iLinea][$iVuelta*7+$iWeek]['home'])<3) ? " " : "";
                    echo ($asCalendar[$iLinea][$iVuelta*7+$iWeek]['guest'].$sEspacioGuest
                        ." @ ".$asCalendar[$iLinea][$iVuelta*7+$iWeek]['home'].$sEspacioHome." ".$sType."\t");
                }
                else {
                    echo (" N/D      \t");
                }
            }
            echo ("\n");
        }
        //revisa si hay partidos sin asignar
        $asPartidosSinAsignar=tools_mysql_consulta("SELECT * FROM temp_matches WHERE season_id=".$iSeason." AND week IS NULL",'default');
        if ($asPartidosSinAsignar['ESTATUS']==1) {
            $sSinAsignar="";
            foreach ($asPartidosSinAsignar['DATOS'] as $key => $asPartido) {
                $sComa=($sSinAsignar=="") ? "" : ", ";
                $sSinAsignar.= $sComa." ".$asPartido['guest_team']." @ ".$asPartido['home_team']." ";
            }
            echo ("Partidos sin asignar: ".$sSinAsignar."\n");
        }
    }
?>
