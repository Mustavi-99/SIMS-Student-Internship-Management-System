---Project Name:Student Internship Management System
---Name:Mustavi Ibne Masum (ID-180204040)
---Name:Yumna Islam (ID-180204046)
---Name:Farhana Azad (ID-180204068)
---Group-A2


--select * from FACULTY_LOGI
-----INTERNSHIP_DETAILS table
CREATE TABLE INTERNSHIP_DETAILS
(
InternId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
StudentRegisterId int NOT NULL  FOREIGN KEY REFERENCES INTERNSHIP_APPLICATION_FORM(StudentRegisterId),
InternshipTitle varchar(50)  NULL ,
InternshipEmployer varchar(50) NULL,
InternshipDescription varchar(500) NOT NULL,
Internshipstartdate DateTime NULL,
InternshipDuration varchar(50) NULL,
Stipend float  NULL
)
-----Queries for INTERNSHIP_DETAILS table
INSERT INTO INTERNSHIP_DETAILS(StudentRegisterId,InternshipTitle,InternshipEmployer,InternshipDescription,Internshipstartdate,InternshipDuration,Stipend)
VALUES(3,'Agni','lallal','xyz', '2021/10/20','six months',6000)
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
StudentName varchar(50) NOT NULL,
StudentEmail varchar(100) NOT NULL,
StudentPassword varchar(50) NOT NULL,
StudentPhoneNo int NOT NULL,
StudentAddress varchar(100),
DepartmentName varchar(50) NOT NULL,
CONSTRAINT CHECK_CurrentYear
check(CurrentYear>=3),
CurrentSemester int NOT NULL,
CGPA float NOT NULL,
FieldOfInterest varchar(500) NULL, 
CompanyPreference varchar(200),
InternStatus varchar(50) NULL  DEFAULT  'Not Approved',
)
INSERT INTO INTERN_DETAILS VALUES(1,'Munshi','gh@gmail.com','123',0197123,'dhaka');
INSERT INTO INTERN_DETAILS VALUES(2,'Farhana','farhana68@gmail.com','12345',01912345678,'dhaka');
INSERT INTO INTERN_DETAILS VALUES(3,'Yumna','yumna46@gmail.com','123456',01971236789,'dhaka');
INSERT INTO INTERN_DETAILS VALUES(4,'Suzana','SuzaShouts@gmail.com','123456',01971236987,'dhaka');
INSERT INTO INTERN_DETAILS VALUES(5,'Mehnaj','blackforest@gmail.com','12345',01971236798,'dhaka');
INSERT INTO INTERN_DETAILS VALUES(6,'Mustavi','musta40@gmail.com','12345',01971326789,'dhaka');
INSERT INTO INTERN_DETAILS VALUES(7,'Tarik','aziz61@gmail.com','1234567',01912736789,'dhaka');
INSERT INTO INTERN_DETAILS VALUES(8,'Rawna','beymax62@gmail.com','12345',01973216789,'dhaka');
INSERT INTO INTERN_DETAILS VALUES(9,'Alvee','sadman74@gmail.com','12345',01971763289,'dhaka');
INSERT INTO INTERN_DETAILS VALUES(10,'Rusu','ruslan58@gmail.com','123456',019712367879,'dhaka');
--SELECT * from INTERNSHIP_APPLICATION_FORM


----COMPANY table
CREATE TABLE COMPANY(
--CompanyId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
CompanyType varchar2(50) NOT NULL,
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
INSERT INTO COMPANY VALUES('CSE','Agni',30,20,'dhaka');
INSERT INTO COMPANY VALUES('CSE','Grameenphone',15,5,'dhaka');
INSERT INTO COMPANY VALUES('CSE','Airtel',10,7,'dhaka');
INSERT INTO COMPANY VALUES('CSE','Banglalink',30,20,'dhaka');
INSERT INTO COMPANY VALUES('CSE','Robi',30,20,'dhaka');
INSERT INTO COMPANY VALUES('CSE','Ryans',20,12,'dhaka');

INSERT INTO COMPANY VALUES('EEE','Siemens',30,20,'dhaka');
INSERT INTO COMPANY VALUES('EEE','Runner',10,5,'Rajshahi');
INSERT INTO COMPANY VALUES('EEE','Petrobangla',19,6,'Khulna');
INSERT INTO COMPANY VALUES('EEE','Imperial Electricals',14,10,'Chittagong');
INSERT INTO COMPANY VALUES('EEE','Presma',30,20,'dhaka');


