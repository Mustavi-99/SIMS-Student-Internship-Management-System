---Project Name:Student Internship Management System
---Group-A2




-----INTERNSHIP_DETAILS table
CREATE TABLE INTERNSHIP_DETAILS
(
StudentRegisterId int NOT NULL  ,
InternshipTitle varchar(50)  NULL ,
InternshipEmployer varchar(50) NULL,
InternshipDescription varchar(500) NOT NULL,
Internshipstartdate date,
InternshipDuration varchar(50) NULL,
Stipend float  NULL
)
-----Queries for INTERNSHIP_DETAILS table
INSERT INTO INTERNSHIP_DETAILS VALUES(1,3,'Agni','lallal','xyz', TO_DATE('20/10/2021','DD/MM/YYYY'),'six months',6000)

-------INTERNSHIP_APPLICATION_FORM table
CREATE TABLE INTERNSHIP_APPLICATION_FORM 
(
StudentRegisterId int NOT NULL,
StudentName varchar(50) NOT NULL,
StudentEmail varchar(100) NOT NULL,
StudentPassword varchar(50) NOT NULL,
StudentPhoneNo int NOT NULL,
StudentAddress varchar(100),
DepartmentName varchar(50) NOT NULL,
CurrentYear NUMBER,
CONSTRAINT CHECK_CurrentYear
check(CurrentYear>=3),
CurrentSemester int NOT NULL,
CGPA float NOT NULL,
FieldOfInterest varchar(500) NULL,
CompanyPreference varchar(200),
InternStatus varchar(50)  DEFAULT  'Not Approved'
)
INSERT INTO INTERN_DETAILS VALUES(6,'eee',3,1,3.7,'Runner','Not Approved');
INSERT INTO INTERN_DETAILS VALUES(7,'eee',3,2,3.5,'Presma','Not Approved');
INSERT INTO INTERN_DETAILS VALUES(8,'eee',4,1,3.8,'Petrobangla','Not Approved');
INSERT INTO INTERN_DETAILS VALUES(9,'eee',4,2,3.5,'Imperial Electricals','Not Approved');
INSERT INTO INTERN_DETAILS VALUES(10,'eee',3,1,3.4,'Siemens','Not Approved');


INSERT INTO COMPANY VALUES('Siemens',30,20,'dhaka');
INSERT INTO COMPANY VALUES('Runner',10,5,'Rajshahi');
INSERT INTO COMPANY VALUES('Petrobangla',19,6,'Khulna');
INSERT INTO COMPANY VALUES('Imperial Electricals',14,10,'Chittagong');
INSERT INTO COMPANY VALUES('Presma',30,20,'dhaka');


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







----COMPANY table
CREATE TABLE COMPANY(
CompanyName varchar(50) NOT NULL,
NUmnerOfAllowableInterns int NOT NULL,
CurrentInterns int NOT NULL,
CompanyLocation varchar(50) NOT NULL
)

--Select * from COMPANY
INSERT INTO COMPANY(CompanyName,NUmnerOfAllowableInterns,CurrentInterns,CompanyLocation)
VALUES('Siemens',30,20,'dhaka'),
      ('Runner',15,5,'dhaka'),
	  ('Petrobangla',10,7,'dhaka'),
	  ('Imperial Electricals',30,20,'dhaka'),
	  ('Presma',30,20,'dhaka')
	  
Siemens
Runner
Petrobangla
Imperial Electricals
Presma

--DROP TABLE INTERNSHIP_DETAILS
--DROP TABLE COMPANY
--DROP TABLE INTERNSHIP_APPLICATION_FORM
