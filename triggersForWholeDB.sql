DROP TRIGGER IF EXISTS createStudent;
DELIMITER //
CREATE TRIGGER  createStudent
BEFORE INSERT ON student FOR EACH ROW 
BEGIN
IF((SELECT COUNT(*) FROM students.group WHERE id  =new.group_id) = 0) OR 
	((SELECT COUNT(*) FROM students.city WHERE id = new.city_id) = 0) OR
	((SELECT COUNT(*) FROM students.finishedschools WHERE id = new.finished_school_id) = 0)
	THEN SIGNAL SQLSTATE '45000'    
		SET MESSAGE_TEXT = 'CHECK error for Insert(not exist same foreigh key )'; 
END IF; 
END 
// DELIMITER ; 

DROP TRIGGER IF EXISTS createCity;
DELIMITER //
CREATE TRIGGER  createCity
BEFORE INSERT ON city FOR EACH ROW 
BEGIN
IF((SELECT COUNT(*) FROM students.region WHERE id = new.region_id) = 0)
	THEN SIGNAL SQLSTATE '45000'    
		SET MESSAGE_TEXT = 'CHECK error for Insert(not exist same foreigh key )'; 
END IF; 
END 
// DELIMITER ; 

DROP TRIGGER IF EXISTS createFinishedSchool;
DELIMITER //
CREATE TRIGGER  createFinishedSchool
BEFORE INSERT ON finishedschools FOR EACH ROW 
BEGIN
IF((SELECT COUNT(*) FROM students.city WHERE id = new.city_id) = 0)
	THEN SIGNAL SQLSTATE '45000'    
		SET MESSAGE_TEXT = 'CHECK error for Insert(not exist same foreigh key )'; 
END IF; 
END 
// DELIMITER ; 

DROP TRIGGER IF EXISTS deleteFromGroup;
DELIMITER //
CREATE TRIGGER deleteFromGroup
AFTER DELETE ON students.group
FOR EACH ROW 
BEGIN 
DELETE FROM student 
WHERE student.group_id = OLD.id ; 
END
// DELIMITER ;

DROP TRIGGER IF EXISTS deleteFromFinishedSchools;
DELIMITER //
CREATE TRIGGER deleteFromFinishedSchools
AFTER DELETE ON students.finishedschools
FOR EACH ROW 
BEGIN 
DELETE FROM student 
WHERE student.finished_school_id = OLD.id ; 
END
// DELIMITER ;

DROP TRIGGER IF EXISTS deleteFromRegion;
DELIMITER //
CREATE TRIGGER deleteFromRegion
AFTER DELETE ON students.region
FOR EACH ROW 
BEGIN 
DELETE FROM city 
WHERE city.region_id = OLD.id ; 
END
// DELIMITER ;

DROP TRIGGER IF EXISTS deleteFromCity;
DELIMITER //
CREATE TRIGGER deleteFromCity
AFTER DELETE ON students.city
FOR EACH ROW 
BEGIN 
DELETE FROM student 
WHERE student.city_id = OLD.id ; 
DELETE FROM finishedschools 
WHERE finishedschools.city_id = OLD.id ; 
END
// DELIMITER ;
