#--- LIKE Statement ---
#-- % and _ ('%' means anything and the '_' means a specific value)

SELECT *
from parks_and_recreation.employee_demographics
WHERE first_name LIKE 'jer%'
;

SELECT *
from parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a%'
;

SELECT *
from parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a__'
;

SELECT *
from parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1983%'
;

