USE students;
DROP FUNCTION IF EXISTS selectCity;
DELIMITER //
CREATE FUNCTION selectCity()
RETURNS VARCHAR(25)
READS SQL DATA
DETERMINISTIC
BEGIN
	RETURN (SELECT city.name FROM city, finishedschools
			WHERE (city.city_id = finishedschools.city_id)
            LIMIT 1);
END //
DELIMITER ;

SELECT DISTINCT selectCity() AS city_id FROM city;
