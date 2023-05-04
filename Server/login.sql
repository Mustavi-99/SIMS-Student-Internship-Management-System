SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT un CHAR PROMPT 'User Name: '
ACCEPT pa CHAR PROMPT 'Password: '
CREATE OR REPLACE PACKAGE loginPack AS

	FUNCTION loginCheck(n IN INTERN_DETAILS.StudentName%TYPE,p IN INTERN_DETAILS.StudentPassword%TYPE)
	RETURN number;
	
	PROCEDURE showDetails(A IN number);
END loginPack;
/

CREATE OR REPLACE PACKAGE BODY loginPack AS

FUNCTION loginCheck(n IN INTERN_DETAILS.StudentName%TYPE,p IN INTERN_DETAILS.StudentPassword%TYPE)
RETURN number
IS
ex NUMBER:= -1;
BEGIN
	SELECT StuRegId into ex FROM INTERN_DETAILS where StudentName = n and StudentPassword = p;
	RETURN ex;
END loginCheck;


PROCEDURE showDetails(A IN number)
IS
flag NUMBER:=1;
cou NUMBER:=0;
BEGIN
	FOR M In (SELECT * FROM INTERN_DETAILS where StuRegId = A) LOOP
	 DBMS_OUTPUT.PUT_LINE('Name:'||CHR(09)||M.studentname);
	 DBMS_OUTPUT.PUT_LINE('Email:'||CHR(09)||M.studentemail);
	 DBMS_OUTPUT.PUT_LINE('Phone:'||CHR(09)||M.studentphoneno);
	 DBMS_OUTPUT.PUT_LINE('Address:'||CHR(09)||M.studentaddress);
	 DBMS_OUTPUT.PUT_LINE('Internship Status:'||CHR(09)||M.InternStatus);
	IF(M.InternStatus = 'Approved') THEN
		FOR R In (SELECT * FROM INTERN_DETAILS@site1 where StuRegId = A) LOOP
			DBMS_OUTPUT.PUT_LINE('Dept:'||CHR(09)||R.departmentname);
			DBMS_OUTPUT.PUT_LINE('Current Year:'||CHR(09)||R.currentyear);
			DBMS_OUTPUT.PUT_LINE('Current Semester:'||CHR(09)||R.currentsemester);
			DBMS_OUTPUT.PUT_LINE('CGPA:'||CHR(09)||R.cgpa);
			DBMS_OUTPUT.PUT_LINE('Company Preferance:'||CHR(09)||R.CompanyPreference);
			SELECT count(StudentRegisterId) into cou from INTERNSHIP_DETAILS@site1 where StudentRegisterId = A;
			IF (cou > 0) THEN
				FOR S In (SELECT * FROM INTERNSHIP_DETAILS@site1 where StudentRegisterId = A) LOOP
					DBMS_OUTPUT.PUT_LINE('Title:'||CHR(09)||S.InternshipTitle);
					DBMS_OUTPUT.PUT_LINE('Employer:'||CHR(09)||S.InternshipEmployer);
					DBMS_OUTPUT.PUT_LINE('Description:'||CHR(09)||S.InternshipDescription);
					DBMS_OUTPUT.PUT_LINE('Start Date:'||CHR(09)||S.Internshipstartdate);
					DBMS_OUTPUT.PUT_LINE('Duration(months):'||CHR(09)||S.Internshipduration);
					DBMS_OUTPUT.PUT_LINE('Stipend:'||CHR(09)||S.stipend);
				END LOOP;
			ELSE
					DBMS_OUTPUT.PUT_LINE('Internship details yet not updated.');
			END IF;
			flag := 2;
		END LOOP;
		IF (flag = 1) THEN
		FOR R In (SELECT * FROM INTERN_DETAILS@site2 where StuRegId = A) LOOP
			DBMS_OUTPUT.PUT_LINE('Dept:'||CHR(09)||R.departmentname);
			DBMS_OUTPUT.PUT_LINE('Current Year:'||CHR(09)||R.currentyear);
			DBMS_OUTPUT.PUT_LINE('Current Semester:'||CHR(09)||R.currentsemester);
			DBMS_OUTPUT.PUT_LINE('CGPA:'||CHR(09)||R.cgpa);
			DBMS_OUTPUT.PUT_LINE('Company Preferance:'||CHR(09)||R.CompanyPreference);
			SELECT count(StudentRegisterId) into cou from INTERNSHIP_DETAILS@site2 where StudentRegisterId = A;
			IF (cou > 0) THEN
				FOR S In (SELECT * FROM INTERNSHIP_DETAILS@site2 where StudentRegisterId = A) LOOP
					DBMS_OUTPUT.PUT_LINE('Title:'||CHR(09)||S.InternshipTitle);
					DBMS_OUTPUT.PUT_LINE('Employer:'||CHR(09)||S.InternshipEmployer);
					DBMS_OUTPUT.PUT_LINE('Description:'||CHR(09)||S.InternshipDescription);
					DBMS_OUTPUT.PUT_LINE('Start Date:'||CHR(09)||S.Internshipstartdate);
					DBMS_OUTPUT.PUT_LINE('Duration(months):'||CHR(09)||S.Internshipduration);
					DBMS_OUTPUT.PUT_LINE('Stipend:'||CHR(09)||S.stipend);
				END LOOP;
			ELSE
				DBMS_OUTPUT.PUT_LINE('Internship details yet not updated.');
			END IF;
	 --ELSE
		--DBMS_OUTPUT.PUT_LINE('Stipend:'||CHR(09)||S.stipend);
		END LOOP;
		END IF;
	END IF;
	END LOOP;
END showDetails;

END loginPack;
/

DECLARE
	ex NUMBER;
BEGIN
	ex := loginPack.loginCheck('&un','&pa');
	--DBMS_OUTPUT.PUT_LINE(ex);
	loginPack.showDetails(ex);
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('Invalid username/password; Login denied');
END;
/

