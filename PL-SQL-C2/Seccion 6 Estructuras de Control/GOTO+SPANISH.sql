DECLARE
  p  VARCHAR2(30);
  n  PLS_INTEGER :=5;
BEGIN
  FOR j in 2..ROUND(SQRT(n)) LOOP
    IF n MOD j = 0 THEN
      p := ' no es un número primo';
      GOTO print_now;
    END IF;
  END LOOP;

  p := ' Es un número primo';
 
  <<print_now>>
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(n) || p);
END;
/