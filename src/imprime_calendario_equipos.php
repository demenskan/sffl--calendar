<?php
require_once ('tools_mysql.php');
    if (!isset($argv[1]))
        die ("debes poner la temporada\n");
    $iSeason=$argv[1];
    //$iSeason="2021";
    $iTotalWeeks=14;
    echo ("season ".$iSeason."...\n");
    echo ("Symbology:  [+] Divisional; [-]Conference; [.] ExtraConference\n");
    $asCalendar=[];
    for($i=1;$i<=$iTotalWeeks;$i++) {
        $asPartidos=tools_mysql_consulta("SELECT * FROM temp_matches WHERE season_id=".$iSeason." AND week=".$i." ORDER BY week",'default');
        foreach ($asPartidos['DATOS'] as $key => $asPartido) {
            switch ($asPartido['scope']) {
                case 'D' : $sType='+'; break;
                case 'C' : $sType='-'; break;
                case 'L' : $sType='.'; break;
            }
            $asCalendar[$asPartido['guest_team']][$i]=[ 'rival' => $asPartido['home_team'], 'mark' => '@', 'type' => $sType ];
            $asCalendar[$asPartido['home_team']][$i]=[ 'rival' => $asPartido['guest_team'], 'mark' => ' ', 'type' => $sType];
        }
    }
    for ($iVuelta=0;$iVuelta<2;$iVuelta++) {
        $asTeams=tools_mysql_consulta("SELECT team_id FROM division_team WHERE season_id=".$iSeason." LIMIT ".strval($iVuelta*8).",8 ","default");
        foreach ($asTeams['DATOS'] as $asTeam) {
            $sEspacio=(strlen($asTeam['team_id'])<3) ? " " : "";
            echo ("      ".$asTeam['team_id'].$sEspacio."  \t");
        }
        echo ("\n");
        for ($i=1;$i<=$iTotalWeeks;$i++) {
            foreach ($asTeams['DATOS'] as $asTeam) {
                if (isset($asCalendar[$asTeam['team_id']][$i]['rival'])) {
                    $sEspacio=(strlen($asCalendar[$asTeam['team_id']][$i]['rival'])<3) ? " " : "";
                    echo (" (".sprintf("%'.02d",$i).") ".$asCalendar[$asTeam['team_id']][$i]['mark']." "
                    .$asCalendar[$asTeam['team_id']][$i]['rival'].$sEspacio." ".$asCalendar[$asTeam['team_id']][$i]['type']."\t");
                }
                else
                   echo (" (".sprintf("%'.02d",$i).") - ---  \t");
            }
            echo ("\n");
        }
    }
?>
