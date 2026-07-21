#--- SELECT Statement ---
#--- Used to select/filter columns and specify what columns you want to see in your output ---
#--- Always put your data base name in front of your table name ---

select *
from parks_and_recreation.employee_demographics;

select first_name
from parks_and_recreation.employee_demographics;

select first_name, last_name, age, age + 10
from parks_and_recreation.employee_demographics;

# PEMDAS
select first_name, 
last_name, 
age, 
(age + 10) * 10 + 10
from parks_and_recreation.employee_demographics;

select distinct first_name, gender
FROM parks_and_recreation.employee_demographics;











