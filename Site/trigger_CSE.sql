SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER updateIS 
AFTER UPDATE
OF InternStatus
ON INTERN_DETAILS
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Intern status is updated.');
END;
/

CREATE OR REPLACE TRIGGER companyIn 
After INSERT
ON Company

BEGIN
	DBMS_OUTPUT.PUT_LINE('Company is inserted.');
END;
/


--CREATE OR REPLACE TRIGGER companyInSite 
--AFTER INSERT
--ON Company@midas_site
--DECLARE
--BEGIN
	--DBMS_OUTPUT.PUT_LINE('Company is inserted in site.');
--END;
--/

CREATE OR REPLACE TRIGGER internsDetail 
AFTER INSERT
ON INTERNSHIP_DETAILS
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Internship details is updated.');
END;
/

commit;







