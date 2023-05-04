 SET SERVEROUTPUT ON;
 SET VERIFY OFF;
 
 
 PROMPT Internship Details Show


CREATE OR REPLACE PROCEDURE showInternshipDetails
IS
BEGIN

	DBMS_OUTPUT.PUT_LINE('Reg ID'||CHR(09)||CHR(09)||'Title'||CHR(09)||'Employer'||CHR(09)||'Description'||CHR(09)||'Start date'||CHR(09)||'Duration(months)'||CHR(09)||'Stipend');
	FOR R in (select * from INTERNSHIP_DETAILS) LOOP 
		DBMS_OUTPUT.PUT_LINE(R.StudentRegisterId ||CHR(09)||CHR(09)||R.InternshipTitle||CHR(09)||R.InternshipEmployer||CHR(09)||CHR(09)||R.InternshipDescription||CHR(09)||R.Internshipstartdate||CHR(09)||R.InternshipDuration||CHR(09)||CHR(09)||CHR(09)||R.Stipend);
	
	end LOOP;
END showInternshipDetails;
/


exec showInternshipDetails;