SET SERVEROUTPUT ON;
SET VERIFY OFF;

PROMPT ENTER COMPANY DETAILS
ACCEPT cn CHAR PROMPT 'Company Name: '
ACCEPT noi number PROMPT 'Number of Allowable Interns: '
ACCEPT ci number PROMPT 'Company Interns: '
ACCEPT cl char PROMPT 'Company Location: '


DECLARE 
 BEGIN
  INSERT into COMPANY values ('&cn',&noi,&ci,'&cl');
  INSERT into COMPANY@midas_site values ('EEE','&cn',&noi,&ci,'&cl');
 END;
 /
 commit;