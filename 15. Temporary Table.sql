#--- Temporary Table
#--- (It only last as long as you're within its section, once you close the sql terminal, the temp_table stops working

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_song varchar (100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES ('Godwin','Ita','Love Yourz by J.Cole');

SELECT *
FROM temp_table;


CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k;


