#--- Triggers and Event ---
#--- Trigger is a block of code that execute automatically when an event takes place on a specific table

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

#--- Delimiter helps incase you have multiple lines of code while creating a trigger
DELIMITER $$
CREATE TRIGGER employee_insert
#--- what needs to happen for the trugger to happen
	AFTER INSERT ON employee_salary
	FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

#--- Lets test the trigger
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Godwin', 'Ita', 'Analyst/Support', 100000, NULL);


#--- Events
#--- An event takes place when its scheduled

SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 20 SECOND
#--- typically it could be every one month or every year, the 20 seconds is just for testing
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

#--- Just incase you event doesnt work
SHOW VARIABLES  LIKE 'event%' ;



