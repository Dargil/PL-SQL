set serveroutput on
BEGIN
    FOR i IN 5..15 LOOP   --PLS_INTEGER
        dbms_output.put_line(i);
    END LOOP;
END;