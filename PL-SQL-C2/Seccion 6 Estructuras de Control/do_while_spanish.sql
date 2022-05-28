DECLARE
  done  BOOLEAN := FALSE;
  X NUMBER:=0;
BEGIN
  
  WHILE X <10 LOOP
    DBMS_OUTPUT.PUT_LINE(X);
    X:=X+1;
    EXIT WHEN X=5;
  END LOOP;
  WHILE done LOOP
    DBMS_OUTPUT.PUT_LINE ('No imprimas esto.');
    done := TRUE;  
  END LOOP;

  WHILE NOT done LOOP
    DBMS_OUTPUT.PUT_LINE ('He pasado por aquí');
    done := TRUE;
  END LOOP;
END;
/