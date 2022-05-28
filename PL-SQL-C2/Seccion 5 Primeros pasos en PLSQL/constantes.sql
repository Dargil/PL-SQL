SET SERVEROUTPUT ON

DECLARE
    x   CONSTANT NUMBER := 10;
    z   NUMBER NOT NULL := 20;
BEGIN
    dbms_output.put_line(x);
    z := 30;
    dbms_output.put_line(z);
END;