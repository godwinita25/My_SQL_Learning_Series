#--- GROUP By ---
# --- It groups together rows that has thesame values in the specified columns you grouping on

SELECT *
FROM parks_and_recreation.employee_demographics
;

SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age), MAX(age), min(age), count(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age
;



