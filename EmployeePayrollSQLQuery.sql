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