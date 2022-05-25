
Create or replace function mayor_entre ( x in number, y in number )
return number
IS

BEGIN

  IF( x > y ) THEN
      return x;
  ELSE
      return y;
  END IF;


END;
/

--- Forma de llamar la funcion 

set serveroutput on;

DECLARE
    a number := 10; 
    b number := 25; 
    z number := 0; 
BEGIN
    z := mayor_entre(a,b);
    dbms_output.put_line('El mayor es:  ' || z);

END;
/

select mayor_entre(3,2) from dual;

