USE students;

DROP PROCEDURE IF EXISTS create_student_arears;
DELIMITER // 
CREATE PROCEDURE create_student_arears()
BEGIN 
DROP TABLE IF EXISTS `students`.`student_arrears`;
CREATE TABLE `students`.`student_arrears` (
  `student_id` INT(11) NOT NULL,
  `subject` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`student_id`, `subject`),
  INDEX `fk_student_has_arrears_arrears1_idx` (`subject` ASC) VISIBLE,
  INDEX `fk_student_has_arrears_student_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_arrears_student`
    FOREIGN KEY (`student_id`)
    REFERENCES `students`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_arrears_arrears1`
    FOREIGN KEY (`subject`)
    REFERENCES `students`.`arrears` (`subject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO student_arrears(student_id, subject) 
VALUES((SELECT student_id FROM student LIMIT 1),(SELECT subject FROM arrears LIMIT 1));
SELECT * FROM student_arrears;
END
 // DELIMITER ; 
 
CALL create_student_arears();
