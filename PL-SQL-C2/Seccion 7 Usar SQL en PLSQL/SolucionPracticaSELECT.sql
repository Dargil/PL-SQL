--PR�CTICAS SQL BUENA
--practica 1
SET SERVEROUTPUT ON
DECLARE
salario_maximo EMPLOYEES.SALARY%TYPE;
BEGIN
SELECT MAX(SALARY) INTO salario_maximo
FROM EMPLOYEES
WHERE DEPARTMENT_ID=100;
DBMS_OUTPUT.PUT_LINE('el salario m�ximo de ese departamento es:'||salario_maximo);
END;

--Pr�ctica 2
set serveroutput on
DECLARE
    TIPO_TRABAJO employees.JOB_ID%TYPE;
BEGIN
    select job_id into tipo_trabajo from employees
    where employee_id=100;
         dbms_output.put_line('El tipo de trabajo del empleado 100 es:'||tipo_trabajo);
end;
/

-- Pr�ctica 3
set serveroutput on
DECLARE
    COD_DEPARTAMENTO DEPARTMENTS.DEPARTMENT_ID%TYPE:=10;
    NOM_DEPARTAMENTO DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    NUM_EMPLE NUMBER;
BEGIN
   --RECUPERAR EL NOMBRE DEL DEPARTAMENTO
   SELECT DEPARTMENT_NAME INTO NOM_DEPARTAMENTO FROM DEPARTMENTS WHERE DEPARTMENT_ID=COD_DEPARTAMENTO;
   --RECUPERAR EL N�MERO DE EMLEADOS DEL DEPARTAMENTO
   SELECT COUNT(*) INTO NUM_EMPLE FROM EMPLOYEES WHERE DEPARTMENT_ID=COD_DEPARTAMENTO;
   DBMS_OUTPUT.PUT_LINE('EL DEPARTAMENTO '||NOM_DEPARTAMENTO||' TIENE '||NUM_EMPLE||' EMPLEADOS');
END;
/


-- Pr�ctica 4
DECLARE
   MAXIMO NUMBER;
   MINIMO NUMBER;
   DIFERENCIA NUMBER;
BEGIN
    SELECT MAX(SALARY),MIN(SALARY) INTO MAXIMO,MINIMO
    FROM EMPLOYEES;
     DBMS_OUTPUT.PUT_LINE('EL SALARIO M�XIMO ES:'||MAXIMO);
     DBMS_OUTPUT.PUT_LINE('EL SALARIO M�NIMO ES:'||MINIMO);
     DIFERENCIA:=MAXIMO-MINIMO;
     DBMS_OUTPUT.PUT_LINE('LA DIFERENCIA ES:'||DIFERENCIA);
END;
/
     
     