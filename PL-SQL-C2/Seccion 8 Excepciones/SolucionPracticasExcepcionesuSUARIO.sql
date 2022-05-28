/*Crear una Excepción personalizada denominada CONTROL_REGIONES.
o Debe dispararse cuando al insertar o modificar una región queramos poner una clave superior a 200. Por ejemplo usando una variable con ese valor.
o En ese caso debe generar un texto indicando algo así como “Codigo no permitido. Debe ser inferior a 200”
o Recordemos que las excepciones personalizadas deben dispararse de forma manual con el RAISE.*/


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
dbms_output.put_line('El codigo debe ser inferior a 200');
when others then
dbms_output.put_line(SQLcode);
dbms_output.put_line(SQLERRM);
END;
/

Edit