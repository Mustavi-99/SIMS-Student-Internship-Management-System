 SET SERVEROUTPUT ON;
 SET VERIFY OFF;
 
 
 PROMPT Student Details(EEE)


CREATE OR REPLACE PROCEDURE showStudents
IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('ID'||CHR(09)||'Email'||CHR(09)||CHR(09)||CHR(09)||'PhoneNo'||CHR(09)||CHR(09)||'Year'||CHR(09)||'Sem'||CHR(09)||'CGPA'||CHR(09)||'Company_preference'||CHR(09)||'Intern_status');
	FOR R in (select * from INTERN_DETAILS ind natural join INTERN_DETAILS@midas_site im) LOOP 
		DBMS_OUTPUT.PUT_LINE(R.sturegid ||CHR(09)||R.studentemail ||CHR(09)||R.studentphoneno ||CHR(09)||R.currentyear||CHR(09)||R.currentsemester||CHR(09)||R.cgpa||CHR(09)||R.companypreference||CHR(09)||CHR(09)||CHR(09)||R.internstatus);
		--DBMS_OUTPUT.PUT_LINE(R.sturegid ||CHR(09)||R.currentyear||CHR(09)||R.currentsemester||CHR(09)||R.cgpa||CHR(09)||CHR(09)||CHR(09)||R.companypreference||CHR(09)||CHR(09)||CHR(09)||R.internstatus);
		--DBMS_OUTPUT.PUT_LINE(R.sturegid||' '||R.currentyear);
	end LOOP;
END showStudents;
/


exec showStudents;