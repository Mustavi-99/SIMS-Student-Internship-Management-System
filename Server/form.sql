SET SERVEROUTPUT ON;
SET VERIFY OFF;


PROMPT Intern Application Form
ACCEPT sn CHAR PROMPT 'Student Name: '
ACCEPT se CHAR PROMPT 'Student Email: '
ACCEPT sp CHAR PROMPT 'Password: '
ACCEPT sc NUMBER PROMPT 'Student Contact No: '
ACCEPT sa CHAR PROMPT 'Student Address: '
ACCEPT dn CHAR PROMPT 'Department Name: '
ACCEPT cy NUMBER PROMPT 'Current Year: '
ACCEPT cs NUMBER PROMPT 'Current Semester: '
ACCEPT cg NUMBER PROMPT 'CGPA: '
ACCEPT cp CHAR PROMPT 'Company Preference: '

CREATE OR REPLACE FUNCTION loginCheck(n IN INTERN_DETAILS.StudentName%TYPE)
RETURN number
IS
ex NUMBER:= -1;
BEGIN
	SELECT StuRegId into ex FROM INTERN_DETAILS where StudentName = n;
	RETURN ex;
END loginCheck;
/

DECLARE
 co NUMBER;
 lc NUMBER;
 ins VARCHAR2(100) := 'Not Approved';
BEGIN
	SELECT max(StuRegId) INTO co FROM INTERN_DETAILS;
	lc := loginCheck('&sn');
	IF lc != -1 THEN
		DBMS_OUTPUT.PUT_LINE('User Name already exixsts.');
	END IF;
	
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		IF '&dn' = 'CSE' OR '&dn' = 'cse' THEN
			INSERT INTO INTERN_DETAILS VALUES (co+1,'&sn','&se','&sp',&sc,'&sa',ins);
			INSERT INTO INTERN_DETAILS@site2 VALUES (co+1,'CSE',&cy,&cs,&cg,'&cp',ins);
		ELSIF '&dn' = 'EEE' OR '&dn' = 'eee' THEN
			INSERT INTO INTERN_DETAILS VALUES (co+1,'&sn','&se','&sp',&sc,'&sa',ins);
			INSERT INTO INTERN_DETAILS@site1 VALUES (co+1,'EEE',&cy,&cs,&cg,'&cp',ins);
		ELSE
			DBMS_OUTPUT.PUT_LINE('Department not allowed.');
		END IF;
END;
/
COMMIT;