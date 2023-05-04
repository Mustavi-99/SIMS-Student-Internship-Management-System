 SET SERVEROUTPUT ON;
 SET VERIFY OFF;
 
 
 PROMPT Company Details


CREATE OR REPLACE PROCEDURE showCompanies
IS
BEGIN

	DBMS_OUTPUT.PUT_LINE('Name'||CHR(09)||CHR(09)||'Allowable Interns'||CHR(09)||'Current Interns'||CHR(09)||CHR(09)||'Location');
	FOR R in (select * from COMPANY) LOOP 
		DBMS_OUTPUT.PUT_LINE(R.CompanyName ||CHR(09)||CHR(09)||R.NUmnerOfAllowableInterns||CHR(09)||CHR(09)||CHR(09)||R.CurrentInterns||CHR(09)||CHR(09)||CHR(09)||CHR(09)||R.CompanyLocation);
		--DBMS_OUTPUT.PUT_LINE(R.sturegid||' '||R.currentyear);
	end LOOP;
END showCompanies;
/


exec showCompanies;