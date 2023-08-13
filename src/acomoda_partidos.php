<?php
    require_once ('tools_mysql.php');
    $iSeason="2023";
    $iWeekCount=14;
    $iMatchesPerWeek=8;
    $iReintentos=5;
    //Resets the matches
    $asMatchReset=tools_mysql_ejecuta("UPDATE temp_matches SET week=NULL ","default");
    AssignMatch(1,'GUE','TRO');
AssignMatch(1,'PIR','GAN');
    AssignMatch(13,'GOA','SAL');
    AssignMatch(13,'GAN','PIR');
    AssignMatch(13,'CHA','GT');
    AssignMatch(13,'VIL','TRO');
    AssignMatch(13,'ARR','GUE');
    AssignMatch(13,'HAM','SKY');
    AssignMatch(13,'COL','TIZ');
    AssignMatch(14,'PAT','GOA');
    AssignMatch(14,'SAL','BRO');
    AssignMatch(14,'TRO','ARR');
    AssignMatch(14,'GUE','VIL');
    AssignMatch(14,'SKY','COL');
    AssignMatch(14,'TIZ','HAM');
    AssignMatch(14,'PIR','CHA');
    AssignMatch(14,'GT','GAN');



/*    AssignMatch(1,'PAT','GOA');
    AssignMatch(13,'GOA','PAT');
    AssignMatch(13,'SAL','BRO');
    AssignMatch(13,'PIR','CHA');
    AssignMatch(13,'GT','GAN');
    AssignMatch(13,'TRO','ARR');
    AssignMatch(13,'SKY','VIL');
    AssignMatch(13,'PD','COL');
    AssignMatch(14,'GOA','SAL');
    AssignMatch(14,'BRO','PAT');
    AssignMatch(14,'VIL','TRO');
    AssignMatch(14,'ARR','SKY');
    AssignMatch(14,'COL','TIZ');
    AssignMatch(14,'CAF','PD');
    AssignMatch(13,'TIZ','CAF');
    AssignMatch(14,'GAN','PIR');
    AssignMatch(14,'CHA','GT');
 */
//--
    echo ("Acomodando partidos para la temporada ".$iSeason."...\n");
    //Gets the teams playing list
    $asTeams=tools_mysql_consulta("SELECT team_id FROM division_team WHERE season_id=".$iSeason,"default");
    $asTeamAvailable=[];
    foreach($asTeams['DATOS'] as $sTeam)
        $asTeamAvailable[$sTeam['team_id']]=true;
    //Gets the matches without a week assigned
    $asUndefinedMatches=tools_mysql_consulta("SELECT * FROM temp_matches WHERE week IS NULL ORDER BY RAND()","default");
    echo ("Pendientes de asignar:".count($asUndefinedMatches['DATOS'])."...\n");
    for ($i=1;$i<=$iWeekCount;$i++) {
        //Resetting the flags
        foreach($asTeams['DATOS'] as $sTeam)
            $asTeamAvailable[$sTeam['team_id']]=true;
        echo ("Asignando a la semana ".$i."...\n");
        echo ("Pendientes de asignar a la semana $i:".count($asUndefinedMatches['DATOS'])."...\n");
        $iMatchesCount=0;
        //Check for already assigned matches
        $asAssigned=tools_mysql_consulta("SELECT * FROM temp_matches WHERE week=".$i,"default");
        // In case of existence, flag them as unavailable
        if ($asAssigned['ESTATUS']==1) {
            foreach($asAssigned['DATOS'] as $asMatch) {
                $asTeamAvailable[$asMatch['guest_team']]=false;
                $asTeamAvailable[$asMatch['home_team']]=false;
                $iMatchesCount++;
            }
        }
        //Assign the rest of them
        for ($j=$iMatchesCount;$j<$iMatchesPerWeek;$j++) {
            $iOffset=0;
            foreach($asUndefinedMatches['DATOS'] as $key => $asMatch) {
                if (($asTeamAvailable[$asMatch['guest_team']])&&($asTeamAvailable[$asMatch['home_team']])) {
                    $asMatchAssign=tools_mysql_ejecuta("UPDATE temp_matches SET week=".$i." WHERE id=".$asMatch['id'],"default");
                    echo ("Asignando a la semana ".$i." el partido ".$asMatch['guest_team']." @ ".$asMatch['home_team']."... (Offset $iOffset)\n");
                    $iMatchesCount++;
                    $asTeamAvailable[$asMatch['home_team']]=false;
                    $asTeamAvailable[$asMatch['guest_team']]=false;
                    array_splice($asUndefinedMatches['DATOS'], $iOffset, 1);
                    break;
                }
                $iOffset++;
            }
        }
        echo ("Conteo: ".$iMatchesCount."\n");
        // In case of being short of matches, re-doit randomized again
        /*if (($iMatchesCount<($iMatchesPerWeek-1))&&($iReintentos>0)) {
            echo ("Error Asignando a la semana ".$i." reintentando...\n");
            $asUndefinedMatches=tools_mysql_consulta("SELECT * FROM temp_matches WHERE week IS NULL ORDER BY RAND()","default");
            $i--;
            $iReintentos--;
        }*/
    }




    function AssignMatch($piWeek, $psGuest, $psHome) {
        $asAssign=tools_mysql_ejecuta("UPDATE temp_matches SET week=$piWeek WHERE home_team='$psHome' AND guest_team='$psGuest' ","default");
        echo ("Asignando $psGuest @ $psHome a la semana $piWeek\n");
    }




?>
