DECLARE
    x   NUMBER := 20;
BEGIN
    IF
        x = 10
    THEN
        dbms_output.put_line('X:=10');
    ELSE
        dbms_output.put_line('X:=OTHER VALUE');
    END IF;
END;