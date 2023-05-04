SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT  regid number prompt 'Enter Student Register ID: '

CREATE OR REPLACE PACKAGE updatePack AS

	FUNCTION loginCheck(n IN number, cp out INTERN_DETAILS.CompanyPreference%TYPE,ci out number)
	RETURN number;
	
	PROCEDURE updateInfo(c IN number,ci in number,cp in INTERN_DETAILS.CompanyPreference%TYPE);
END updatePack;
/
CREATE OR REPLACE PACKAGE BODY updatePack AS

FUNCTION loginCheck(n IN number, cp out INTERN_DETAILS.CompanyPreference%TYPE,ci out number)
RETURN number
IS
--cp varchar2(200);
ex NUMBER:= -1;
BEGIN
	SELECT StuRegId,CompanyPreference  into ex,cp FROM INTERN_DETAILS where sturegid = n;
	
	SELECT CurrentInterns into ci FROM COMPANY where CompanyName = cp;
	RETURN ex;
END loginCheck;

PROCEDURE updateInfo(c IN number,ci in number,cp in INTERN_DETAILS.CompanyPreference%TYPE)
IS
BEGIN
	update INTERN_DETAILS set InternStatus='Approved' where sturegid=c;
	update INTERN_DETAILS@midas_site set InternStatus='Approved' where sturegid=c;
	update Company set CurrentInterns = ci+1 where companyName = cp;
	update Company@midas_site set CurrentInterns = ci+1 where companyName = cp;
END updateInfo;
END updatePack;
/

DECLARE
	c number;
	ci number;
	cp INTERN_DETAILS.CompanyPreference%TYPE;
BEGIN
	c := updatePack.loginCheck(&regid,cp,ci);
	IF c!= -1 THEN
	updatePack.updateInfo(c,ci,cp);
   END IF;
   EXCEPTION
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('No student found with this ID.');
END;
/
commit;
