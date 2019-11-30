USE students;

DROP TRIGGER IF EXISTS BeforeInsertRegionCode;
DELIMITER // 
CREATE TRIGGER BeforeInsertRegionCode  
BEFORE INSERT 
ON region FOR EACH ROW  
BEGIN  
    IF new.code NOT RLIKE '[:digit:]+'
		THEN SIGNAL SQLSTATE '45000'    
		SET MESSAGE_TEXT = 'CHECK error for Insert Code, not **(* is number)';    
        END IF;
    SET new.code = CONCAT(SUBSTR(new.name, 1, 1), new.code);
END //
DELIMITER ; 
 
INSERT INTO region(name, code) VALUES ('ee', '18');
SELECT * FROM region;