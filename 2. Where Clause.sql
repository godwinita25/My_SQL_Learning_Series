#--- WHERE Clause ---
#--- Used to help filter records/rows of data

select *
from parks_and_recreation.employee_salary
where first_name = 'Leslie'
;

select *
from parks_and_recreation.employee_salary
where salary >= 50000
;

select *
from parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
;

#--- AND OR NOT --- Logical Operators ---

select *
from parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

select *
from parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male'
;

select *
from parks_and_recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) or age > 55
;
 
