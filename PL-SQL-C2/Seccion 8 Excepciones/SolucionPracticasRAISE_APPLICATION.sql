/*Modificar la practica anterior para disparar un error con RAISE_APPLICATION en vez de con PUT_LINE. Esto permite que la aplicación pueda capturar y gestionar el error que devuelve el PL/SQL*/

SET SERVEROUTPUT ON
DECLARE
CONTROL_REGIONES EXCEPTION;
CODIGO NUMBER:=201;
BEGIN
if codigo > 200 then
raise control_regiones;
else
INSERT INTO REGIONS VALUES (CODIGO,'PRUEBA');
end if;
exception
when control_regiones then
RAISE_APPLICATION_ERROR(-20001,'El codigo debe ser inferior a 200');

when others then
dbms_output.put_line(SQLcode);
dbms_output.put_line(SQLERRM);
END;
/