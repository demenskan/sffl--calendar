<?php
    require_once ('tools_mysql.php');
    $iSeason="2023";
    $iWeekCount=14;
    $iMatchesPerWeek=8;
    $iMatchesSwap=4;
    $asReservedWeeks=array( 1, 13, 14);
    $iTrys=10;

    //Resets the matches
    echo ("Reacomodando temporada ".$iSeason."...\n");
    $i=1;
    while ($i<=$iTrys) {
        //selecciona una semana al azar 'A' que no este reservada
        $iWeekA=random_week($iWeekCount,$asReservedWeeks);
        $asReservedWeeks[]=$iWeekA;
        $iWeekB=random_week($iWeekCount,$asReservedWeeks);
        $asTeamsSelected=select_matches($iWeekA,$iMatchesSwap);
        var_dump($asTeamsSelected);
        echo ("A:".$iWeekA." B:".$iWeekB." \n");
        //selecciona 4 partidos (8 equipos) al azar
        //Selecciona una semana 'B' al azar que no este reservada
        //si los 8 equipos juegan entre si en la semana 'B', hace el intercambio de partidos entre las semanas A y B, de lo contrario declara el intento como fallido
        $i++;


    }




    function random_week($piWeekCount, $pasReservedWeeks) {
        do {
            $iWeek=rand(1,$piWeekCount);
        } while (in_array($iWeek,$pasReservedWeeks));
        return $iWeek;
    }

    function select_matches($piWeek, $piMatchesToSwap) {
        $asSelectedMatches=tools_mysql_consulta("SELECT guest_team, home_team FROM temp_matches WHERE week=".$piWeek." ORDER BY RAND() LIMIT 0,".$piMatchesToSwap,"default");
        $asTeamsSelected=array();
        if ($asSelectedMatches['ESTATUS']==1) {
            foreach ($asSelectedMatches['DATOS'] as $match) {
                $asTeamsSelected[]=$match['guest_team'];
                $asTeamsSelected[]=$match['home_team'];
            }
            return ($asTeamsSelected);
        }
        else
            return ($asSelectedMatches);
    }


/*       $iAssignedMatches=week_assign($i, $iMatchesPerWeek, $iSeason);
        echo ("week ".$i." assigned (".$iAssignedMatches.") \n");
        $asWeekMatches=tools_mysql_consulta("SELECT * FROM temp_matches WHERE week=".$i,"default");
        foreach($asWeekMatches['DATOS'] as $asMatch)
            echo ($asMatch['guest_team']." @ ".$asMatch['home_team']."\n");
        $i++;
    }

    function week_assign($piWeek, $piMatchesPerWeek, $piSeason) {
        //Gets the teams playing list
        $asTeams=tools_mysql_consulta("SELECT team_id FROM division_team WHERE season_id=".$piSeason,"default");
        $asTeamAvailable=[];
        foreach($asTeams['DATOS'] as $sTeam)
            $asTeamAvailable[$sTeam['team_id']]=true;
        //Gets the matches without a week assigned
        $asUndefinedMatches=tools_mysql_consulta("SELECT * FROM temp_matches WHERE week IS NULL","default");
        echo ("Asignando a la semana ".$piWeek."...\n");
        if ($asUndefinedMatches['ESTATUS']==1) {
            echo ("Pendientes de asignar:".count($asUndefinedMatches['DATOS'])."...\n");
        }
        else
            echo ("Pendientes de asignar: 0\n");
        $iMatchesCount=0;
        //Check for already assigned matches
        $asAssigned=tools_mysql_consulta("SELECT * FROM temp_matches WHERE week=".$piWeek,"default");
        // In case of existence, flag them as unavailable
        if ($asAssigned['ESTATUS']==1) {
            foreach($asAssigned['DATOS'] as $asMatch) {
                $asTeamAvailable[$asMatch['guest_team']]=false;
                $asTeamAvailable[$asMatch['home_team']]=false;
                $iMatchesCount++;
            }
        }
        //Assign the rest of them
        for ($j=$iMatchesCount;$j<$piMatchesPerWeek;$j++) {
            $iOffset=0;
            foreach($asUndefinedMatches['DATOS'] as $key => $asMatch) {
                if (($asTeamAvailable[$asMatch['guest_team']])&&($asTeamAvailable[$asMatch['home_team']])) {
                    $asMatchAssign=tools_mysql_ejecuta("UPDATE temp_matches SET week=".$piWeek." WHERE id=".$asMatch['id'],"default");
                    //echo ("Asignando a la semana ".$piWeek." el partido ".$asMatch['guest_team']." @ ".$asMatch['home_team']."... (Offset $iOffset)\n");
                    $iMatchesCount++;
                    $asTeamAvailable[$asMatch['home_team']]=false;
                    $asTeamAvailable[$asMatch['guest_team']]=false;
                    array_splice($asUndefinedMatches['DATOS'], $iOffset, 1);
                    break;
                }
                $iOffset++;
            }
        }
        return $iMatchesCount;
    }




    function AssignMatch($piWeek, $psGuest, $psHome) {
        $asAssign=tools_mysql_ejecuta("UPDATE temp_matches SET week=$piWeek WHERE home_team='$psHome' AND guest_team='$psGuest' ","default");
        echo ("Asignando $psGuest @ $psHome a la semana $piWeek\n");
    }

 */


?>
