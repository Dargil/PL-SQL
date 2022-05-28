/*Crear un bloque inserte un nuevo departamento en la tabla DEPARTMENTS.. Para saber el DEPARTMENTI_ID que debemos asignar al nuevo departamento primero debemos averiguar el valor mayor que hay en la tabla DEPARTMENTS y sumarle uno para la nueva clave.

o Location_id debe ser 1000
o Manager_id debe ser 100
o Department_name debe ser “INFORMATICA”
o NOTA: en PL/SQL debemos usar COMMIT y ROLLBACK de la misma forma que lo hacemos en SQL. Por tanto, para validar definitivamente un cambio debemos usar COMMIT. Podemos
*/

DECLARE
    MAX_ID NUMBER;
BEGIN
    SELECT MAX(DEPARTMENT_ID) INTO MAX_ID FROM DEPARTMENTS;
    MAX_ID:=MAX_ID+1;
    INSERT INTO departments (department_id,department_name,manager_id,location_id)
    VALUES (MAX_ID,'INFORMATICA',100,1000);
    COMMIT;
END;   

/*Creamos un bloque PL/SQL que modifique la LOCATION_ID del nuevo departamento a 1700. En este caso usemos el COMMIT dentro del bloque PL/SQL.*/

BEGIN
UPDATE DEPARTMENTS SET LOCATION_ID=1700
WHERE DEPARTMENT_NAME='INFORMATICA';
COMMIT;
END;

/*Por último hacer otro bloque PL/SQL que elimine ese departamento nuevo.*/


BEGIN
DELETE DEPARTMENTS
WHERE DEPARTMENT_NAME='INFORMATICA';

COMMIT;
END;