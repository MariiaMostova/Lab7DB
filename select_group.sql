DROP FUNCTION IF EXISTS selectGroup;
DELIMITER //
CREATE FUNCTION select_group()
RETURNS VARCHAR(25)
READS SQL DATA
DETERMINISTIC
BEGIN
	RETURN (SELECT CONCAT(name, number) AS group_number FROM students.group LIMIT 1);
END //
DELIMITER ;

SELECT student_id, first_name, last_name, post_name, rating, birthday, start_date, select_group() AS group_name FROM student;
