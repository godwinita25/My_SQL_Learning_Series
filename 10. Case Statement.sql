#--- Case Statement
#--- allows you to add logic in your select statemnt (just like if and ifs

SELECT first_name,
last_name,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN 'Very Old'
END AS Age_Bracket
from employee_demographics;


#--- pay increase and bonus
#--- < 50000 = 5%
#--- > 50000 = 7%
#--- Finance = 10% bonus

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
	WHEN salary < 50000 THEN salary * 1.07
END AS New_Salary
from employee_salary;










