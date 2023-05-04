SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT un CHAR PROMPT 'User Name: '
ACCEPT pa CHAR PROMPT 'Password: '
CREATE OR REPLACE PACKAGE deletePack AS

	FUNCTION loginCheck(n IN INTERN_DETAILS.StudentName%TYPE,p IN INTERN_DETAILS.StudentPassword%TYPE)
	RETURN number;
	
	PROCEDURE deleteID(A IN number);
END deletePack;
/
CREATE OR REPLACE PACKAGE BODY deletePack AS
FUNCTION loginCheck(n IN INTERN_DETAILS.StudentName%TYPE,p IN INTERN_DETAILS.StudentPassword%TYPE)
RETURN number
IS
ex NUMBER:= -1;
BEGIN
	SELECT StuRegId into ex FROM INTERN_DETAILS where StudentName = n and StudentPassword = p;
	RETURN ex;
END loginCheck;

PROCEDURE deleteID(A IN number)
IS

BEGIN
	DELETE FROM INTERN_DETAILS WHERE sturegId = A;
	DELETE FROM INTERN_DETAILS@site1 WHERE sturegId = A;
	DELETE FROM INTERN_DETAILS@site2 WHERE sturegId = A;
END deleteID;

END deletePack;
/
DECLARE
	ex NUMBER;
BEGIN
	ex := deletePack.loginCheck('&un','&pa');
	--DBMS_OUTPUT.PUT_LINE(ex);
	deletePack.deleteID(ex);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Invalid username/password; Login denied');

END;
/

commit;