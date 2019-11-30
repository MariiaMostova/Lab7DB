USE `students`;
DROP PROCEDURE IF EXISTS inserting;
DELIMITER // 
CREATE  PROCEDURE inserting(
 IN in_name VARCHAR(255),
 IN in_director_phone INT, 
 IN in_director_name VARCHAR(255)) 
BEGIN INSERT INTO finishedschools(name, director_phone, director_name)
VALUES(in_name, in_director_phone, in_director_name);
 END 
 // DELIMITER ; 
 
CALL inserting('СЗШ1', 0986786867, 'Кузь К.К.');
CALL inserting('СЗШ13', 0975657677, 'Моль О.О.');
CALL inserting('СЗШ98', 0686756565, 'Молодець Л.Ю.');