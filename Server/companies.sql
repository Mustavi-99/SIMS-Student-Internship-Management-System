SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE

BEGIN
DBMS_OUTPUT.PUT_LINE('---------------------------');
DBMS_OUTPUT.PUT_LINE('CSE');
DBMS_OUTPUT.PUT_LINE('---------------------------');
DBMS_OUTPUT.PUT_LINE('Name'||CHR(09)||'Allowable Interns'||CHR(09)||'Current Interns'||CHR(09)||CHR(09)||'Location');
FOR R IN (select * from COMPANY where CompanyType = 'CSE') loop
 DBMS_OUTPUT.PUT_LINE(R.companyname||CHR(09)||R.NUmnerOfAllowableInterns||CHR(09)||CHR(09)||CHR(09)||R.currentinterns||CHR(09)||CHR(09)||CHR(09)||R.companylocation);
end loop; 
DBMS_OUTPUT.PUT_LINE('---------------------------');
DBMS_OUTPUT.PUT_LINE('EEE');
DBMS_OUTPUT.PUT_LINE('---------------------------');
DBMS_OUTPUT.PUT_LINE('Name'||CHR(09)||'Allowable Interns'||CHR(09)||'Current Interns'||CHR(09)||CHR(09)||'Location');
FOR R IN (select * from COMPANY where CompanyType = 'EEE') loop
 DBMS_OUTPUT.PUT_LINE(R.companyname||CHR(09)||R.NUmnerOfAllowableInterns||CHR(09)||CHR(09)||CHR(09)||R.currentinterns||CHR(09)||CHR(09)||CHR(09)||R.companylocation);
end loop; 
END;
/