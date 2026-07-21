#--- Case Statement
#--- allows you to add logic in your select statemnt (just like if and ifs

select first_name,
last_name,
case
	when age <= 30 then 'Young'
    when age between 31 and 50 then 'Old'
    when age >= 50 then 'Very Old'
end AS Age_Bracket
from employee_demographics;


#--- pay increase and bonus
#--- < 50000 = 5%
#--- > 50000 = 7%
#--- Finance = 10% bonus

select first_name, last_name, salary,
case
	when salary < 50000 then salary * 1.05
	when salary > 50000 then salary * 1.07
end AS New_Salary,
case
	when dept_id = 6 then salary * .10
end as Bonus
from employee_salary;





select *
from employee_salary;
select *
from parks_departments;
