set serveroutput on;

DECLARE
    empleados number; 
BEGIN
    empleados := total_empleados();
    dbms_output.put_line('Total Empleados:  ' || empleados);

END;
/


-- llamar la funcion directamente
select total_empleados from dual;