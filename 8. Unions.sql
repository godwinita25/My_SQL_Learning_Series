#--- Unions ---
#--- It allows you to combine rows together, by taking one select statement and combining it with another select statement

#--- This will show only the Distinct first_name ansd last_name from both table
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;

#--- This will show all the Distinc first_name ansd last_name from both table, irrespective of duplicates
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;


SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Staff' AS Label
from employee_salary
where salary > 70000
order by first_name, last_name
;















