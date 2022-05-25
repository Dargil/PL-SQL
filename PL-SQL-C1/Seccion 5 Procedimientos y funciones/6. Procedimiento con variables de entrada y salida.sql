CREATE OR REPLACE PROCEDURE menor_entre( x in number, y in number, z out number) 
IS
BEGIN
    
    IF( X > Y ) THEN
        z := y;
    ELSE
        z := x;
    END IF;
  
END;
/


-- Ejecutar el procedimeito almacenado

set serveroutput on;
DECLARE
    a number := 5;
    b number := 10;
    c number;
BEGIN

    menor_entre(a,b,c);
    dbms_output.put_line('El menor es: ' || c);

END;
/