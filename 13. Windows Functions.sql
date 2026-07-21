#--- Windows Functions
#--- Allows us to look at a partition while they each keep their own uniques rows in the output

select gender, avg(salary) as avg_salary
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
;

#--- Use window function ---
select dem.first_name, dem.last_name, gender,
sum(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;

#--- Rolling Total
select dem.employee_id, dem.first_name, dem.last_name, gender, salary,
sum(salary) over(partition by gender order by dem.employee_id) as Rolling_Total
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;

#--- Row Number / Rank /Dense_Rank
select dem.employee_id, dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_num
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;




