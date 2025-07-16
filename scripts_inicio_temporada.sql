

LOAD DATA INFILE '/var/lib/mysql-files/<file>.csv'
INTO TABLE matches
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

new_season=2025
previous_season=2024

INSERT INTO divisions (id, division_name, conference_id, season_id) (select replace(id, '2024','2025'), division_name, conference_id, 2025 from divisions where season_id=2024); 

DELIMITER $$

CREATE PROCEDURE copy_divisions(IN new_season INT)
BEGIN
    DECLARE previous_season INT;
    SET previous_season = new_season - 1;

    INSERT INTO divisions (id, division_name, conference_id, season_id)
    SELECT
        REPLACE(id, previous_season, new_season),
        division_name,
        conference_id,
        new_season
    FROM divisions
    WHERE season_id = previous_season;
END$$
