USE `students`;

DROP PROCEDURE IF EXISTS insert_package;
DELIMITER // 
CREATE  PROCEDURE insert_package( 
IN in_name varchar(25) ) 
BEGIN
DECLARE a INT Default 1 ;
  my_loop: LOOP         
     INSERT city(name) values(CONCAT(in_name, a));
	 SET a=a+1;
	 IF a=11 THEN
		LEAVE my_loop;
	 END IF;
   END LOOP my_loop;
 END 
 // DELIMITER ; 
    