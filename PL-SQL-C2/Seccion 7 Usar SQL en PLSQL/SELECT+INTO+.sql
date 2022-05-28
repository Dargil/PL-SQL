SET SERVEROUTPUT ON
DECLARE
    salario   NUMBER;
    NOMBRE EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT  --SOLO PUEDE DEVOLVER UNA FILA
        salary,FIRST_NAME INTO salario,NOMBRE
    FROM
        employees
    WHERE
        employee_id = 100;
    dbms_output.put_line(salario);
      dbms_output.put_line(NOMBRE);
END;