-- League Schedule Generator (Football Format) --
This project was created to generate a random schedule for my fantasy football's league.

Context:
   This league its conformed by 2 conferences, each one with 2 divisions, and each division is conformed by 4 teams. Thus,
there are 16 teams in this league.

   The regular season is conformed by 14 weeks. Each team has to play twice (as home and guest) with each divisional rival, 
once against rivals from the other division (same conference), and once with rivals from the other conference and change every
 year


INSTRUCTIONS

* have the table of matches the season before previously filled
   - Create the CSV file with the results from last season having the next format:
     [season_id,week,guest,home,guest_starters_score,home_starters_score,type,end_type,guest_bench_score,home_bench_score,win_type,home_advantage]
     TIP: to delete the records from the team's names, you can do a substitution looking for \(\d+-\d+-\d\) pattern with regex option selected
     NOTE: Remember to put it in the folder /var/lib/mysql-files to ease import
     NOTE2: If you are importing from a google drive file, it may have the carry return characters on DOS format, so it's recomended to use the dos2unix tool to convert to unix CRLF.
     NOTE3: In case of errors on empty fields, substitute them with \N (double backslash on vim, and uppercase)
     command:

```
LOAD DATA INFILE '/var/lib/mysql-files/<file>.csv'
INTO TABLE matches
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```
* make sure temp_matches is empty (optional) [delete from temp_matches]
* make sure franchises is correctly filled
* create new entries in divisions, according to the new season
```
     INSERT INTO divisions (id, division_name, conference_id, season_id) (select replace(id, '3','4'), division_name, conference_id, 2024 from divisions where season_id=2023);
```
* make sure table division_team is updated to the current season, and the teams are according to the division id for the current season
     [INSERT INTO division_team (team_id, division_id, season_id) (select team_id, replace(division_id, '3','4'), '2024' from division_team where season_id=2023)]
* add the corresponding columns at extra_conference_rivals
     [INSERT INTO extra_conference_rivals (season_id, ac_division, uc_division) (select 2024, replace(ac_division,'2022','2024'), replace(uc_division,'2022','2024') from extra_conference_rivals where season_id=2022);]
* run php genera_tira_partidos.php to fill up temp_matches
    - set new season
* run php acomoda_partidos_aburrido for dull generation
    - set the fixed matches to be
* make sure every team has the same number of home matches
    - php imprime_calendario_semanas 2024
    - php imprime_calendario_equipos 2024
* run  php randomize.php [number_of_tries] as many times as you want. It takes a random group of matches from a random week and tries to swap it with another week.
  NOTES:
    - The bigger the group of matches, the better chances of succesful swap
    - With settings for groups between 2 ~ 6 matches, the success ratio is about 0.1% of tries.
