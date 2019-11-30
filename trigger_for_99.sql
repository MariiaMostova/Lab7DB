USE students;
DELIMITER // 
CREATE TRIGGER BeforeInsertStudent  
BEFORE INSERT ON student 
FOR EACH ROW  
BEGIN  
	IF (new.student_id RLIKE '[99]*')   
	THEN SIGNAL SQLSTATE '45000'    
		SET MESSAGE_TEXT = 'CHECK error for Insert';     
END IF; 
END 
// DELIMITER ; 
 