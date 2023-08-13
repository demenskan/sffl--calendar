<?php
    require_once ('tools_mysql.php');
    $iSeason="2023";
    $iWeekCount=14;
    $iMatchesPerWeek=8;
    $iRetries=10;
    //Resets the matches
    $asMatchReset=tools_mysql_ejecuta("UPDATE temp_matches SET week=NULL ","default");
    AssignMatch(1,'GUE','TRO');
    AssignMatch(1,'ARR','VIL');
    AssignMatch(1,'PIR','GAN');
    AssignMatch(1,'GT','CHA');
    AssignMatch(1,'GOA','PAT');
    AssignMatch(1,'BRO','SAL');
    AssignMatch(1,'COL','SKY');
    AssignMatch(1,'HAM','TIZ');

    AssignMatch(13,'BRO','PAT');
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
    echo ("Acomodando partidos para la temporada ".$iSeason."...\n");
    $i=1;
    while ($i<=$iWeekCount) {
        $iRetriesCount=$iRetries;
        while ($iRetriesCount>0) {
            $iAssignedMatches=week_assign($i, $iMatchesPerWeek, $iSeason);
            // In case of being short of matches, re-doit randomized again
            if ($iAssignedMatches<$iMatchesPerWeek) {
                echo ("Error assigning week ".$i.". retry # ".$iRetriesCount."...\n");
                $asResetMatches=tools_mysql_ejecuta("UPDATE temp_matches SET week=NULL WHERE week=".$i,"default");
                $iRetriesCount--;
            }
            else {
                echo ("week ".$i." assigned (".$iAssignedMatches.") \n");
                $asWeekMatches=tools_mysql_consulta("SELECT * FROM temp_matches WHERE week=".$i,"default");
                foreach($asWeekMatches['DATOS'] as $asMatch)
                    echo ($asMatch['guest_team']." @ ".$asMatch['home_team']."\n");
                $iRetriesCount=0;
            }
        }
        $i++;
    }



    function week_assign($piWeek, $piMatchesPerWeek, $piSeason) {
        //Gets the teams playing list
        $asTeams=tools_mysql_consulta("SELECT team_id FROM division_team WHERE season_id=".$piSeason,"default");
        $asTeamAvailable=[];
        foreach($asTeams['DATOS'] as $sTeam)
            $asTeamAvailable[$sTeam['team_id']]=true;
        //Gets the matches without a week assigned
        $asUndefinedMatches=tools_mysql_consulta("SELECT * FROM temp_matches WHERE week IS NULL ORDER BY RAND()","default");
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
