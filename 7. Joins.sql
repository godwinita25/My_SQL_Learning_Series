#--- JOINS ---
#--- It allows you to bind 2 tables or more together, if they have a common column (the data in it)

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
from employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
    ;
    
	#--- you can use alias to reduce the lenght of a word, 'AS' to replace a name 
SELECT *
from employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, age, occupation
from employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;    

 
#--- Outer Joins ---
 
SELECT *
from employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

#--- Self Join

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_name,
emp2.last_name AS last_name_name
from employee_salary emp1
join employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

    

    
    
    
    
    
    