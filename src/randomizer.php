<?php
    require_once ('tools_mysql.php');
    $iSeason="2023";
    $iWeekCount=14;
    $iMatchesPerWeek=8;
    $iMinMatchesSwap=2;
    $iMaxMatchesSwap=6;
    $asReservedWeeks=array(13, 14);
    $iTrys=(isset($argv[1])) ? $argv[1] : 100;
    $iSuccess=0;
    $iFails=0;
    //Resets the matches
    echo ("Reacomodando temporada ".$iSeason."...\n");
/*
    $asTeamsMatchesSelected=array(
        "teams" => array ( 'GT', 'PIR', 'CHA', 'GAN'),
        "matches" => array ("3", "5")
    );
    $asSwapTry=check_compatibility($asTeamsMatchesSelected, 3);
    var_dump($asSwapTry);
    );
 */

     for ($i=1;$i<=$iTrys;$i++) {
            //selecciona una semana al azar 'A' que no este reservada
        $iWeekA=random_week($iWeekCount,$asReservedWeeks);
        $asReservedWeeks[]=$iWeekA;
            //Selecciona una semana 'B' al azar que no este reservada
        $iWeekB=random_week($iWeekCount,$asReservedWeeks);
            //selecciona X partidos (2X equipos) al azar
        $asTeamsMatchesWeekA=select_matches($iWeekA,$iMinMatchesSwap,$iMaxMatchesSwap);
        //var_dump($asTeamsMatchesWeekA);
        //echo ("A:".$iWeekA." B:".$iWeekB." \n");
        //si todos los equipos juegan entre si en la semana 'B', hace el intercambio de partidos entre las semanas A y B, de lo contrario declara el intento como fallido
        $asMatchesWeekB=check_compatibility($asTeamsMatchesWeekA, $iWeekB);
         //echo ("*");
        if ($asMatchesWeekB==false) {
            echo ("*"); //Swap incompatible
            $iFails++;
            //echo ("(".$i.") Fallo de compatibilidad: semana ".$iWeekA." partidos ".implode($asTeamsMatchesWeekA['matches'],",")." incompatibles con la semana ".$iWeekB."\n");
        }
        else {
            $iSuccess++;
            $asSwitch=switch_matches($asTeamsMatchesWeekA['matches'],$iWeekA, $asMatchesWeekB,$iWeekB);
            if ($asSwitch=="ok")
                echo ("Intercambio de los partidos ".implode($asTeamsMatchesWeekA['matches'],",")." => ".$iWeekB." y partidos ".implode($asMatchesWeekB,",")." => ".$iWeekA."\n");
            else
                echo ("Hubo algun error");
        }
        //borra la semana reservada
        $iPosWeekA= array_search($iWeekA,$asReservedWeeks);
        unset($asReservedWeeks[$iPosWeekA]);
    }
    echo ("Fin de programa. Exitos:".$iSuccess." Fallos:".$iFails." \n");


    //-----------------------------------------------------------------------------------------------------------------------------
    function random_week($piWeekCount, $pasReservedWeeks) {
        do {
            $iWeek=rand(1,$piWeekCount);
        } while (in_array($iWeek,$pasReservedWeeks));
        return $iWeek;
    }

    function select_matches($piWeek, $piMinMatchesToSwap, $piMaxMatchesToSwap) {
        $iMatchesToSwap=rand($piMinMatchesToSwap,$piMaxMatchesToSwap);
        $asSelectedMatches=tools_mysql_consulta("SELECT id, guest_team, home_team FROM temp_matches WHERE week=".$piWeek." ORDER BY RAND() LIMIT 0,".$iMatchesToSwap,"default");
        $asTeamsSelected=array();
        $asMatchesIds=array();
        if ($asSelectedMatches['ESTATUS']==1) {
            foreach ($asSelectedMatches['DATOS'] as $match) {
                $asTeamsSelected[]=$match['guest_team'];
                $asTeamsSelected[]=$match['home_team'];
                $asMatchesIds[]=$match['id'];
            }
            return (array('teams' => $asTeamsSelected, 'matches' => $asMatchesIds));
        }
        else
            return ($asSelectedMatches);
    }

    function check_compatibility ($pasTeamsMatchesSelected, $piNewWeek) {
        $asMatchesToSwap=array();
        $asTeamMarks=array();
        //inicializa
        //var_dump ($pasTeamsMatchesSelected['teams']);
        foreach ($pasTeamsMatchesSelected['teams'] as $sTeam) {
            $asTeamMarks[$sTeam]=false;
        }

        foreach ($pasTeamsMatchesSelected['teams'] as $sTeam) {
            //echo ("<EQUIPO>: ".print_r($sTeam, true)."\n");
            if ($asTeamMarks[$sTeam]==false) {
                $sQy="Select id, guest_team, home_team FROM temp_matches WHERE (guest_team='".$sTeam."' OR home_team='".$sTeam."') AND week=".$piNewWeek;
                //echo ("query: ".$sQy."\n");
                $rRec=tools_mysql_consulta($sQy,"default", false);
                //var_dump ($rRec);
                //echo ("sTeam->name: ".$sTeam."\n");
                if ($rRec['ESTATUS']==1) {
                    if ($rRec['DATOS']['guest_team']==$sTeam)
                        $sRivalTeam=$rRec['DATOS']['home_team'];
                    else
                        $sRivalTeam=$rRec['DATOS']['guest_team'];
                    //echo ("RivalTeam: ".$sRivalTeam."\n");
                    //var_dump ($pasTeamsMatchesSelected['teams']);
                    if (in_array($sRivalTeam, $pasTeamsMatchesSelected['teams'])) {
                        $asTeamsMarks[$sTeam]=true;
                        $asTeamsMarks[$sRivalTeam]=true;
                        if (!in_array($rRec['DATOS']['id'],$asMatchesToSwap))
                            $asMatchesToSwap[]=$rRec['DATOS']['id'];
                    }
                    else
                        return (false); //failed try
                }
            }
        }
        return ($asMatchesToSwap);
    }

    function switch_matches ($pasMatchesWeekA, $piWeekA, $pasMatchesWeekB, $piWeekB) {
        $sQyA="UPDATE temp_matches SET week=".$piWeekB." WHERE id IN (".implode($pasMatchesWeekA,",").")";
        $asRecA=tools_mysql_ejecuta($sQyA,"default");
        if ($asRecA['ESTATUS']!=1)
            return ($asRecA['MENSAJE']);
        $sQyB="UPDATE temp_matches SET week=".$piWeekA." WHERE id IN (".implode($pasMatchesWeekB,",").")";
        $asRecB=tools_mysql_ejecuta($sQyB,"default");
        if ($asRecB['ESTATUS']!=1)
            return ($asRecB['MENSAJE']);
        //si llega aqui es que tod o estuvo bien
        return ("ok");
        //echo ($sQyA."\n");
        //echo ($sQyB."\n");
    }

?>
