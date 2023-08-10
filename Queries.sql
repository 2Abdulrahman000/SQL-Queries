create database Mydb1
use Mydb1
--1st Question
create table Person(Person_ID int,Person_Name char(30),Birthdate int,[Address] char(34),primary key(Person_ID))

insert into Person values(1,'Abdo Elkabany',2000,'Mit Ghamer')

CREATE FUNCTION getage(@birth int)
returns int 
as
begin
declare @age int=2021-@birth 
return @age
end  

select dbo.getage(2000) as Age 
--2st Question
create table Student(Student_ID int,Student_Name char(40),Degree int,[Adress] char(44),primary key(Student_ID))

insert into Student values(1,'Abdo Goda',85,'Mt Ghamer')

CREATE FUNCTION sumdegree()
returns table
as 
return select sum(Degree) As Total from Student 

select * from dbo.sumdegree()
--3st Question
create table Emp(Emp_ID int,Emp_Name char(40),Salary int,[Adress] char(44),primary key(Emp_ID))

create procedure ins 
as
insert into Emp values(1,'Ali',2899,'Cairo')
GO

exec ins 
--4st Question
create table Person(Person_ID int,Person_Name char(30),Birthdate int,[Address] char(34),primary key(Person_ID))

insert into Person values(1,'Abdo Elkabany',4600,'Mit Ghamer'),(2,'Adel',2000,'Cairo'),(3,'Karim ElFawal',4500,'Menofia')

create function getpersons()
returns table
as
return select * from Emp

select * from dbo.getpersons()
--5st Question
create table Person(Person_ID int,Person_Name char(30),Birthdate int,[Address] char(34),primary key(Person_ID))

insert into Person values(1,'Abdo Elkabany',4600,'Mit Ghamer'),(2,'Adel',2000,'Cairo'),(3,'Karim ElFawal',4500,'Menofia')

create function numperson()
returns table
as
return select count(Person_ID) as [sum] from Person 

select * from dbo.numperson()
--6st Question
create table Person(Person_ID int,Person_Name char(30),Birthdate int,[Address] char(34),primary key(Person_ID))

insert into Person values(1,'Abdo Elkabany',4600,'Mit Ghamer'),(2,'Adel',2000,'Cairo'),(3,'Karim ElFawal',4500,'Menofia')

create procedure up_person @num_id int
as
update Person set Person_Name='Amr' ,Birthdate=1978,[Address]='ALex' where Person_ID=@num_id 
Go

exec up_person 2  
--7st Question
create table Person(Person_ID int,Person_Name char(30),Birthdate int,[Address] char(34),primary key(Person_ID))

insert into Person values(1,'Abdo Elkabany',4600,'Mit Ghamer'),(2,'Adel',2000,'Cairo'),(3,'Karim ElFawal',4500,'Menofia')

create procedure del_person @num_id int
as
delete from Person where Person_ID=@num_id 
Go

exec del_person 3   
--8st Question
create table Student2(Student_ID int ,Student_Name char(50),Age int ,[Address] char(50) primary key(Student_ID))

insert into Student2 values(1,'ALi',15,'Cairo'),(2,'Amr',18,'Mansoura'),(3,'ALi',15,'ALex')

create procedure handleError
as
 begin try
 print 1/0
 end try
 begin catch
 print 'Error'
 end catch
GO

exec handleError
--9st Question
create table Student2(Student_ID int ,Student_Name char(50),Age int ,[Address] char(50) primary key(Student_ID))

insert into Student2 values(1,'ALi',15,'Cairo'),(2,'Amr',18,'Mansoura'),(3,'ALi',15,'ALex')

create trigger del_occour on Student2 instead of delete
as
print 'You can not delete'

delete from Student2 where Student_ID=1 select * from Student2
--10st Question
create table Student2(Student_ID int ,Student_Name char(50),Age int ,[Address] char(50) primary key(Student_ID))

insert into Student2 values(1,'ALi',15,'Cairo'),(2,'Amr',18,'Mansoura'),(3,'ALi',15,'ALex')

create trigger up_occour on Student2 after update
as
print 'Update Successed !!!'
update Student2 set Student_Name='Essam' where Student_ID=3  
--11st Question
create table Users([User_ID] int,[Password]char(44),primary key([User_ID]))

insert into Users values (1,'Abdo1234') , (2,'ALi1234') , (3,'Goda1234')

create procedure checkpassword @id int,@pass char(44)
as
if exists (select * from Users where [USER_ID]=@id And [Password]=@pass)
print 'true'
else
print 'false'
Go

exec checkpassword 3,Goda1234
--12st Question
create table Emp2(Emp_ID int,FirstName char(40),LastName char(40),City Char(40),primary key(Emp_ID))
create table Salaries(S_ID int,Salary int,Phone int,Emp_ID int)

insert into Emp2 values(1,'Ahmed','Salim','Mans'),(2,'Asmaa','Metwally','Cairo'),(3,'Amer','Adel','Tanta') 

insert into Salaries values(1,2000,111111,3),(2,3500,222222,3),(3,4000,333333,1),(4,1500,444444,1),(5,3200,555555,7)

--inner join
--Genral Syntax-->select columns from table1 join table2 On Table1.Id = Table2.ID
--table1 inner join table2=table1 join table2
select Emp2.FirstName,Emp2.LastName,Salaries.Salary
from Emp2 inner join Salaries ON Emp2.Emp_ID = Salaries.Emp_ID

--Left Join
select Emp2.FirstName,Emp2.LastName,Salaries.Salary 
from Emp2 left Join Salaries On Emp2.Emp_ID = Salaries.Emp_ID

--Right Join
select Emp2.FirstName,Emp2.LastName,Salaries.Salary
from Emp2 right join Salaries On Emp2.Emp_ID = Salaries.Emp_ID

--Full Join
select Emp2.FirstName,Emp2.LastName,Salaries.Salary
from Emp2 full join Salaries on Emp2.Emp_ID = Salaries.Emp_ID