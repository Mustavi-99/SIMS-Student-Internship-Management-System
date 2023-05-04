---Project Name:Student Internship Management System
---Name:Yumna Islam (ID-180204046)
---Name:Farhana Azad (ID-180204068)
---Name:Mustavi Ibne Masum (ID-180204040)
---Group-A2

CREATE DATABASE STUDENT_INTERNSHIP
--FacultyLoginId number generated always by AS identity
CREATE TABLE FACULTY_LOGIN
(
FacultyLoginId int Not null,
FacultyName varchar(100) NOT NULL,
FacultyPassword varchar(50) NOT NULL
)
drop table faculty_login;
INSERT INTO FACULTY_LOGIN VALUES(1,'EEE','05');
INSERT INTO FACULTY_LOGIN VALUES(2,'CSE','04');
INSERT INTO FACULTY_LOGIN VALUES(3,'ME','07');

--select * from FACULTY_LOGIN
--drop table FACULTY_LOGIN
-----INTERNSHIP_DETAILS table
CREATE TABLE INTERNSHIP_DETAILS
(
--InternId int NOT NULL,
StudentRegisterId int NOT NULL  ,
InternshipTitle varchar2(50)  NULL ,
InternshipEmployer varchar2(50) NULL,
InternshipDescription varchar2(500) NOT NULL,
Internshipstartdate date,
InternshipDuration int NULL,
Stipend float  NULL
)
-----Queries for INTERNSHIP_DETAILS table
INSERT INTO INTERNSHIP_DETAILS VALUES(1,3,'Agni','lallal','xyz', TO_DATE('20/10/2021','DD/MM/YYYY'),'six months',6000)
--SELECT * FROM INTERNSHIP_DETAILS
--select StudentName,StudentEmail,StudentAddress,DepartmentName,CurrentYear from INTERNSHIP_APPLICATION_FORM ia where exists(select 6 from INTERNSHIP_DETAILS id where Stipend>7000 and id.StudentRegisterId=ia.StudentRegisterId)
--SELECT * FROM INTERNSHIP_APPLICATION_FORM ia JOIN INTERNSHIP_DETAILS id on ia.StudentRegisterId = id.StudentRegisterId WHERE ia.StudentRegisterId=3  --input
--select c.CompanyName,c.NUmnerOfAllowableInterns,c.CurrentInterns,c.CompanyLocation from  COMPANY c JOIN  INTERNSHIP_DETAILS i ON c.CompanyName=i.InternshipEmployer where i.InternId =4
--select c.Vacancy from COMPANY c JOIN INTERNSHIP_APPLICATION_FORM i on c.CompanyName=i.CompanyPreference where c.CompanyName='titas gas'
--select FieldOfInterest,CompanyPreference,CGPA,DepartmentName,StudentAddress from INTERNSHIP_APPLICATION_FORM where StudentRegisterId=4
--SELECT * FROM INTERNSHIP_DETAILS where StudentRegisterId IN (select StudentRegisterId from INTERNSHIP_APPLICATION_FORM  where CGPA>3.5 AND DepartmentName='ME')
-------INTERNSHIP_APPLICATION_FORM table
CREATE TABLE INTERN_DETAILS
(
StuRegId int NOT NULL,
DepartmentName varchar(50) NOT NULL,
CurrentYear NUMBER,
CONSTRAINT CHECK_CurrentYear
check(CurrentYear>=3),
CurrentSemester int NOT NULL,
CGPA float NOT NULL,
CompanyPreference varchar(200),
InternStatus varchar(50)  DEFAULT  'Not Approved'
)
INSERT INTO INTERN_DETAILS VALUES(1,'CSE',3,1,3.75,'Grameenphone','Not Approved');
INSERT INTO INTERN_DETAILS VALUES(2,'CSE',4,1,3.5,'Robi','Not Approved');
INSERT INTO INTERN_DETAILS VALUES(3,'CSE',3,1,3.84,'Airtel','Not Approved');
INSERT INTO INTERN_DETAILS VALUES(4,'CSE',3,2,3.79,'Agni','Not Approved');
INSERT INTO INTERN_DETAILS VALUES(5,'CSE',3,1,3.43,'BanglaCat','Not Approved');
INSERT INTO INTERN_DETAILS VALUES(11,'CSE',4,2,3.91,'Teletalk','Not Approved');


--SELECT * from INTERNSHIP_APPLICATION_FORM

-------Queries for INTERNSHIP_APPLICATION_FORM Table
--UPDATE  INTERNSHIP_APPLICATION_FORM set  InternStatus='Not Approved' where StudentRegisterId=1
--SELECT COUNT(StudentRegisterId) as 'totalstudents' FROM INTERNSHIP_APPLICATION_FORM  
--SELECT COUNT(InternStatus) as 'totalstatusapproved' FROM INTERNSHIP_APPLICATION_FORM  where InternStatus='Approved'
--SELECT COUNT(InternStatus) as 'totalstatusapproved' FROM INTERNSHIP_APPLICATION_FORM  where InternStatus='Not Approved'
--SELECT * from INTERNSHIP_APPLICATION_FORM ORDER BY CGPA DESC
--select * from INTERNSHIP_APPLICATION_FORM where DepartmentName='cse' and CGPA BETWEEN '3.5' and '3.8'  -----For Redistered student table
--select * from INTERNSHIP_APPLICATION_FORM where DepartmentName='cse'
--select * from INTERNSHIP_APPLICATION_FORM where CGPA='3.75'
--select * from INTERNSHIP_APPLICATION_FORM where CurrentYear='3'


CREATE TABLE STUDENT_DATA
(
StudentId int IDENTITY(1,1) PRIMARY KEY,
InternId int NOT NULL FOREIGN KEY REFERENCES INTERNSHIP_DETAILS(InternId),
)

----COMPANY table
CREATE TABLE COMPANY(
--CompanyId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
CompanyName varchar(50) NOT NULL,
NUmnerOfAllowableInterns int NOT NULL,
CurrentInterns int NOT NULL,
CompanyLocation varchar(50) NOT NULL
--Vacancy int NULL  
)
----Queries For Company table
--Select * from COMPANY where CompanyName='Grameenphone' 
--Select * from COMPANY where CompanyLocation='Dhaka' 
--update COMPANY set Vacancy=NUmnerOfAllowableInterns-CurrentInterns
--Select *From COMPANY order by vacancy desc
--delete  from COMPANY  where vacancy=0
--Select * from COMPANY
INSERT INTO COMPANY VALUES('Agni',30,20,'dhaka');
INSERT INTO COMPANY VALUES('Grameenphone',15,5,'dhaka');
INSERT INTO COMPANY VALUES('Airtel',10,7,'dhaka');
INSERT INTO COMPANY VALUES('Banglalink',30,20,'dhaka');
INSERT INTO COMPANY VALUES('Robi',30,20,'dhaka');
INSERT INTO COMPANY VALUES('Ryans',20,12,'dhaka');
	  

delete  from COMPANY  where CompanyName='Apex';
delete  from COMPANY  where CompanyName='Bata';
INSERT INTO COMPANY(CompanyName,NUmnerOfAllowableInterns,CurrentInterns,CompanyLocation)
VALUES('Rayns',20,12,'dhaka')

--DROP TABLE INTERNSHIP_DETAILS
--DROP TABLE COMPANY
--DROP TABLE INTERNSHIP_APPLICATION_FORM
--DROP TABLE STUDENT_DATA