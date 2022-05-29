/*Hacer un programa que tenga un cursor que vaya visualizando los salarios de los empleados.
Si en el cursor aparece el jefe (Steven King) se debe generar un RAISE_APPLICATION_ERROR indicando que el sueldo del jefe no se puede ver
*/

DECLARE
CURSOR C1
IS SELECT first_name,last_name,salary from EMPLOYEES;
BEGIN
for i IN C1
LOOP
IF i.first_name='Steven' AND i.last_name='King'
THEN
raise_application_error(-20300,'El salario del jefe no puede ser visto');
ELSE
DBMS_OUTPUT.PUT_LINE(i.first_name ||' ' || i.last_name || ': '|| i.salary || 'DLS');
END IF;
END LOOP;
END;

/*Hacemos un bloque con dos cursores. (Esto se puede hacer fácilmente con una sola SELECT pero vamos a hacerlo de esta manera para probar parámetros en cursores)
o El primero de empleados
o El segundo de departamentos que tenga como parámetro el MANAGER_ID
o Por cada fila del primero, abrimos el segundo curso pasando el ID del MANAGER
o Debemos pintar el Nombre del departamento y el nombre del MANAGER_ID
o Si el empleado no es MANAGER de ningún departamento debemos poner “No es jefe de nada”
*/
 
SET SERVEROUTPUT ON
DECLARE
DEPARTAMENTO DEPARTMENTS%ROWTYPE;
jefe DEPARTMENTS.MANAGER_ID%TYPE;
CURSOR C1 IS SELECT * FROM EMployees;
CURSOR C2(j DEPARTMENTS.MANAGER_ID%TYPE)
IS SELECT * FROM DEPARTMENTS WHERE MANAGER_ID=j;
begin
for EMPLEADO in c1 loop
open c2(EMPLEADO.employee_id) ;
FETCH C2 into departamento;
if c2%NOTFOUND then
DBMS_OUTPUT.PUT_LINE(EMPLEADO.FIRST_NAME ||' No es JEFE de NADA');
ELSE
DBMS_OUTPUT.PUT_LINE(EMPLEADO.FIRST_NAME || 'ES JEFE DEL DEPARTAMENTO '|| DEPARTAMENTO.DEPARTMENT_NAME);
END IF;
CLOSE C2;
END LOOP;
END;


/*Crear un cursor con parámetros que pasando el número de departamento visualice el número de empleados de ese departamento*/

SET SERVEROUTPUT ON
DECLARE
CODIGO DEPARTMENTS.DEPARTMENT_ID%TYPE;
CURSOR C1(COD DEPARTMENTS.DEPARTMENT_ID%TYPE ) IS SELECT COUNT(*) FROM employeeS
WHERE DEPARTMENT_ID=COD;
NUM_EMPLE NUMBER;
BEGIN
CODIGO:=10;
OPEN C1(CODIGO);
FETCH C1 INTO NUM_EMPLE;
DBMS_OUTPUT.PUT_LINE('numero de empleados de ' ||codigo||' es '||num_emple);
end;


/*Crear un bucle FOR donde declaramos una subconsulta que nos devuelva el nombre de los empleados que sean ST_CLERCK. Es decir, no declaramos el cursor sino que lo indicamos directamente en el FOR.*/


BEGIN

  FOR EMPLE IN(SELECT * FROM EMPLOYEES WHERE JOB_ID='ST_CLERK') LOOP
     DBMS_OUTPUT.PUT_LINE(EMPLE.FIRST_NAME);
    END LOOP;
END;

/*Creamos un bloque que tenga un cursor para empleados. Debemos crearlo con FOR UPDATE.
o Por cada fila recuperada, si el salario es mayor de 8000 incrementamos el salario un 2%
o Si es menor de 800 lo hacemos en un 3%
o Debemos modificarlo con la cláusula CURRENT OF
o Comprobar que los salarios se han modificado correctamente.
*/

SET SERVEROUTPUT ON
DECLARE
CURSOR C1 IS SELECT * FROM EMployees for update;
begin
for EMPLEADO IN C1 LOOP
IF EMPLEADO.SALARY > 8000 THEN
UPDATE EMPLOYEES SET SALARY=SALARY*1.02
WHERE CURRENT OF C1;
ELSE
UPDATE EMPLOYEES SET SALARY=SALARY*1.03
WHERE CURRENT OF C1;
END IF;
END LOOP;
COMMIT;
END ;
