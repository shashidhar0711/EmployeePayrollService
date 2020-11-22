/*UC1 Creating employee payroll sevice data base*/
Create database Payroll_Service;
use Payroll_Service;

/*UC2 Creating employee payroll table*/
create table Employee_Payroll(
Id int primary key identity(1,1),
Name varchar(20) not null,
Salary money not null,
Start date not null 
);

/*UC3 Insert data in to employee payroll*/
insert into Employee_Payroll values('Shashidhar',1000.00,'2019-08-28')
insert into Employee_Payroll values('GopiKrishna',7000.00,'2018-05-18')
insert into Employee_Payroll values('RaviKumar',4000.00,'2019-09-21')
insert into Employee_Payroll values('LalithKumar',3000.00,'2019-07-16')
insert into Employee_Payroll values('Supriya',4500.00,'2019-12-22')

/*UC4 Retrieve all data from employee payroll*/
select * from Employee_Payroll;


/*UC5 Able to retrieve the employee payroll between data range 
  Able to retrieve the data base on the condition*/
select * from Employee_Payroll where start between cast('2019-01-01' as date) and SYSDATETIME()
select Salary from Employee_Payroll where Name ='RaviKumar';

/*UC6 Able to add gender column in payroll table 
  Using alter table command
  Update into row with details*/
Alter table Employee_Payroll Add Gender char(1)
select * from Employee_Payroll
update Employee_Payroll set Name='PraveenKumar',Salary=2500.00,Gender='M' where Id=2;
update Employee_Payroll set Gender='M' where Id=5;
update Employee_payroll set Gender = 'F' where Id = 6;

/*UC7 Able to find sum,average,minimum,maximum,Count*/
select sum(Salary) from Employee_Payroll where Gender='M' group by Gender;
select Avg(Salary) from Employee_Payroll where Gender='M' group by Gender;
select Min(Salary) from Employee_Payroll where Gender='M' group by Gender;
select Max(Salary) from Employee_Payroll where Gender='F' group by Gender;
select Count(Salary) from Employee_Payroll where Gender='F' group by Gender;

/*UC8 Added extra columns ie department,phoneNumber,address*/
Alter table Employee_Payroll Add Department Varchar(100) null default 0, PhoneNumber Varchar(200) null default 0, Address Varchar(100) null default 0 

Update Employee_Payroll set Department = 'Marketing',PhoneNumber = '8073112156',Address = 'Gowtham nagar' where name = 'Shashidhar'
Update Employee_Payroll set Department = 'Sales',PhoneNumber = '9073112156',Address = 'Vijay nagar' where name = 'RaviKumar'
Update Employee_Payroll set Department = 'Bussiness',PhoneNumber = '7073112156',Address = 'Vivekanandha nagar' where name = 'LalithKumar'

/*UC9 Extended some columns*/
alter table Employee_Payroll Add Basic_Pay money null default 0,  Deductions money null default 0, Taxable_Pay money null default 0, Income_Tax money null default 0, Net_Pay money null default 0

/*UC10 Ability to make terissa as part of sales and marketing department*/
insert into Employee_Payroll(Name,salary,Start,Gender,Department,PhoneNumber,address,Basic_Pay,Deductions,Taxable_Pay,Income_Tax,Net_Pay) 
values('Terissa','200000.00','2019-01-13','F','Sales and Marketing','Newyork','9986712839',20000,2000,1000,800,18000);

/*UC11 Implementing a  ER diagram */
/*Created employee roll table*/
create table EmployeePayroll(
EmployeeId int primary key identity(1,1),
FullName varchar(20) not null,
StartDate date not null,
Gender varchar(20) not null,
Address varchar(100) not null,
DepartmentNumber int not null,
PhoneNumber bigint not null, 
);

/*Insert values in to Employee payroll table*/
insert into EmployeePayroll values('Shashidhar','2020-11-21','M','Bangarpet','001','8073112156')
insert into EmployeePayroll values('Lalithkumar','2020-10-21','M','Bangalore','002','7073112156')

select * from EmployeePayroll
select * from Department
select * from Salary

/*Created department table*/
create table Department(
DepartmentNumber int primary key identity(1,1), 
DepartmentName int not null,
Location varchar(50) not null,
EmployeeId int foreign key references EmployeePayroll(EmployeeId)
);

/*Insert values in to department values*/
insert into Department values('Computer science','Bangalore',1)
insert into Department values('Electrical engg','Banarpet',2)

/*Created salary table*/
create table Salary(
SalaryId int primary key identity(1,1),
BasicSalaryPay money not null,
Deductions money not null,
Taxable_pay money not null,
Income_tax money not null,
Net_pay money not null,
EmployeeId int foreign key references EmployeePayroll(EmployeeId)
);

/*Insert values in to salary table*/
insert into Salary values(10000,1000,1500,2500,900,1);
insert into Salary values(20000,2000,2500,3500,1900,2);

/*UC12 Retrieves from multiple table*/
/*Refactor by UC4*/ 
select * from EmployeePayroll;
select * from Department;
select * from Salary;

/*Refactor by UC5*/
select BasicSalaryPay 
from Salary INNER JOIN EmployeePayroll
on Salary.EmployeeId = EmployeePayroll.EmployeeId
where FullName = 'Lalithkumar';

/*Refactor by UC6*/
select * from EmployeePayroll
where StartDate between cast('2020-01-01' AS DATE) and SYSDATETIME();

/*Refactor UC 7*/
/*To find sum of all salary*/
select sum(BasicSalaryPay) as 'Sum Of All'
from Salary INNER JOIN EmployeePayroll 
on Salary.EmployeeId=EmployeePayroll.EmployeeId
where Gender='M' group by Gender;

/*To find average salary*/
select avg(BasicSalaryPay) as 'Average Salary'
from Salary INNER JOIN EmployeePayroll 
on Salary.EmployeeId=EmployeePayroll.EmployeeId
where Gender='M' group by Gender;

/*To find minimum salary*/
select min(BasicSalaryPay) as 'Minimum Salary'
from Salary INNER JOIN EmployeePayroll 
on Salary.EmployeeId=EmployeePayroll.EmployeeId
where Gender='M' group by Gender;

/*To find maximum salary*/
select max(BasicSalaryPay) as 'Maximum Salary'
from Salary INNER JOIN EmployeePayroll 
on Salary.EmployeeId=EmployeePayroll.EmployeeId
where Gender='M' group by Gender;

/*To find count of all salary*/
select count(BasicSalaryPay) as 'Number of Count' 
from Salary INNER JOIN EmployeePayroll 
on Salary.EmployeeId=EmployeePayroll.EmployeeId
where Gender='M' group by Gender;