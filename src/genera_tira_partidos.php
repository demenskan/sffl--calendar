<?php
    require_once ('tools_mysql.php');
    $iSeason="2023";
    echo ("Generating matches for the season ".$iSeason."...\n");
    $asPartidos=GeneraDivisionales($iSeason);  //Misma division
    $asPartidos=array_merge($asPartidos,GeneraConferenciales($iSeason)); //Misma conferencia, distinta division
    $asPartidos=array_merge($asPartidos,GeneraExtra($iSeason)); //distinta conferencia, alternando division cada temporada
    //var_dump($asPartidos);

    $asResult=tools_mysql_ejecuta("DELETE FROM temp_matches WHERE season_id=".$iSeason,'default');
    //var_dump($asPartidos);
    $iCol=1;
    foreach ($asPartidos as $asPartido) {
        $sQyInsert="INSERT INTO temp_matches (id, season_id, guest_team, home_team, scope) VALUES "
            ."(".$iCol.",".$iSeason.",'".$asPartido['guest']."','".$asPartido['home']."','".$asPartido['scope']."')";
        $asResult=tools_mysql_ejecuta($sQyInsert,'default');
        if ($asResult['ESTATUS']!=1) 
            echo ("Error: ".$asResult['MENSAJE']."\n");
        $sEspacio=(strlen($asPartido['guest'])<3) ? " " : "";
        echo ($asPartido['guest'].$sEspacio." @ ".$asPartido['home']."\t");
        if ($iCol%8==0) echo ("\n");
        $iCol++;
    }

    function GeneraDivisionales($piSeason) {
        $asDivisions=tools_mysql_consulta("SELECT DISTINCT division_id FROM division_team WHERE season_id=".$piSeason, "default");
        $asMatches=[];
        foreach ($asDivisions['DATOS'] as $division) {
            //$division=['id' => 'AN'];
            $asTeams=tools_mysql_consulta("SELECT team_id FROM division_team WHERE division_id='".$division['division_id']."'", "default");
            foreach ($asTeams['DATOS'] as $team) {
              $asRivalTeams=$asTeams['DATOS'];
              $iPosSelf=array_search($team['team_id'],array_column($asRivalTeams,'team_id'));
                //echo ("Posicion ".$team['team_id'].":".$iPosSelf."\n");
                unset ($asRivalTeams[$iPosSelf]);
                foreach ($asRivalTeams as $RivalTeam)
                    $asMatches[]=['home' => $team['team_id'], 'guest' => $RivalTeam['team_id'], 'scope' => 'D'];
                //echo ("Rivales para ".$team['team_id'].":".$sRivals."\n");
                //echo ($team['team_id']."\n");
            }
            //echo ($row['id']."\n");
        }
        return($asMatches);
    }

    function GeneraConferenciales($piSeason) {
        //Trae todas las divisiones
        $asDivisions=tools_mysql_consulta("SELECT id, conference_id FROM divisions WHERE season_id=".$piSeason, "default");
        $asMatches=[];
        foreach ($asDivisions['DATOS'] as $division) {
            //Gets the teams that belongs to that division
            $asTeams=tools_mysql_consulta("SELECT team_id FROM division_team WHERE division_id='".$division['id']."'", "default");
            //Finds out which is the conference's rival divisions
            $asRivalDivision=tools_mysql_consulta("SELECT id FROM divisions WHERE id<>'".$division['id']."' AND conference_id='".$division['conference_id']."' AND season_id=".$piSeason, "default");
            foreach ($asRivalDivision['DATOS'] as $rivalDivision) {
                //echo ("Rival de ".$division['id'].": ".$rivalDivision['id']."\n");
                //Gets the list of teams of the rival division
                $asRivalTeams=tools_mysql_consulta("SELECT team_id FROM division_team WHERE division_id='".$rivalDivision['id']."'", "default");
                //sweeps each division team and matches with a rival team
                foreach ($asTeams['DATOS'] as $team) {
                    foreach ($asRivalTeams['DATOS'] as $rivalTeam) {
                        //The home team last season must be guest this one
                        $asLastMatch=tools_mysql_consulta("SELECT * FROM matches WHERE season_id=".($piSeason-1)
                            ." AND (guest_team='".$team['team_id']."' OR guest_team='".$rivalTeam['team_id']."')"
                            ." AND (home_team='".$team['team_id']."' OR home_team='".$rivalTeam['team_id']."')"
                            ." AND match_type='SEASON'"
                            , "default", false);
                        if ($asLastMatch['ESTATUS']==1) {
                            if ($asLastMatch['DATOS']['home_team']==$team['team_id'])
                                $asMatchCandidate=['home' => $rivalTeam['team_id'], 'guest' => $team['team_id'], 'scope' => 'C'];
                            else
                                $asMatchCandidate=['home' => $team['team_id'], 'guest' => $rivalTeam['team_id'], 'scope' => 'C'];

                        }
                        else {
                            $asMatches[]=['home' => $team['team_id'], 'guest' => $rivalTeam['team_id'], 'scope' => 'C'];
                        }
                        //Check for previous existence
                        $bMatchFound=false;
                        foreach ($asMatches as $match) {
                            if (($match['guest']==$asMatchCandidate['guest'])&&($match['home']==$asMatchCandidate['home']))
                                $bMatchFound=true;
                        }
                        if (!$bMatchFound)
                            $asMatches[]=$asMatchCandidate;
                    }
                }
            }
        }
        return($asMatches);
    }

    function GeneraExtra($piSeason) {
        //Trae todas las divisiones
        $asDivisions=tools_mysql_consulta("SELECT ac_division, uc_division FROM extra_conference_rivals WHERE season_id=".$piSeason, "default");
        $asMatches=[];
        foreach ($asDivisions['DATOS'] as $division) {
            //Gets the teams that belongs to that division
            $asTeams=tools_mysql_consulta("SELECT team_id FROM division_team WHERE division_id='".$division['ac_division']."'", "default");
            //Gets the list of teams of the rival division
            $asRivalTeams=tools_mysql_consulta("SELECT team_id FROM division_team WHERE division_id='".$division['uc_division']."'", "default");
            //sweeps each division team and matches with a rival team
            foreach ($asTeams['DATOS'] as $team) {
                foreach ($asRivalTeams['DATOS'] as $rivalTeam) {
                    //The home team last season must be guest this one
                    $asLastMatch=tools_mysql_consulta("SELECT * FROM matches WHERE season_id=".($piSeason-2)
                        ." AND (guest_team='".$team['team_id']."' OR guest_team='".$rivalTeam['team_id']."')"
                        ." AND (home_team='".$team['team_id']."' OR home_team='".$rivalTeam['team_id']."')"
                        ." AND match_type='SEASON'"
                        , "default", false);
                    if ($asLastMatch['ESTATUS']==1) {
                        if ($asLastMatch['DATOS']['home_team']==$team['team_id'])
                            $asMatchCandidate=['home' => $rivalTeam['team_id'], 'guest' => $team['team_id'], 'scope' => 'L' ];
                        else
                            $asMatchCandidate=['home' => $team['team_id'], 'guest' => $rivalTeam['team_id'], 'scope' => 'L' ];

                    }
                    else {
                        $asMatches[]=['home' => $team['team_id'], 'guest' => $rivalTeam['team_id'], 'scope' => 'L' ];
                    }
                    //Check for previous existence
                    $bMatchFound=false;
                    foreach ($asMatches as $match) {
                        if (($match['guest']==$asMatchCandidate['guest'])&&($match['home']==$asMatchCandidate['home']))
                            $bMatchFound=true;
                    }
                    if (!$bMatchFound)
                        $asMatches[]=$asMatchCandidate;
                }
            }
        }
        return($asMatches);
    }

?>
