#--- String Functions ---
#--- They are built in functions that helps us use strings differently

SELECT length('avatar');

select first_name, length(first_name)
from employee_demographics
ORDER BY 2;

select upper('avatar');
select lower('AVATAR');

select first_name, UPPER(first_name)
from employee_demographics;

#--- Trim
select TRIM('    AVATAR      ') AS Heading;

#--- Trim
select LTRIM('      AVATAR      ');

#--- Trim
select RTRIM('     AVATAR      ');

#--- Substring
select first_name,
left(first_name, 4),
right(first_name, 4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) as birth_month
from employee_demographics;

#--- REPLACE --- replace a character with a different character
select first_name, replace(first_name, 'a','x')
from employee_demographics;

#--- Locate
SELECT locate('i', 'Godwin');

select first_name, locate('AN',first_name)
from employee_demographics;

# ---Concat... Joins two or multiple colums to create one
select first_name, last_name,
concat(first_name , ' ', last_name) AS full_name
from employee_demographics;


















