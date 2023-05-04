CREATE OR REPLACE VIEW internview as 
SELECT * from intern_details@site1
union
SELECT * from intern_details@site2;

SET SERVEROUTPUT ON;
SET VERIFY OFF;
 
 
PROMPT Student Details
PROMPT - - - - - - - - - - - - - - - - - - - - - 


CREATE OR REPLACE PROCEDURE showStudents
IS
BEGIN

	DBMS_OUTPUT.PUT_LINE('ID'||CHR(09)||'Name'||CHR(09)||'Email'||CHR(09)||CHR(09)||CHR(09)||'Phoneno'||CHR(09)||CHR(09)||'Address'||CHR(09)||'Dept'||CHR(09)||'Year'||CHR(09)||'Sem'||CHR(09)||'CGPA'||CHR(09)||'Company'||CHR(09)||'Intern_status');
	DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------');
	FOR R in (select * from INTERN_DETAILS natural join internview) LOOP 
		DBMS_OUTPUT.PUT_LINE(R.sturegid||CHR(09)||R.studentname||CHR(09)||R.studentemail||CHR(09)||R.studentphoneno||CHR(09)||R.studentaddress||CHR(09)||R.departmentname||CHR(09)||R.CURRENTYear||CHR(09)||R.CURRENTsemester||CHR(09)||R.cgpa||CHR(09)||R.Companypreference||CHR(09)||R.internstatus);
		--DBMS_OUTPUT.PUT_LINE(R.sturegid||CHR(09)||R.studentemail||CHR(09)||R.studentphoneno);
	end LOOP;
END showStudents;
/


exec showStudents;
