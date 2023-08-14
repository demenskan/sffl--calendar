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
     NOTE: Remember to put it in the folder /var/lib/mysql-files to ease import
     NOTE2: If you are importing from a google drive file, it may have the carry return characters on DOS format, so it's recomended to use the dos2unix tool to convert to unix CRLF.
     NOTE3: In case of errors on empty fields, substitute them with \N (uppercase)
* make sure temp_matches is empty (optional)
* make sure teams is correctly filled
* create new entries in divisions, according to the new season
* make sure table division_team is updated to the current season, and the teams are according to the division id for the current season
* add the corresponding columns at extra_conference_rivals
* run php genera_tira_partidos_aburrido.php for dull generation
    - set new season
    - set the fixed matches to be
* make sure every team has the same number of home matches
* run  php randomize.php [number_of_tries] as many times as you want. It takes a random group of matches from a random week and tries to swap it with another week.
  NOTES:
    - The bigger the group of matches, the better chances of succesful swap
    - With settings for groups between 2 ~ 6 matches, the success ratio is about 0.1% of tries.
