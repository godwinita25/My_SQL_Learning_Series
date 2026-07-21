#--- Limit & Aliasing
#--- It specifies how many rows you want in your output

SELECT *
FROM employee_demographics
LIMIT 4
;

#--- It can also be combined with ORDER BY

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

#--- Aliasing

SELECT gender, avg(age) avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40
;


