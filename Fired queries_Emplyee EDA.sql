-- Data cleaning, Data modelling and EDA of Employee data.

SELECT * FROM employees_data.employee_backup

select Id, count(Id)-- EmployeeName, JobTitle
from employee_backup
group by Id

select *
from employee_backup
where BasePay=0 and OvertimePay=0 and OtherPay=0 and TotalPay=0 and TotalPayBenefits=0

select EmployeeName, JobTitle
from employee_backup




25:44 / 25:51


1. Data Analytics Using MySQL | MySQL (Case Study - 1) | Kaggle Dataset (SF Salary)

select *,
row_number() over(partition by EmployeeName, JobTitle)
from employee_backup

select lower(EmployeeName)
from employee_backup

with row_num as
(
select *,
row_number() over( partition by EmployeeName, JobTitle, BasePay,OvertimePay, OtherPay,Benefits, TotalPay, TotalPayBenefits,
`Year`, Notes, Agency, Status) as row_
from employee_backup
)
select *
from row_num
where row_>1;

select EmployeeName 
from employee_backup
set EmployeeName = upper(substring(EmployeeName,1,5)) and lower(substring(EmployeeName,2))

Update employee_backup
set EmployeeName = upper(substring(EmployeeName,1,1))

select EmployeeName
from employee_backup 
where lower(EmployeeName) in EmployeeName

select  EmployeeName
from employee_backup
where EmployeeName is null or JobTitle =''

describe employee_backup

select replace(OvertimePay,'0','N/A')
from employee_backup

select count(distinct(EmployeeName))
from employee_backup

select distinct(JobTitle)
from employee_backup

select EmployeeName, JobTitle,OvertimePay
from employee_backup
where OvertimePay>50000

select EmployeeName, avg(BasePay), avg(OvertimePay), avg(OtherPay)
from employee_backup
group by EmployeeName

select TotalPay
from employee_backup
order by TotalPay desc
limit 10

select EmployeeName, JobTitle
from employee_backup
where JobTitle not regexp 'Manager'

select EmployeeName, JobTitle
from employee_backup
where JobTitle not like '%Manager%'

select EmployeeName, BasePay, TotalPay
from employee_backup
where BasePay <=50000 or TotalPay>=100000

select JobTitle, avg(BasePay) as ag
from employee_backup
group by JobTitle
having avg(BasePay)>=100000
order by ag desc

select JobTitle, avg(BasePay) as ag
from employee_backup
where BasePay>=100000
group by JobTitle
order by ag desc

update employee_backup
set BasePay= BasePay*1.1
where JobTitle like '%Manager%'


select EmployeeName, BasePay, BasePay*1.1
from employee_backup
where JobTitle like '%Manager%'

alter table employee_backup
drop column Notes

select EmployeeName, OvertimePay
from employee_backup
where OvertimePay=0

delete from employee_backup
where OvertimePay=0