USE students;
CREATE TABLE IF NOT EXISTS `magazine`(
`id` INT NOT NULL AUTO_INCREMENT, 
`action` VARCHAR(255) NOT NULL, 
`timeStamp` VARCHAR(255) NOT NULL,
PRIMARY KEY (`id`));

DROP TRIGGER IF EXISTS AfterDeleteStudent;
DELIMITER // 
CREATE TRIGGER AfterDeleteStudent  
AFTER UPDATE ON student 
FOR EACH ROW 
BEGIN  
INSERT INTO magazine (action,  timeStamp)      
VALUES('update', NOW()); 
END // 
DELIMITER ; 
 