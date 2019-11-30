USE students;

DROP PROCEDURE IF EXISTS createCityDB;
DELIMITER // 
CREATE  PROCEDURE createCityDB() 
BEGIN
	DECLARE cityCount INT;
    DECLARE random INT;
	DECLARE done int DEFAULT false; 
	DECLARE cityNames varchar(25);
	DECLARE cityNameCursor CURSOR 
    FOR SELECT name FROM city;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true; 
    OPEN cityNameCursor;
    cityLoop: LOOP
		FETCH cityNameCursor INTO cityNames;
        IF done= true THEN LEAVE cityLoop;
        END IF;
		SET @delete_query = CONCAT('DROP DATABASE IF EXISTS', ' ', cityNames, ';');
		SET @temp_query = CONCAT('CREATE DATABASE', ' ', cityNames, ';');
		SET cityCount = FLOOR(RAND()*(9)+1);
        PREPARE cityQuery1 FROM @delete_query;
        EXECUTE cityQuery1;
        DEALLOCATE PREPARE cityQuery1;
        PREPARE cityQuery2 FROM @temp_query;
        EXECUTE cityQuery2; 
        DEALLOCATE PREPARE cityQuery2;
        SET random = 0;
        randomLoop: LOOP
			SET random = random + 1;
			SET @table_query = CONCAT('CREATE TABLE IF NOT EXISTS `', cityNames, '`.`',
            CONCAT(cityNames, random),
			'`(`id` INT NOT NULL AUTO_INCREMENT, `name` VARCHAR(255) NOT NULL, PRIMARY KEY (`id`));');
			PREPARE cityQuery3 FROM @table_query;
			EXECUTE cityQuery3;
			DEALLOCATE PREPARE cityQuery3;
			IF random > cityCount THEN
				LEAVE randomLoop;
			END IF; 
		END LOOP randomLoop;
        END LOOP cityLoop;
		CLOSE cityNameCursor;
END
 // DELIMITER ; 

CALL createCityDB();
