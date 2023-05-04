SET SERVEROUTPUT ON;
SET VERIFY OFF;

PROMPT ENTER COMPANY DETAILS
ACCEPT regid number PROMPT 'Enter Student Register ID: '
ACCEPT it char PROMPT 'Enter Internship Title: '
ACCEPT ie char PROMPT 'Enter Internship Employer: '
ACCEPT id char PROMPT 'Enter Internship description: '
ACCEPT isd char PROMPT 'Enter Internship start date(DD/MM/YYYY): '
ACCEPT idu  NUMBER PROMPT 'Enter Internship duration(months): '
ACCEPT stp number PROMPT 'Enter stipend: '


CREATE OR REPLACE FUNCTION approvalCheck(n IN number,ac OUT INTERN_DETAILS.InternStatus%TYPE)
RETURN number
IS
ex number:=-1;
BEGIN
	SELECT InternStatus,sturegid into ac,ex FROM INTERN_DETAILS where StuRegId = n;
	RETURN ex;
END approvalCheck;
/

DECLARE
	ac INTERN_DETAILS.InternStatus%TYPE:='a';
	ex number;
BEGIN
	ex := approvalCheck(&regid,ac);
	IF ac = 'Approved' THEN
--DBMS_OUTPUT.PUT_LINE('Intern approved.');
		INSERT into INTERNSHIP_DETAILS values (&regid,'&it','&ie','&id',TO_DATE('&isd','DD/MM/YYYY'),&idu,&stp);
	ELSE
		DBMS_OUTPUT.PUT_LINE('Intern not approved.');
	END IF;
 
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE('No student found with this ID.');
END;
/
commit;