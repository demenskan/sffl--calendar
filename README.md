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
* make sure franchises is correctly filled
* copy the content of *scripts_db/season_init.store.procedure* and paste it into the console (in case of DB reset)
* Run into mysql console: ``` CALL season_init(<season_number>); ```
* get inside the container
* run ``` php genera_tira_partidos.php <new_season> ``` to fill up temp_matches
* run ``` php acomoda_partidos_aburrido <new_season> ``` for dull generation
* make sure every team has the same number of home matches
    - php imprime_calendario_semanas 2024
    - php imprime_calendario_equipos 2024
* run  ``` php randomize.php <season> [number_of_tries] ``` as many times as you want. 
    It takes a random group of matches from a random week and tries to swap it with another week.
    NOTES:
    - The bigger the group of matches, the better chances of succesful swap
    - With settings for groups between 2 ~ 6 matches, the success ratio is about 0.1% of tries.
    - The number of tries parameter is optional (default=100)
