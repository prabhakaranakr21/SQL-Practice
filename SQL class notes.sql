
Day 1
Topics - Data, Data engineer, Data engineering, Process, ETL, ELT, ETLT

---Data---
-- Raw fact of information

--types
1. structured - data easily understandable eg.,Excel or database table
2. semi-structured - basic understand but not in proper structure eg., Json, xml
3. unstructtured - cannot understanble by humans, no definite format eg., audio, video, photos

Data engineer: Trasferring semi/unstucture data to a structured
Formats in data: excel, csv, test, jason, parquet, delta

Data enginerring:
Collecting, storaging, transforming(even changing case in word is tranformation) or processing data
Data  -- clean or unclean
Changing unclean data into clean
CODING : SQL, Pyspark(python)


Data Engineer process: 99% mostly ELT

ETL - Extract Transform and Load (suitable for small volume of data)
Exract----data source ---- central repository (bringing data from source and to another place)
mostly in on prem - installed in a device like app/software


		extract						transform									Load
source ---------- central repository--------data processing/data trasformation-------target
doing transformation before going to target since source is  not proper/unclean


ELT - Extract Load Transform (suitable for large volume of data)
transferring(LOAD) large data after transformation - error possibility is high), so first Load and then Transform
in Cloud - online


ETLT - Extract Light transform -- Load --	Weight Trasnform
eg., 1 million record if loaded first(ELT), time is waste, so before loading filtering is done and removing unwanted data, then load again --- main transform


---------------------------------------------------------------

Day 2 
Topics - SQL Basics, Types of Database, RDBMS and Non RDBMS, 
RDBMS : Primary key & Foreign key, SQL server structure
On prem vs cloud


SQL - Stuctured Query Language
it is a language that humans to ijnteract eith database
tools: SQL Server, MySQL, Oracle SQL, Postgre

Database : 2 types
RDBMS & Non RDBMS 

RDBMS - Relational Database Management system
	  -	Set of table - interlinked, I can establish 
	  - Proper structure

Non-RDBMS - Storing big data. eg., MangoDB
		  - streaming data - real data eg., cricket scorecard, stock market price
		  -	not for analyzing


RDBMS 
	Key  --- Relationship For connecting 2 tables
1. Primary Key - whenever a row is created in a a table, that row should be uniquely identifiable by something
			   - it is a column which is used to uniquely  identify a row in a table	(mandatory)
			   - primary key created to avoid ambiquity(idenitical rows) problem comes, to to proper analyse and come up with proper  decision
			   

2 Foreign Key - it is added to a table to ESTABLISH RELATIONSHIP WITH OTHER TABLES


SQL: On prem --server name/power - based on laptop/device
Server → Database → Schema → Objects

1st level : Server 
	- The machine or server environment where SQL Server runs.
	- One server can contain multiple databases.

2nd level : Database  
	- A container that stores database objects.
	- One database can contain multiple schemas.

3rd level : Schema  
	- dbo - Organizes tables and objects like a folder CLASSIFICATION of your tables
	- eg., LIKE A folder ie., HR and Sales schemas can contain tables such as Employee, Salary, and Payroll.
			All tables is attached to a schema, if a table is created without giving schema, it created under default schema - dbo
4th level : Objects
	- Tables, view, stored procedure

On prem		
	- SQL Server installed/managed on your computer or organization server
	- scope is only upto the device
Cloud   
	- No local installation needed.
	- Scope: Access via internet, from anywhere. eg: Azure, AWS

In SQL
Rows - Record
Field - COlumn

----------------------------------------------------------------------------------

Day 3

default database: Master
default Schema : dbo

comments in sql : hyphen (-) or /* */
how to distinguish multiple query line : by semicolons (;)

--Creating database
create database d3;

--Creating Schema
create schema s3;
	- even if schema is created it cant be viewed in object explorer bcs schema is attached to a table
	- only after creating table schema is viewable

--Creating Table
create table d3.s3.t3

when createing table, proper address should be given
	- Table: database.schema.tablename
	-	if these details not given, table will be created in default database/schema name ie.,dbo
	-	Maximum real time - we will avoid creating schema unless it is required

SQL is a language
words : commands
sentence : query

Types of commands - 5

DDL - Data Definition Languauge
DML - Data  manipulation Language
DQL - Data Query Language
TCL - Transactiion Coantrol Language
DCL - Data Control Language

what we do on Database: read and write
Write : DDL and DML
Read : DQL
Secutity : TCL and DCL

DDL commands: 
	--- create, alter, drop, truncate
	-	helpful in creating, modifying or delecting the objects

datatype : what type of data is need to be in column eg.,numbers(int), words(varchar)
			in varchar need to specify maximum characters(in numbers) to be displayed in that column. eg., for Name column : varchar(50) - maximum 50 chartacter in that column

1st : CREATE table
Synatx: Create table "name"( 
column1 datatype,
column1 datatype,
column1 datatype)

use d3
Create table s3.t3( 
ID int,
Name varchar(100),
Age int,
deaprtment varchar(50),
)

2nd : ALTER table --- (add or delete or modify a column) 

Syntax
alter table s3.t3
add columnname;
alter column column name;
drop column column name

----eg., adding a new column : dept id 
alter table s3.t3
add dept_id int;

----eg., modifying a column
alter table s3.t3
alter column department varchar (20)

----eg., deleting a column
alter table s3.t3
drop column department

----eg., delete the entire table
drop table s3.t3new


(in add no need to mention the word column, but in drop and modity we need to mention the word column before the column name eg.,--drop column department)

Renaming column - syntax
EXEC sp_rename 'schemaname.tablename.old column name', 'new name', 'COLUMN';
EXEC sp_rename 's3.t3.deaprtment', 'department', 'COLUMN';

DDL vs DML
DDL : about table structure
DML	: about table data

DML : --- insert, update, delete
	  -	after creating tabke how to give data, update data, delete data 

SYNTAX:
---- insert into "table name" (column1, column2, column3)
values
(v1,v2,vv3);

insert into s3.t3 (ID,name,age,department)
values
(101,'Ravi',24,'CSC'),
(102,'Ramesh',35,'IT'),
(103,'mahi',25,'FIN'),
(104,'suresh',25,'IT'),
(105,'vinay',25,'FIN')

select * from s3.t3

------ updating a record(row)
update s3.t3
set Name = 'Prabha'
where ID = 104

------ delecting a record(row)
delete s3.t3
where id is null


and department ='fin'
and name is null
and age is null


insert into s3.t3 (ID,name,age)
values (105,'vinay', 34)

update s3.t3 
set department = 'fin'
where id=105

select * from s3.t3
Select name, department from s3.t3

-----------------------------------------------------------------------------------------

Day 4

Topics
1.Datatypes
2.Constraints
3. Trunculate,delete,drop

------ I Data Types SQL------

Data types defines what kind of data a column can store.
Types
1.Numeric
2.String
3.Data & Time, 
4.Boolean

Numeric -- int,bigint,smallint, decimal(5,2), float
		- int,bigint,smallint : rounded values eg; 1,2,3
		- decimal, float : pointed values ed., 1.2, 1.3
		
		Float : numBers after point no condition, as per source eg., 1.2,1.2222, 1.2366464
		deciaml : putting limit on numbers after point(.)
		eg., decimal(5,2) 122312.6454132133 = 122312.64
		decimal (maximum	no of digits before point , values after point)

String/words -- varchar(how many characters), char(how many characters), text
unique code -- nvarchar - numeric varchar(how many characters) supports multiple language eg., chinese characters, Tamil

Date/Time ---- datetime, date, time, timestamp

Boolean ---- syntax bit, boolean
	- means a value that has only two answers: True/False, Yes/no - 1/0 (1-true, 0-false);
	- yes/no column is called flag column 

*All Examples *
CREATE TABLE DataTypesDemo
(
    id INT,
    small_num SMALLINT,
    big_num BIGINT,
    price DECIMAL(5,2),
    measurement FLOAT,
    gender CHAR(1),
    name VARCHAR(30),
    native_name NVARCHAR(50),
    event_date DATE,
    start_time TIME,
    created_at DATETIME,
    is_active BIT
);

INSERT INTO DataTypesDemo
VALUES (1, 100, 9000000000, 123.45, 1.2345,
        'M', 'Ravi', N'தமிழ்',
        '2026-10-18', '09:30', '2026-10-18', 1);

SELECT * FROM DataTypesDemo;

*****************************


----- II Constraints ------
- Rules applied to a table or column to control what data can be stored in SQL Server
- it helps in ensuring data cleanliness

Types
1. Unique - no duplicate
2. Null/Non Null - to avoid entering null in a column
3. Default - user not entered - keep some default value
4. Check - to check and allow a avalue into a column eg., age >=18>(check age >=18), phone number length (len phonenumber = 12)
5. Primary Key - combination if null and unique
6. Foreign Key - to establish a relationship

- Note: dont give unnecessary constraints bcs it slowenn loading speed(write)
- eg., Name varchar(30) len>30


Foreign key
-- syntax ---
create table name(
foreign key (column in this table)
references other tablename (other table column name)

--eg.,--

CREATE TABLE Department (
    department_id INT PRIMARY KEY
);

CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(30) UNIQUE,
    city VARCHAR(30) DEFAULT 'Not entered',
    age INT CHECK (age >= 18),
    email VARCHAR(100) NOT NULL,
    department_id INT FOREIGN KEY
        REFERENCES Department(department_id)
);

CREATE TABLE Department (
    department_id INT PRIMARY KEY
);

CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(30) UNIQUE,
    city VARCHAR(30) DEFAULT 'Not entered',
    age INT CHECK (age >= 18),
    email VARCHAR(100) NOT NULL,
    department_id INT FOREIGN KEY
        REFERENCES Department(department_id)
);



*****************************************************

select * from constraints
drop table constraints

---- III. Truncate vs delete vs drop : Important interview question -----


Truncate: DDL
1. it comes under DDL bcs it deletes both memory allocation and data
1. it always deletes all records
2. it also deletes the memory alloaction/memory seed
4. cannot be rollback

eg., in a table there is a basket of orange, if i truncate orange it will remove orange along woth basket whereas delete option removes only the orange


Delete: DML
1. we can either delete a specific records or else delete all records
2. only data is deleted but memory remains
3. can be rollback

delete from constraints
where id = 3

truncate from constraints
where id = 2


----------------------------------------------------------



Day 5

Topcs:
TCL :Begin/Rollback/Commit/Save
DCL: Grant/Deny/Revoke 
DQL: Select/Selct Top/Filtered selct : text(like %), number (<, >, <>,<=,>=)

Data Control Language - Security related

Command: GRANT, DENY, REVOKE

Company manintaing a database and giving access to others eg., employees, founder, students, HR

URbancode: Database

1. employees
2. Students
3. Course
4. HR
5. Accounts

Database: employee, students, owner, co founder

Students — Visibility – -low
Employed — more Visibility
Owner - Full Visibility

We are going to protect data by roles or permissions

Student
Command operation on tablename to username
GRANT select on course to student
DENY/REVOKE delete on course to student


Read Access: Select
Write : insert, update, delete


TCL Transaction Control Language - Query Related Security
Like UNDO

If aN update/change is done in SQL without TCL, cannot undo

Eg,., in employee table change the age of ID 101 from 25 to 30
After change that if they asked to undo it, .ie., go back to the old one (age 25), this cant be done in SQL by undo



IT environment:
Database: 3 copies
1st copy --  Development , 2nd copy --Test/UAT,  3.rd copy – Production(Customer facing) 
 
When working with production — write–TCL and Write

BEGIN TRANSACTION
COMMIT TRANSACTION - Permanent save
ROLLBACK TRANSACTION (Undo) the query action by rollback
SAVE


Eg,., in employee table change the age of ID 101 from 25 to 30
After change that if they asked to undo it, .ie., go back to the old one (age 25)

BEGIN transaction
update employee_2 set age = 30 where employeeid=2
ROLLBACK transaction

Once BEGIN Transaction given, we need to give either ROLLBACK or COMMIT

COMMIT Transaction - permanent save

Frist Rollback , then COMMIT
ROLLBACK cannot be give after COMMIT

When working in production environment always do with TCL

Interview question: I am asking you write a query in Production, so what are all the steps you will take

Answer: Before proceeding with any kind of 	 DML commands in production, i will first do a TCL, 
bcs since its a production environment i need to be very carefull with the data. So I will always do a TCL command and i will write the query. 

SAVE - if we doing multiple updates inside one transactions, we can save the one which is correct

Update 2 employee details but second one is wrong and they asked to undo, 
First the SAVE the correct one and ROLLBACK the WRONG ONE
BEGIN transaction
update employee_2 set age = 30 where employeeid=2
SAVE transaction SP_1:

update employee_2 set age = 25 where employeeid=3

ROLLBACK transaction for SP_1, 
then
COMMIT transaction for


DCL interview question: I have 5 different users, they are all use same database, i want to restrict the data, how can i achieve it.

Answer: TO do this we have commands like DCL basically called as Data Control Language, 
I can choose the user and i can give the proper roles to them by using the keywords GRANT, REVOKE

--- III DQL - Data Query Language ----
Data reading in SQL: 90% DQL : SELECT must in DQL, without sekect no DQL

1.Understand the quesiton or usecase
2. fin the solution in English
3. Translate to SQL

-- how to read data
SeLect * from tablename
SeLect * from s3.t3, 
--- * --- all rows and columns

-- restrict no.of records
select top 5 * from s.t3

-- restrict the columnns
select columname, columnname from tablename


---- filtered select:
---filter: where
whrere columnname conditoinsymbol condition
--give employee whose age is ggreater thann 30
select * from s3.t3
where age>30

numeric: <, >, <>, <=, >=
not equal to : <> , !=

employees age not equal to 25

select * from s3.t3
where age<>25


--- tecxt based filtering
eg., employeed whose department is Finance
where department = Finance

string --- space is a character, so give carefully in sql,
finance - 7 characters
 finance - 8 characters

--- Pattern matching
--- Keyword - Like
--- placeholder - %
 eg., where empllyee name ends with a
 where employeename Like '%a'

 Multiple filter in a column
 eg., give employeed whose department is IT or Finance or HR
 where department in ('IT', 'Finance','HR')

 ---------------------------------------------------------------------------

Day 6
Topics
DQL
Individual filter :  Where
Aggregation fundtion : sum, min, max, avg, count
aggreagtion by group: group by
group filter: having
 

 Agrregation: Normal aggreagation - Sum, min,max,count,avg
 aggreagetion by group ; total salary for each city
 group filter: total salary for each department greater than 40000 - having


--- Multiple filter condition

--list enployees whose salary is lower than 70000 or city should be in chenai or hyderabad or age should be atleast 24
select * from employee
where salary <70000
or City in(chennai, hyderabad)
or age >=24

---- SORTING ----
Syntax:
Ascending - Order by
Descending - Order by desc

Aggregation: lot of rows --- small no of rows
mean or average
types: sum, min, max, count, avg

eg., find total no of 1.employees working/ 2.average salary
select count(employeeid) from tabelname
select avg(salary) from tabelname

IMPORTANT: count (*), count(col) - column
Count(*)   - it will count all records including null
count(col) - it will count only non-null records
Which is faster - Count(*), bcs no checking is done, it shows all records

ie., if the records have NULL, it will not show in Count(col) but will show in Count(*)

--AGGREGATION BASED on GROUPs
--- we need to create a group --- group by

1. eg., find total salary of employees for each department / department wise

select department, sum(salary) as total slalry
form employee
group by department

2. find no of employees in each departmenet
select department count(employeeid)
from employees
group by department

3. find no of employees in each city
select city count(employeeid)
from employees
group by city


--FILTERING AGGREGATION by GROUPs
--GROUP FILTER - Having - 

1. find no of employees in each city where employee count is atleast 5
select city count(employeeid)
from employees
group by city
having count(employeeid) >=5

2. find total slary for each department grater than 1laks
select department sum(salary)
from employees
group by department
having sum(salary) >=i lakh

--CONDITION: aggregation filter WHERE does not come, only HAVING will come

3.find cities whose avg salary is greater than 40000
select city avg(slry) as no of avg salary
from employees
group by city
having avg(slry) > 40000

--ALIAS concep---
--order of execution
--- from ---where --- group by ---having --- selct --- 

dont use Alias in having filter eg.,having avg(slry) > 40000 as average salary

Interview question: why alais is only recognising in where and not recognisinf in having
answer: there is order of execution in SQL, --- from ---where --- group by ---having --- selct ---order by.
as per that select is before order by, alias name will be created, so that we can utilise it in only order by, whereas in having it is not recognised

exmaple:1
find avg slary by each departmenmt, for employees aged abouve 25
display only departmetn withj an avg saly aabove 45000
sorter by avg salary descending

selct department, avg(slry) as average salary
from employees
where age>25
group by department
having avg(sal) >45000
order by avg(sal) desc

example 2:
for employeeds older tthan 30, find the number of employeess in each department, sport by employees count from hightest to lowest
select department, count(employeeid)
from emploees 
where age>30
group by  department
order by count(employeeid) desc




------------------------------------------------------------------------------------


Day 7

Joins























