<?php
    require_once ('tools_mysql.php');
    $iSeason=$argv[1];
    $iWeekCount=14;
    $iMatchesPerWeek=8;
    //Resets the matches
    $asMatchReset=tools_mysql_ejecuta("UPDATE temp_matches SET week=NULL ","default");
/*    AssignMatch(1,'GUE','TRO');
AssignMatch(1,'PIR','GAN');*/
    AssignMatch(13,'GOA','PAT');
    AssignMatch(13,'BRO','SAL');
    AssignMatch(13,'VIL', 'TRO');
    AssignMatch(13,'ARR', 'GUE');
    AssignMatch(13,'HAM','SKY');
    AssignMatch(13,'COL','TIZ');
    AssignMatch(13,'GAN','PIR');
    AssignMatch(13,'CHA','GT');
    AssignMatch(14,'PAT','BRO');
    AssignMatch(14,'SAL','GOA');
    AssignMatch(14,'GUE','VIL');
    AssignMatch(14,'TRO','ARR');
    AssignMatch(14,'TIZ','HAM');
    AssignMatch(14,'SKY','COL');
    AssignMatch(14,'GT','GAN');
    AssignMatch(14,'PIR','CHA');
    echo ("Acomodando partidos para la temporada ".$iSeason."...\n");
    $i=1;
    while ($i<=$iWeekCount) {
        $iAssignedMatches=week_assign($i, $iMatchesPerWeek, $iSeason);
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




?>
