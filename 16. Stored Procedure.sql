#--- Stored Procedures
#--- Are ways to save sql code to use over and over again


SELECT *
FROM employee_salary
WHERE salary >= 50000
;

call large_salaries();


DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries2();


#--- Perimiter
#--- Are variables that are passed as an input into a stored procedure
DELIMITER $$
CREATE PROCEDURE large_salaries3(p_employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = p_employee_id
    ;
END $$
DELIMITER ;

CALL large_salaries3(1);


